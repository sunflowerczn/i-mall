package com.imcode.mall.controller;

import com.imcode.common.controller.BaseController;
import com.imcode.common.model.R;
import com.imcode.common.util.RedisUtil;
import com.imcode.mall.model.Member;
import com.imcode.mall.service.MemberService;
import com.imcode.mall.vo.VCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//会员的登录，注册，注销。修改信息
@Controller
public class MemberAction extends BaseController
{
    @GetMapping("/login")
    public String toLogin()
    {
        return "login";
    }

    @Autowired
    private MemberService service;

    @Autowired
    private RedisUtil redis;

    @PostMapping("/login")
    @ResponseBody
    public R doLogin(String username,String password)
    {
        Member user = service.checkLogin(username,password);
        if (user!=null)
        {
            session.setAttribute("sessionUser",user); //存入完整的会员信息
            VCart cart = redis.readCartFromRedis(username);//从Redis中获取购物车数据
            if(cart!=null)   //存入购物车总数，便于右上角显示
                session.setAttribute("totalCount",cart.getTotalCount());
            else
                session.setAttribute("totalCount",0);
            R r = R.ok("登录成功！");
            r.setData(user);
            return r;
        }
        else
        {
            return R.error("用户名或密码错误！");
        }
    }
}
