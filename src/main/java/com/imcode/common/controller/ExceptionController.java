package com.imcode.common.controller;

import com.imcode.common.exception.BizException;
import com.imcode.common.model.R;

import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 统一异常处理器
 */
@RestControllerAdvice
public class ExceptionController {

    /**
     * 400 - Bad Request
     */

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public R handlerHttpMessageNotReadableException(HttpMessageNotReadableException e) {
        return R.error("参数解析失败" + e.getMessage(),400);
    }


    /**
     * 405 -  Method Not Allowed
     */
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public R handlerHttpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {

        return R.error("不支持当前请求方法" + e.getMessage(),400);
    }


    /**
     * 415 -  Unsupported Media Type
     */
    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public R handlerHttpMediaTypeNotSupportedException(HttpMediaTypeNotSupportedException e) {

        return R.error("不支持当前媒体类型" + e.getMessage(),400);
    }


    /**
     * 自定义业务异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(BizException.class)
    public R handlerBizException(BizException e) {
        e.printStackTrace();

        return R.error(e.getMessage());
    }


    /**
     * 处理Exception异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(Exception.class)
    public R handlerException(Exception e) {
        e.printStackTrace();
        return R.error(e.getMessage());
    }
}