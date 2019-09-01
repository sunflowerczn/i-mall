package com.imcode.sys.controller;


import com.imcode.common.controller.BaseController;
import com.imcode.common.exception.BizException;
import com.imcode.common.model.R;
import com.imcode.sys.model.User;
import com.imcode.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController extends BaseController {


    @Autowired
    private UserService userService;

    @Value("${session.user.key}")
    private String sessionUserKey;

    /**
     * 跳转到系统登录页面
     *
     * @return
     */
    @GetMapping("/login")  //GetMapping PostMapping ReqeustMapping(method=Request.GET)
    public String login() {
        return "login";
    }


    @PostMapping("/login")
    @ResponseBody
    public R login(String username, String password) throws BizException {
        User user = userService.login(username, password);
        // 登录成以后，将用户信息写入session
        session.setAttribute(sessionUserKey, user);
        return R.ok();
    }


    /**
     * 跳转到系统的初始化页面
     *
     * @return
     */
    @GetMapping("/index")
    public String index() {
        return "index_bk";
    }


    /**
     * 退出系统
     * @return
     */
    @GetMapping("/loginout")
    public String loginout(){
        //失效会话
        session.invalidate();
        // 返回登录页面 重定向到系统登录页面
        return "redirect:/login";
    }
}
