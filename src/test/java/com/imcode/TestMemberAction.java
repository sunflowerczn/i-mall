package com.imcode;

import com.imcode.common.model.R;
import com.imcode.mall.controller.MemberAction;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-config.xml")

public class TestMemberAction
{
    @Autowired
    private MemberAction action;

    @Test
    public void test()
    {
        R r = action.doLogin("13799255991","12345678");
        System.out.println(r);
    }
}
