package com.loop.demo.common.exception.auth;


import com.loop.demo.common.constant.CommonConstants;
import com.loop.demo.common.exception.BaseException;

/**
 * 用户token自定义运行时异常类
 */
public class UserTokenException extends BaseException {
    public UserTokenException(String message) {
        super(message, CommonConstants.TOKEN_ERROR_CODE);
    }
}
