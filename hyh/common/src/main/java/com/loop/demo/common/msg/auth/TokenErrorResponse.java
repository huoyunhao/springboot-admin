package com.loop.demo.common.msg.auth;


import com.loop.demo.common.constant.CommonConstants;
import com.loop.demo.common.msg.BaseResponse;

/**
 * token错误响应类
 */
public class TokenErrorResponse extends BaseResponse {
    public TokenErrorResponse(String message) {
        super(CommonConstants.TOKEN_ERROR_CODE, message);
    }
}
