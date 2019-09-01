package com.imcode.mall.model;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "mall_order_item")
public class OrderItem {
    @Id
    private Integer id;

    /**
     * 订单id
     */
    @Column(name = "order_number")
    private String orderNumber;

    /**
     * 商品id
     */
    @Column(name = "goods_id")
    private Integer goodsId;

    /**
     * 商品名称
     */
    @Column(name = "goods_name")
    private String goodsName;

    /**
     * 商品图片
     */
    @Column(name = "goods_img")
    private String goodsImg;

    /**
     * 价格单位
     */
    @Column(name = "goods_unit")
    private String goodsUnit;

    /**
     * 生成订单时的商品单价
     */
    @Column(name = "goods_price")
    private BigDecimal goodsPrice;

    /**
     * 商品数量
     */
    private Integer quantity;

    /**
     * 是否删除 0正常  1删除
     */
    @Column(name = "is_delete")
    private Integer isDelete;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取订单id
     *
     * @return order_number - 订单id
     */
    public String getOrderNumber() {
        return orderNumber;
    }

    /**
     * 设置订单id
     *
     * @param orderNumber 订单id
     */
    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    /**
     * 获取商品id
     *
     * @return goods_id - 商品id
     */
    public Integer getGoodsId() {
        return goodsId;
    }

    /**
     * 设置商品id
     *
     * @param goodsId 商品id
     */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * 获取商品名称
     *
     * @return goods_name - 商品名称
     */
    public String getGoodsName() {
        return goodsName;
    }

    /**
     * 设置商品名称
     *
     * @param goodsName 商品名称
     */
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    /**
     * 获取商品图片
     *
     * @return goods_img - 商品图片
     */
    public String getGoodsImg() {
        return goodsImg;
    }

    /**
     * 设置商品图片
     *
     * @param goodsImg 商品图片
     */
    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg;
    }

    /**
     * 获取价格单位
     *
     * @return goods_unit - 价格单位
     */
    public String getGoodsUnit() {
        return goodsUnit;
    }

    /**
     * 设置价格单位
     *
     * @param goodsUnit 价格单位
     */
    public void setGoodsUnit(String goodsUnit) {
        this.goodsUnit = goodsUnit;
    }

    /**
     * 获取生成订单时的商品单价
     *
     * @return goods_price - 生成订单时的商品单价
     */
    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    /**
     * 设置生成订单时的商品单价
     *
     * @param goodsPrice 生成订单时的商品单价
     */
    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    /**
     * 获取商品数量
     *
     * @return quantity - 商品数量
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * 设置商品数量
     *
     * @param quantity 商品数量
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    /**
     * 获取是否删除 0正常  1删除
     *
     * @return is_delete - 是否删除 0正常  1删除
     */
    public Integer getIsDelete() {
        return isDelete;
    }

    /**
     * 设置是否删除 0正常  1删除
     *
     * @param isDelete 是否删除 0正常  1删除
     */
    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return update_time
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * @param updateTime
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}