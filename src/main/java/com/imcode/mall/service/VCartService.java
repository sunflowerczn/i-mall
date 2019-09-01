package com.imcode.mall.service;


import com.alibaba.fastjson.JSON;
import com.imcode.common.util.RedisUtil;
import com.imcode.mall.model.Goods;
import com.imcode.mall.model.Member;
import com.imcode.mall.vo.VCart;
import com.imcode.mall.vo.VCartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.util.HashMap;
import java.util.Map;

//专门用于操作购物车的业务类
@Service
public class VCartService
{
    //清空购物车
    public  void clearCart(VCart cart)
    {
        cart.getItems().clear();
        cart.updateTotalPrice(); //修改总价
    }

    @Autowired(required = false)
    private Mapper<Goods>  goodsMapper; //持有一个数据库操作的对象，用于查询商品信息

    @Autowired
    private RedisUtil redis;
    //添加购物车.返回添加后的购物车
    //难点：对于购物车中已有的商品，数量累计。否则 创建一个购物车项放入数组中。
    public VCart addCart(VCart cart, Member user, int goodId, int quantity)
    {
        //对于第一次添加，需要创建购物车对象！
        if (cart==null) {
            cart = new VCart();
            cart.setUser(user);
            //第1次创建购物车，要存入全局的内存或redis中
            //allCarts.put(user.getUsername(),cart);
        }
        for(VCartItem item:cart.getItems())
        {
            if (item.getGoods().getId()==goodId) //已经存在
            {
                //数量累计
                item.setQuantity(item.getQuantity()+quantity);

                cart.updateTotalPrice(); //修改总价
                cart.updateTotalCount();
                redis.saveCartToRedis(cart);//使用redis存储购物车
                return cart;
            }
        }
        //如果之前没有添加，则创建1个购物车项并放入购物车
        VCartItem item = new VCartItem();

        Goods goods= goodsMapper.selectByPrimaryKey(goodId);
        item.setGoods(goods);
        item.setQuantity(quantity);//设置数量和总价
        cart.getItems().add(item);
        cart.updateTotalPrice(); //修改总价
        cart.updateTotalCount();
        redis.saveCartToRedis(cart);//使用redis存储购物车
        return cart;
    }

    //记录着所有人的购物车对象，key = username ，value 是该用户的购物车
    //public static Map<String,VCart> allCarts = new HashMap<>();

    public VCart getCartByUsername(String username)  //根据用户名，把购物车拿到
    {
        //return allCarts.get(username);
        return redis.readCartFromRedis(username);
    }

    //修改指定购物车项目的数量,传入用户名，商品ID及新的数量
    public VCart updateCartItemQuantity(String username,int goodId ,int newquantity)
    {
        //1 根据用户名，找到购物车
        VCart cart = getCartByUsername(username);
        if (cart==null)
            return null;
        //2  找到原来的购物车项目
        for(VCartItem item:cart.getItems())
        {
            if (item.getGoods().getId()==goodId) //已经存在
            {
                //3修改数量
                item.setQuantity(newquantity);
                item.updateTotalPrice();
                cart.updateTotalPrice();
                cart.updateTotalCount();
                //更新到redis
                redis.saveCartToRedis(cart);//使用redis存储购物车
                return cart;
            }
        }
        return null;
    }

    //删除购物车项目
    public VCart clearCartItem(String username,int goodId)
    {
        //1 根据用户名，找到购物车
        VCart cart = getCartByUsername(username);
        if (cart==null)
            return null;
        //2  找到原来的购物车项目
        for(VCartItem item:cart.getItems())  //使用只读的Iterator
        {
            if (item.getGoods().getId()==goodId) //已经存在
            {
                //3 删除该项目
                cart.getItems().remove(item);
                cart.updateTotalPrice();
                cart.updateTotalCount();
                //更新到redis
                redis.saveCartToRedis(cart);//使用redis存储购物车
                return cart;
            }
        }
        return null;
    }
}
