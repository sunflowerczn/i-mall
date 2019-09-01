package com.imcode.mall.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "mall_banner")
public class Banner {
    @Id
    private Integer id;

    /**
     * banner名称
     */
    private String name;

    /**
     * 图片地址
     */
    private String img;

    /**
     * 展示顺序
     */
    @OrderBy("ASC")
    private Integer sort;

    /**
     * 商品id
     */
    @Column(name = "goods_id")
    private Integer goodsId;

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
     * 获取banner名称
     *
     * @return name - banner名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置banner名称
     *
     * @param name banner名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取图片地址
     *
     * @return img - 图片地址
     */
    public String getImg() {
        return img;
    }

    /**
     * 设置图片地址
     *
     * @param img 图片地址
     */
    public void setImg(String img) {
        this.img = img;
    }

    /**
     * 获取展示顺序
     *
     * @return sort - 展示顺序
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * 设置展示顺序
     *
     * @param sort 展示顺序
     */
    public void setSort(Integer sort) {
        this.sort = sort;
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