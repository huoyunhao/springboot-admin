package com.loop.demo.admin.service;


import com.loop.demo.admin.vo.user.JwtAuthenticationRequest;

public interface AuthService {
    /**
     * 登录验证 传入账号密码对象
     * @param authenticationRequest
     * @return
     * @throws Exception
     */
    String login(JwtAuthenticationRequest authenticationRequest) throws Exception;

    String refresh(String oldToken) throws Exception;

    /**
     * 根据token得到用户的信息
     * @param token
     * @throws Exception
     */
    void validate(String token) throws Exception;
}
