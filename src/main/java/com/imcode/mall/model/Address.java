package com.imcode.mall.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "mall_address")
public class Address {
    @Id
    private Integer id;

    /**
     * 用户id
     */
    @Column(name = "member_id")
    private Integer memberId;

    /**
     * 收件人
     */
    private String receiver;

    /**
     * 收件人手机
     */
    private String mobile;

    /**
     * 收件地址
     */
    private String address;

    /**
     * 邮编
     */
    @Column(name = "zip_code")
    private String zipCode;

    /**
     * 是否默认地址 0默认   1不是默认
     */
    @Column(name = "is_default")
    private Integer isDefault;

    /**
     * 是否删除 0正常 1删除
     */
    @Column(name = "is_delete")
    private Integer isDelete;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 更新时间
     */
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
     * 获取用户id
     *
     * @return member_id - 用户id
     */
    public Integer getMemberId() {
        return memberId;
    }

    /**
     * 设置用户id
     *
     * @param memberId 用户id
     */
    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    /**
     * 获取收件人
     *
     * @return receiver - 收件人
     */
    public String getReceiver() {
        return receiver;
    }

    /**
     * 设置收件人
     *
     * @param receiver 收件人
     */
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    /**
     * 获取收件人手机
     *
     * @return mobile - 收件人手机
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * 设置收件人手机
     *
     * @param mobile 收件人手机
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 获取收件地址
     *
     * @return address - 收件地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置收件地址
     *
     * @param address 收件地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取邮编
     *
     * @return zip_code - 邮编
     */
    public String getZipCode() {
        return zipCode;
    }

    /**
     * 设置邮编
     *
     * @param zipCode 邮编
     */
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    /**
     * 获取是否默认地址 0默认   1不是默认
     *
     * @return is_default - 是否默认地址 0默认   1不是默认
     */
    public Integer getIsDefault() {
        return isDefault;
    }

    /**
     * 设置是否默认地址 0默认   1不是默认
     *
     * @param isDefault 是否默认地址 0默认   1不是默认
     */
    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
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
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取更新时间
     *
     * @return update_time - 更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置更新时间
     *
     * @param updateTime 更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}