package com.imcode.mall.vo;

import com.imcode.mall.model.Member;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

//描述1个用户的购物车
public class VCart
{
    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public int getTotalCount() {
        return totalCount;
    }

    //用户信息
    private Member user;
    private List<VCartItem> items = new ArrayList<>(); //根据商品划分的购物车项目
    private BigDecimal totalPrice = new BigDecimal(0); //总价
    private int totalCount = 0;  //总数量。等于各个不同商品购物项目的数量总和

    public void updateTotalCount()
    {
        totalCount = 0;
        for(VCartItem item:items)
        {
            totalCount += item.getQuantity();
        }
    }

    public Member getUser() {
        return user;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public void updateTotalPrice()
    {
        float sum = 0f;
        for(VCartItem item:items)
         {
             sum += item.getTotalPrice().floatValue();
         };
        totalPrice = new BigDecimal(sum);
        totalPrice = totalPrice.setScale(2,BigDecimal.ROUND_HALF_DOWN);
    }

    public void setUser(Member user) {
        this.user = user;
    }

    public List<VCartItem> getItems() {
        return items;
    }

    public void setItems(List<VCartItem> items) {
        this.items = items;
    }

}
