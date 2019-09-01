package com.imcode.common.util;

import com.alibaba.fastjson.JSON;
import com.imcode.mall.model.Goods;
import com.imcode.mall.vo.VCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

@Component
public class RedisUtil {
    @Autowired
    private  RedisTemplate<String, Goods> redisTemplate;

    public  void saveCartToRedis(VCart cart)
    {
        redisTemplate.opsForHash().put(cart.getUser().getUsername()
                ,"cart", JSON.toJSONString(cart));
    }

    public  VCart readCartFromRedis(String username)
    {
        String json = (String) redisTemplate.opsForHash().get(username,"cart");
        if (json==null)
            return null;
        VCart cart = JSON.parseObject(json,VCart.class);
        return cart;
    }
}
