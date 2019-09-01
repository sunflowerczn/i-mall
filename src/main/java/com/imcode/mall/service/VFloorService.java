package com.imcode.mall.service;

import com.imcode.mall.mapper.CategoryMapper;
import com.imcode.mall.mapper.GoodsMapper;
import com.imcode.mall.model.Category;
import com.imcode.mall.model.Goods;
import com.imcode.mall.vo.VFloor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

@Service
public class VFloorService
{
    @Autowired(required = false)
    private GoodsMapper goodsMapper;
    @Autowired(required = false)
    private CategoryMapper categoryMapper;

    public List<VFloor> findAll()
    {
        //1 查询所有的类别
        List<Category> categories = categoryMapper.selectAll();
        List<VFloor> result = new ArrayList<>();
        //2 对于每种类别，查询对应的全部商品
        for(Category category:categories)
        {
            Example example = new Example(Goods.class);
            example.createCriteria().andEqualTo("categoryId",category.getId()+"");
            List<Goods> goodsList = goodsMapper.selectByExample(example);
            VFloor f = new VFloor();
            f.setCategoryId(category.getId());
            f.setCategoryImg(category.getImg());
            f.setCategoryName(category.getName());
            f.setGoodsList(goodsList);
            result.add(f);
        }
        return result;
    }
}
