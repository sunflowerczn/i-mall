package com.imcode;

import com.imcode.mall.model.Member;
import com.imcode.mall.service.VCartService;
import com.imcode.mall.vo.VCart;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-config.xml")

public class TestCartService
{
    @Autowired
    private VCartService service;

    @Test
    public void test()
    {
        Member user = new Member();
        user.setUsername("1379925991");
        //查看该用户是否有购物车
        VCart cart = service.getCartByUsername(user.getUsername());
        cart = service.addCart(cart,user,5,10);
        System.out.println(cart);
        cart = service.addCart(cart,user,7,5);
        System.out.println(cart);
        cart = service.addCart(cart,user,5,5);
        System.out.println(cart);
    }
}
