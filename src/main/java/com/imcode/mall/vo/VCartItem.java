package com.imcode.mall.vo;

import com.imcode.mall.model.Goods;

import java.math.BigDecimal;

//购物车的一个项目
public class VCartItem
{
    private Goods goods;//对应的商品；
    private int quantity = 1;  //该项购买了几个
    private BigDecimal totalPrice = new BigDecimal(0); //该项目的总价

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
        updateTotalPrice();  //重算总价
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    //该购物车项目的总价
    public void updateTotalPrice()
    {
        totalPrice = new BigDecimal(goods.getPrice().floatValue()*quantity);
        totalPrice = totalPrice.setScale(2,BigDecimal.ROUND_HALF_DOWN);
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }
}
