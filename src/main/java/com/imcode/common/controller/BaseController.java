package com.imcode.common.controller;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class BaseController  {

    @Autowired(required = false)
    public HttpSession session;

    @Autowired(required = false)
    public HttpServletRequest request;
}