package com.loop.demo.admin.service;

import com.loop.demo.admin.vo.PermissionInfo;
import com.loop.demo.admin.biz.ElementBiz;
import com.loop.demo.admin.biz.MenuBiz;
import com.loop.demo.admin.biz.UserBiz;
import com.loop.demo.admin.constants.AdminConstant;
import com.loop.demo.admin.entity.Element;
import com.loop.demo.admin.entity.Menu;
import com.loop.demo.admin.entity.User;
import com.loop.demo.admin.vo.user.UserInfo;
import com.loop.demo.admin.util.user.JwtTokenUtil;
import com.loop.demo.admin.vo.user.FrontUser;
import com.loop.demo.admin.vo.MenuTree;
import com.loop.demo.common.constant.CommonConstants;
import com.loop.demo.common.util.TreeUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class PermissionService {
    @Autowired
    private UserBiz userBiz;
    @Autowired
    private MenuBiz menuBiz;
    @Autowired
    private ElementBiz elementBiz;
    @Autowired
    JwtTokenUtil jwtTokenUtil;
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);

    /**
     * 用户名得到用户的信息
     * @param username
     * @return
     */
    public UserInfo getUserByUsername(String username) {
        //实例化一个user对象
        UserInfo info = new UserInfo();
        //查询user对象通过用户名
        User user = userBiz.getUserByUsername(username);
        //将获取的用户user 属性赋值给info对象
        BeanUtils.copyProperties(user, info); //TODO BeanUtils
        return info;
    }

    public UserInfo validate(String username,String password){
        UserInfo info = new UserInfo();
        User user = userBiz.getUserByUsername(username);
        if (encoder.matches(password, user.getPassword())) {
            BeanUtils.copyProperties(user, info);
            info.setId(user.getId().toString());
        }
        return info;
    }

    /**
     * 得到所有权限
     * @return
     */
    public List<PermissionInfo> getAllPermission() {
        List<Menu> menus = menuBiz.selectListAll();
        List<PermissionInfo> result = new ArrayList<PermissionInfo>();
        PermissionInfo info = null;
        menu2permission(menus, result);
        List<Element> elements = elementBiz.getAllElementPermissions();
        element2permission(result, elements);
        return result;
    }
    //将用户的菜单放在result
    private void menu2permission(List<Menu> menus, List<PermissionInfo> result) {
        PermissionInfo info=null;
        for (Menu menu : menus) {
            if (StringUtils.isBlank(menu.getHref())) {
                menu.setHref("/" + menu.getCode());
            }
            info = new PermissionInfo();
            info.setCode(menu.getCode());
            info.setType(AdminConstant.RESOURCE_TYPE_MENU);
            info.setName(AdminConstant.RESOURCE_ACTION_VISIT);
            String uri = menu.getHref();
            if (!uri.startsWith("/")) {
                uri = "/" + uri;
            }
            info.setUri(uri);
            info.setMethod(AdminConstant.RESOURCE_REQUEST_METHOD_GET);
            result.add(info);
            info.setMenu(menu.getTitle());
        }
    }
    /**
     *  根据用户名拿到用户的权限
     */
    public List<PermissionInfo> getPermissionByUsername(String username) {
        //先根据用户名拿到用户对象
        User user = userBiz.getUserByUsername(username);
        //根据用户的id去查用户的菜单
        List<Menu> menus = menuBiz.getUserAuthorityMenuByUserId(user.getId());

        List<PermissionInfo> result = new ArrayList<PermissionInfo>();
        PermissionInfo info = null;
        //将用户的菜单放在result
        this.menu2permission(menus, result);
        //根据用户的id查询用户的按钮
        List<Element> elements = elementBiz.getAuthorityElementByUserId(user.getId() + "");
        //将用户的按钮存在result
        this.element2permission(result, elements);
        return result;
    }
    //将用户的按钮存在result
    private void element2permission(List<PermissionInfo> result, List<Element> elements) {
        PermissionInfo info;
        for (Element element : elements) {
            info = new PermissionInfo();
            info.setCode(element.getCode());
            info.setType(element.getType());
            info.setUri(element.getUri());
            info.setMethod(element.getMethod());
            info.setName(element.getName());
            info.setMenu(element.getMenuId());
            result.add(info);
        }
    }

    /**
     * 传入根节点 返回树关系
     * @param menus
     * @param root=-1
     * @return
     */
    private List<MenuTree> getMenuTree(List<Menu> menus, int root) {
        List<MenuTree> trees = new ArrayList<MenuTree>();
        MenuTree node = null;
        for (Menu menu : menus) {
            node = new MenuTree();
            BeanUtils.copyProperties(menu, node);
            trees.add(node);
        }
        return TreeUtil.bulid(trees, root);
    }

    /**
     * 根据token得到用户的信息和菜单 按钮
     * @param token
     * @return
     * @throws Exception
     */
    public FrontUser getUserInfo(String token) throws Exception {
        //得到用户名根据token
        String username = jwtTokenUtil.getInfoFromToken(token).getUniqueName();
        if (username == null) {
            return null;
        }
        //根据用户名得到用户的信息
        UserInfo user = this.getUserByUsername(username);
        FrontUser frontUser = new FrontUser();
        BeanUtils.copyProperties(user, frontUser);
        //根据用户名得到用户的菜单和按钮
        List<PermissionInfo> permissionInfos = this.getPermissionByUsername(username);

        Stream<PermissionInfo> menus = permissionInfos.parallelStream().filter((permission) -> {
            return permission.getType().equals(CommonConstants.RESOURCE_TYPE_MENU);
        });
        //将用户的菜单按钮放进去
        frontUser.setMenus(menus.collect(Collectors.toList()));

        Stream<PermissionInfo> elements = permissionInfos.parallelStream().filter((permission) -> {
            return !permission.getType().equals(CommonConstants.RESOURCE_TYPE_MENU);
        });
        //将用户的按钮放进去
        frontUser.setElements(elements.collect(Collectors.toList()));
        return frontUser;
    }

    public List<MenuTree> getMenusByUsername(String token) throws Exception {
        //先得到用户名
        String username = jwtTokenUtil.getInfoFromToken(token).getUniqueName();
        if (username == null) {
            return null;
        }
        //查询是否又该用户
        User user = userBiz.getUserByUsername(username);
        //获取用户可以访问的菜单
        List<Menu> menus = menuBiz.getUserAuthorityMenuByUserId(user.getId());
        //返回树结构菜单
        return getMenuTree(menus, AdminConstant.ROOT);
    }
}
