package com.imcode.mall.vo;

import java.math.BigDecimal;
import java.util.List;

public class VOrder {

    // 订单商品详情
    private List<VOrderItem> itemList;
    // 商品总数量
    private Integer totalQuantity;
    // 订单总金额
    private BigDecimal totalPrice;
    // 运费
    private BigDecimal freight;
    // 应付金额
    private BigDecimal paymentAmount;

    public List<VOrderItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<VOrderItem> itemList) {
        this.itemList = itemList;
    }

    public Integer getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(Integer totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getFreight() {
        return freight;
    }

    public void setFreight(BigDecimal freight) {
        this.freight = freight;
    }

    public BigDecimal getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(BigDecimal paymentAmount) {
        this.paymentAmount = paymentAmount;
    }
}
