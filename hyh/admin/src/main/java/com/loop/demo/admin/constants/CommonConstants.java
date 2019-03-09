package com.loop.demo.admin.constants;

/**
 */
public interface CommonConstants {
    //资源类型
    String RESOURCE_TYPE_MENU = "menu";
    String RESOURCE_TYPE_BTN = "button";
    //token异常
    Integer EX_TOKEN_ERROR_CODE = 40101;
    //用户token异常
    Integer EX_USER_INVALID_CODE = 40102;
    //客户端token异常
    Integer EX_CLIENT_INVALID_CODE = 40131;
    Integer EX_CLIENT_FORBIDDEN_CODE = 40331;
    Integer EX_OTHER_CODE = 500;
    //应用上下文
    String CONTEXT_KEY_USER_ID = "currentUserId";
    String CONTEXT_KEY_USERNAME = "currentUserName";
    String CONTEXT_KEY_USER_NAME = "currentUser";
    String CONTEXT_KEY_USER_TOKEN = "currentUserToken";
    //jwt自定义变量
    String JWT_KEY_USER_ID = "userId";
    String JWT_KEY_NAME = "name";
}
