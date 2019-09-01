package com.imcode.mall.vo;

import com.imcode.mall.model.Goods;

import java.util.List;

public class VFloor {

    // 商品分类ID
    private Integer categoryId;
    // 商品分类名称
    private String categoryName;
    // 商品分类图片
    private String categoryImg;
    // 商品数据
    private List<Goods> goodsList;


    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryImg() {
        return categoryImg;
    }

    public void setCategoryImg(String categoryImg) {
        this.categoryImg = categoryImg;
    }

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }
}
