package com.loop.demo.admin.constants;

/**
 */
public interface AdminConstant {
    //树根节点
    int ROOT = -1;
    //默认组类型
    int DEFAULT_GROUP_TYPE = 0;
    /**
     * 权限关联类型
     */
    String AUTHORITY_TYPE_GROUP = "group";
    /**
     * 权限资源类型
     */
    String RESOURCE_TYPE_MENU = "menu";
    String RESOURCE_TYPE_BTN = "button";

    String RESOURCE_REQUEST_METHOD_GET = "GET";
    String RESOURCE_REQUEST_METHOD_PUT = "PUT";
    String RESOURCE_REQUEST_METHOD_DELETE = "DELETE";
    String RESOURCE_REQUEST_METHOD_POST = "POST";

    String RESOURCE_ACTION_VISIT = "访问";


    int PW_ENCORDER_SALT = 12;

}
