package com.imcode.sys.service;

import com.imcode.common.exception.BizException;
import com.imcode.common.service.AbstractService;
import com.imcode.sys.mapper.UserMapper;
import com.imcode.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService extends AbstractService<User> {

    @Autowired(required = false)
    private UserMapper userMapper;


    public User login(String username, String password) throws BizException {
        User param = new User();
        param.setUsername(username);
        param.setPassword(password);

        User user = userMapper.selectOne(param);
        if(user != null){
            return user;
        }else {
            // 抛出自定义的业务异常
            throw new BizException("用户名或密码错误");
        }
    }
}
