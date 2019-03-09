package com.loop.demo.admin.interceptor;


import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Predicate;
import com.google.common.collect.Collections2;
import com.loop.demo.admin.annotation.IgnoreUserToken;
import com.loop.demo.admin.service.PermissionService;
import com.loop.demo.admin.vo.PermissionInfo;
import com.loop.demo.admin.config.UserAuthConfig;
import com.loop.demo.admin.util.IJWTInfo;
import com.loop.demo.admin.util.user.JwtTokenUtil;
import com.loop.demo.common.context.BaseContextHandler;
import com.loop.demo.common.exception.auth.UserTokenException;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;
import java.util.regex.Pattern;

/**
 * @Auther: 霍运浩
 * @Date: 2019/1/21 0021 11:12
 * @Description:
 */
@Configuration
public class UserAuthRestInterceptor extends HandlerInterceptorAdapter {
    private Logger logger = LoggerFactory.getLogger(UserAuthRestInterceptor.class);
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private UserAuthConfig userAuthConfig;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Value("${url.ignore.startWith}")
    private String startWith;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        if (handler instanceof HandlerMethod)
        {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            // 配置该注解，说明不进行用户拦截  handlerMethod.getBeanType() 获取对象上的注解
            IgnoreUserToken annotation = handlerMethod.getBeanType().getAnnotation(IgnoreUserToken.class);
            // 配置该注解，说明不进行用户拦截  handlerMethod.getMethodAnnotation（）获取方法上的注解
            if (annotation == null) {
                annotation = handlerMethod.getMethodAnnotation(IgnoreUserToken.class);
            }
            if (annotation != null) {
                return super.preHandle(request, response, handler);
            }
        }
        //获取请求的uri
        String requestUri = request.getRequestURI();
        //获取请求的方式
        String method = request.getMethod();
        // 不进行拦截的地址
        if (this.isStartWith(requestUri)) {
            //不进行拦截的地址放行
            return super.preHandle(request, response, handler);
        }

        String token = this.getTokenByReq(request);
        //检验token是否有效 有效获取用户信息  无效抛异常
        IJWTInfo infoFromToken =null;
        try{

            infoFromToken = jwtTokenUtil.getInfoFromToken(token);

        }catch (Exception e){
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            response.setStatus(403);
            PrintWriter out = null ;
            try{
                JSONObject res = new JSONObject();
                res.put("status","403");
                res.put("msg","token异常");
                out = response.getWriter();
                out.append(res.toString());
                return false;
            }catch (Exception e2){
                return false;
            }

        }
        //得到数据库所有的菜单和按钮  说明这个是管控的
        List<PermissionInfo> permissionIfs = permissionService.getAllPermission();
        //得到访问的路径和请求方式和管控的路径和请求方式匹配返回组装为集合
        Collection<PermissionInfo> result =this.getPermissionInfos(permissionIfs, requestUri, method);
        //如果result.size() ==0 则说明 不属于管控的 直接放行
        if(result.size()>0){

            //根据用户的id获取该用户所拥护的权限
            List<PermissionInfo> permissionInfos = permissionService.getPermissionByUsername(infoFromToken.getUniqueName());
                //判断该用户所访问的url，该用户是否用户此权限
                if(this.getPermissionInfos(permissionInfos, requestUri, method).size()>0){
                //如果有则放行
                    BaseContextHandler.setUsername(infoFromToken.getUniqueName());
                    BaseContextHandler.setName(infoFromToken.getName());
                    BaseContextHandler.setUserID(infoFromToken.getId());
                    BaseContextHandler.setToken(token);
                    return super.preHandle(request, response, handler);
                }
//                否则 抛异常
            throw new UserTokenException("用户无权限");
        }
//        不属于管控的url 直接放行
        return super.preHandle(request, response, handler);



    }

    /**
     * 获取token
     *
     * @param request
     * @return
     */
    private String getTokenByReq(HttpServletRequest request) {

        String token = request.getHeader(userAuthConfig.getTokenHeader());
        //判断token 如何请求头中没有  则在请求的Cookie 里面找
        if (StringUtils.isEmpty(token)) {
            if (request.getCookies() != null) {
                for (Cookie cookie : request.getCookies()) {
                    if (cookie.getName().equals(userAuthConfig.getTokenHeader())) {
                        token = cookie.getValue();
                    }
                }
            }
        }
        //请求参数里面找
        if (StringUtils.isEmpty(token)) {
            token = request.getParameter("token");
        }
        return token;
    }

    /**
     * 判断用户的权限
     *
     *
     * @param requestUri
     * @param method
     * @return
     */
    private Collection<PermissionInfo> getPermissionInfos(List<PermissionInfo> serviceInfo,final String requestUri, final String method) {
        return Collections2.filter(serviceInfo, new Predicate<PermissionInfo>() {
            @Override
            public boolean apply(PermissionInfo permissionInfo) {
                String url = permissionInfo.getUri();
                String uri = url.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
                String regEx = "^" + uri + "$";
                return (Pattern.compile(regEx).matcher(requestUri).find() || requestUri.startsWith(url + "/"))
                        && method.equals(permissionInfo.getMethod());
            }
        });
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//        BaseContextHandler.remove();
        super.afterCompletion(request, response, handler, ex);
    }

    /**
     * URI是否以什么打头
     *
     * @param requestUri
     * @return
     */
    private boolean isStartWith(String requestUri) {
        boolean flag = false;
        for (String s : startWith.split(",")) {
            if (requestUri.startsWith(s)) {
                return true;
            }
        }
        return flag;
    }
}
