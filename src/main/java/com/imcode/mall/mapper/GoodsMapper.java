package com.imcode.mall.mapper;

import com.imcode.mall.model.Goods;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface GoodsMapper extends Mapper<Goods> {


    List<Goods> findGoodsListByCategoryId(Integer categoryId);
}