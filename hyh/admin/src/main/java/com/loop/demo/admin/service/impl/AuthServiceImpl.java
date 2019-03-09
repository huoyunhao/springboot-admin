package com.loop.demo.admin.service.impl;

import com.loop.demo.admin.service.AuthService;
import com.loop.demo.admin.service.PermissionService;
import com.loop.demo.admin.vo.user.UserInfo;
import com.loop.demo.admin.util.user.JWTInfo;
import com.loop.demo.admin.vo.user.JwtAuthenticationRequest;
import com.loop.demo.admin.util.user.JwtTokenUtil;
import com.loop.demo.common.exception.auth.UserTokenException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class AuthServiceImpl implements AuthService {
    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Autowired
    private PermissionService permissionService;

    /**
     * 认证账号密码
     * @param authenticationRequest
     * @return
     * @throws Exception
     */
    @Override
    public String login(JwtAuthenticationRequest authenticationRequest) throws Exception {
        UserInfo info = permissionService.validate(authenticationRequest.getUsername(),authenticationRequest.getPassword());
        if (!StringUtils.isEmpty(info.getId())) {
            return jwtTokenUtil.generateToken(new JWTInfo(info.getUsername(), info.getId() + "", info.getName()));
        }
        throw new UserTokenException("用户不存在或账户密码错误!");
    }

    /**
     * 验证token是否有效
     * @param token
     * @throws Exception
     */
    @Override
    public void validate(String token) throws Exception {
        jwtTokenUtil.getInfoFromToken(token);
    }

    /**
     * 熟悉
     * @param oldToken
     * @return
     * @throws Exception
     */
    @Override
    public String refresh(String oldToken) throws Exception {
        return jwtTokenUtil.generateToken(jwtTokenUtil.getInfoFromToken(oldToken));
    }
}
