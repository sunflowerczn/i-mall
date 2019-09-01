package com.imcode.mall.controller;

import com.imcode.common.controller.BaseController;
import com.imcode.common.model.R;
import com.imcode.mall.model.Member;
import com.imcode.mall.service.VCartService;
import com.imcode.mall.vo.VCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//购物车的添加，预览，修改
@Controller
public class CartAction extends BaseController
{
    @Autowired
    private VCartService service;

    @PostMapping("/cart/add")
    @ResponseBody
    public R addCart(int goodsId, int quantity)
    {
        Member user = (Member) session.getAttribute("sessionUser");
        //获得原来的购物车
        VCart cart = service.getCartByUsername(user.getUsername());
        cart = service.addCart(cart, user,goodsId,quantity);  //添加到购物车，返回更新后的购物车
        R r = R.ok("添加成功！");
        r.setData(cart.getTotalCount());  //将商品总数量返回
        return r;
    }

    @GetMapping("/cart")
    public String gotoCartPage()
    {
        return "cart/cart_list";
    }
    @GetMapping("/getcart")
    @ResponseBody   //获取我的购物车数据
    public R getMyCart(String username)
    {
        VCart cart = service.getCartByUsername(username); //获得我的购物车数据
        if (cart!=null)
        {
            R r = R.ok("查询成功！");
            r.setData(cart);//将购物车数据返回
            return r;
        }
        else
        {
            return R.error("不存在购物车数据！");
        }
    }

    @PostMapping("/cart/update")
    @ResponseBody
     public R updateQuantiy(int goodsId,int quantity)
    {
        Member user = (Member) session.getAttribute("sessionUser");
        if (user==null)
            return R.error("请先登录！");
        VCart cart = service.updateCartItemQuantity(user.getUsername(),goodsId,quantity);
        if (cart==null)
            return R.error("修改数量失败，可能已被清空！");
        R r = R.ok("修改数量成功！");
        r.setData(cart);
        //更新session中的购物车数量，便于主页和详情页显示
        session.setAttribute("totalCount",cart.getTotalCount());
        return r;
    }

    @PostMapping("/cart/delete")
    @ResponseBody
    public R deleteCartItem(int goodsId)
    {
        Member user = (Member) session.getAttribute("sessionUser");
        if (user==null)
            return R.error("请先登录！");
        VCart cart = service.clearCartItem(user.getUsername(),goodsId);
        if (cart==null)
            return R.error("清空该项失败，可能已被清空！");
        R r = R.ok("删除该项成功！");
        r.setData(cart);
        //更新session中的购物车数量，便于主页和详情页显示
        session.setAttribute("totalCount",cart.getTotalCount());
        return r;
    }
}
