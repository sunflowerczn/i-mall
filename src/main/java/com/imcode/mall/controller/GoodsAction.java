package com.imcode.mall.controller;

//会员端：进入详细页面。购买时的库存变化？
//管理员端：增删改

import com.imcode.common.model.R;
import com.imcode.mall.model.Goods;
import com.imcode.mall.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GoodsAction
{
    @GetMapping("/goods/detail/{goodsid}")
    public String toDetail(@PathVariable("goodsid") int goodsId, Model model)
    {
        model.addAttribute("goods_id",goodsId);//存放起来，下了个页面的ajax才能作为入参
        return "goods/goods_detail";
    }
    @Autowired
    private GoodsService service;

    @GetMapping("/goods/detail/getdetail")
    @ResponseBody
    public R getDetail(int goodsId)  //获取商品详情
    {
        Goods goods = service.getById(goodsId);
        R r = R.ok("查询成功！");
        r.setData(goods);
        return r;
    }
}
