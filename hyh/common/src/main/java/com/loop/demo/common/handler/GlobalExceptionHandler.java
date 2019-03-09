package com.loop.demo.common.handler;

import com.loop.demo.common.constant.CommonConstants;
import com.loop.demo.common.exception.BaseException;
import com.loop.demo.common.exception.auth.UserTokenException;
import com.loop.demo.common.msg.BaseResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletResponse;

/**
 */
@ControllerAdvice("com.loop.demo")
@ResponseBody
public class GlobalExceptionHandler {
    private Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     *
     * @param response
     * @param ex
     * @return
     */
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(UserTokenException.class)
    public BaseResponse userTokenExceptionHandler(HttpServletResponse response, UserTokenException ex) {
        response.setStatus(401);
        logger.error(ex.getMessage(),ex);
        return new BaseResponse(ex.getStatus(), ex.getMessage());
    }


    @ExceptionHandler(BaseException.class)
    public BaseResponse baseExceptionHandler(HttpServletResponse response, BaseException ex) {
        logger.error(ex.getMessage(),ex);
        response.setStatus(500);
        return new BaseResponse(ex.getStatus(), ex.getMessage());
    }

    @ExceptionHandler(Exception.class)
    public BaseResponse otherExceptionHandler(HttpServletResponse response, Exception ex) {
        response.setStatus(500);
        logger.error(ex.getMessage(),ex);
        return new BaseResponse(CommonConstants.TOKEN_ERROR_CODE, ex.getMessage());
    }

}
