package com.imcode.mall.service;

import com.imcode.common.service.AbstractService;
import com.imcode.mall.model.Member;
import org.springframework.stereotype.Service;

@Service
public class MemberService  extends AbstractService<Member>
{
    //执行登录
    public Member checkLogin(String username,String password)
    {
        Member m = new Member();
        m.setUsername(username);
        m.setPassword(password);
        Member user =  this.findOne(m);
        return user;
    }
}
