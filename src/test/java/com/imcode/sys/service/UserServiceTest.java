package com.imcode.sys.service;

import com.imcode.sys.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-config.xml")
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @Test
    public void test() {
        User user = new User();
        user.setUsername("test2");
        user.setPassword("123456");
        user.setEmail("test@126.com");
        user.setPhone("1377777777");
        userService.add(user);
    }
}