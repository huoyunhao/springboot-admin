package com.loop.demo.admin.rest;

import com.loop.demo.admin.annotation.IgnoreUserToken;
import com.loop.demo.admin.config.UserAuthConfig;
import com.loop.demo.admin.service.AuthService;
import com.loop.demo.admin.vo.user.JwtAuthenticationRequest;
import com.loop.demo.common.msg.ObjectRestResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 登录服务器
 */
@RestController
@RequestMapping("jwt")
@IgnoreUserToken
public class AuthController {
    private Logger log = LoggerFactory.getLogger(AuthController.class);
    @Autowired
    private AuthService authService;
    @Autowired
    UserAuthConfig userAuthConfig;
    /**
     * 获取用户的token
     * @param authenticationRequest  账号密码封装类
     * @return
     * @throws Exception
     */

    @RequestMapping(value = "token", method = RequestMethod.POST)
    public ObjectRestResponse<String> createAuthenticationToken(
            @RequestBody JwtAuthenticationRequest authenticationRequest) throws Exception {
        log.info(authenticationRequest.getUsername()+" require logging...");
        final String token = authService.login(authenticationRequest);
        return new ObjectRestResponse<>().data(token);
    }

    /**
     * 刷新token 传入旧的token 获取用户信息  然后根据用户信息构造新的token
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "refresh", method = RequestMethod.GET)
    public ObjectRestResponse<String> refreshAndGetAuthenticationToken(
            HttpServletRequest request) throws Exception {
        String token = request.getHeader(userAuthConfig.getTokenHeader());
        String refreshedToken = authService.refresh(token);
        return new ObjectRestResponse<>().data(refreshedToken);
    }

    /**
     * 传入token  获取用户信息
     * @param token
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "verify", method = RequestMethod.GET)
    public ObjectRestResponse<?> verify(String token) throws Exception {
        authService.validate(token);
        return new ObjectRestResponse<>();
    }
}
