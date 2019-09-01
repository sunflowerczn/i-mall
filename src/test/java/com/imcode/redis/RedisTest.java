package com.imcode.redis;

import com.alibaba.fastjson.JSON;
import com.imcode.mall.model.Banner;
import com.imcode.mall.model.Goods;
import com.imcode.mall.model.Member;
import com.imcode.mall.service.VCartService;
import com.imcode.mall.vo.VCart;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.concurrent.TimeUnit;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-config.xml")
public class RedisTest {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private RedisTemplate<String, Goods> redisTemplate;

    @Autowired
    private VCartService service;
    @Test
    public void test02()  //测试字符串类型
    {
        stringRedisTemplate.opsForValue().append("kkk","我是老k");//存储String类型
        //设置key的过期时间
       stringRedisTemplate.expire("kkk",15, TimeUnit.SECONDS);
        System.out.println(stringRedisTemplate.opsForValue().get("kkk"));
    }

    @Test
    public void test_savecart()   //测试hash类型。
    {
       // key 为用户名  ，value是hash数据，hash的key=cart,value=购物车的json格式
        Member user = new Member();
        user.setUsername("13799255991");
        VCart cart = service.addCart(null,user,5,1);
        redisTemplate.opsForHash().put("13799255991","cart",JSON.toJSONString(cart));
    }

    @Test
    public void test_readcart()   //测试hash类型。
    {
        String json = (String) redisTemplate.opsForHash().get("13799255991","cart");
        System.out.println(json);
        VCart cart = JSON.parseObject(json,VCart.class);
        System.out.println(cart.getTotalCount());
    }
}
