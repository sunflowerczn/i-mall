package com.imcode.mall.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "mall_promotion")
public class Promotion {
    @Id
    private Integer id;

    /**
     * 活动名称
     */
    private String name;

    /**
     * 活动图片
     */
    private String img;

    /**
     * 活动链接地址
     */
    private String url;

    /**
     * 展示顺序
     */
    @OrderBy("ASC")
    private Integer sort;

    /**
     * 是否删除 0正常 1删除
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
     * 获取活动名称
     *
     * @return name - 活动名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置活动名称
     *
     * @param name 活动名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取活动图片
     *
     * @return img - 活动图片
     */
    public String getImg() {
        return img;
    }

    /**
     * 设置活动图片
     *
     * @param img 活动图片
     */
    public void setImg(String img) {
        this.img = img;
    }

    /**
     * 获取活动链接地址
     *
     * @return url - 活动链接地址
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置活动链接地址
     *
     * @param url 活动链接地址
     */
    public void setUrl(String url) {
        this.url = url;
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
     * 获取是否删除 0正常 1删除
     *
     * @return is_delete - 是否删除 0正常 1删除
     */
    public Integer getIsDelete() {
        return isDelete;
    }

    /**
     * 设置是否删除 0正常 1删除
     *
     * @param isDelete 是否删除 0正常 1删除
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