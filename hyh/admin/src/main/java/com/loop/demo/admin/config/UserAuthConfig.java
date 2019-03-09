package com.loop.demo.admin.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ace on 2017/9/15.
 */
@Configuration
public class UserAuthConfig {
    //jwt 过去时间
    @Value("${jwt.expire}")
    private int expire;
    @Value("${jwt.token-header}")
    private String tokenHeader;
    // jwt 密钥
    @Value("${jwt.rsa-secret}")
    private String userSecret;
    private byte[] userPubKey;
    private byte[] userPriKey;
    public String getTokenHeader() {
        return tokenHeader;
    }

    public void setTokenHeader(String tokenHeader) {
        this.tokenHeader = tokenHeader;
    }

    public String getToken(HttpServletRequest request){
        return request.getHeader(this.getTokenHeader());
    }



    public String getUserSecret() {
        return userSecret;
    }

    public void setUserSecret(String userSecret) {
        this.userSecret = userSecret;
    }


    public byte[] getUserPubKey() {
        return userPubKey;
    }

    public void setUserPubKey(byte[] userPubKey) {
        this.userPubKey = userPubKey;
    }

    public byte[] getUserPriKey() {
        return userPriKey;
    }

    public void setUserPriKey(byte[] userPriKey) {
        this.userPriKey = userPriKey;
    }

    public int getExpire() {
        return expire;
    }

    public void setExpire(int expire) {
        this.expire = expire;
    }

}
