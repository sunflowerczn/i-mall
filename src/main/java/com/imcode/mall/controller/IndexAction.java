package com.imcode.mall.controller;

import com.imcode.common.model.R;
import com.imcode.mall.model.Banner;
import com.imcode.mall.model.Category;
import com.imcode.mall.model.Promotion;
import com.imcode.mall.service.BannerService;
import com.imcode.mall.service.CategoryService;
import com.imcode.mall.service.PromotionService;
import com.imcode.mall.service.VFloorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

//首页的四个查询
@Controller
public class IndexAction
{
    //到达首页
    @GetMapping({"/","/index"})
    public String toIndex()
    {
        return "index";
    }
    //
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private BannerService bannerService;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private VFloorService vfloorService;

    @GetMapping("/findcategorys")
    @ResponseBody  //直接将json数据作为响应回给前端
    public R findGategorys()
    {
        R r = R.ok("查询成功");
        r.setData(categoryService.findAll());
        return  r;
    }

    @GetMapping("/findbanners")
    @ResponseBody  //直接将json数据作为响应回给前端
    public R findBanners()
    {
        R r = R.ok("查询成功");
        r.setData(bannerService.findAll());
        return r;
    }

    @GetMapping("/findpromotions")
    @ResponseBody  //直接将json数据作为响应回给前端
    public R findPromotions()
    {
        R r = R.ok("查询成功");
        r.setData(promotionService.findAll());
        return  r;
    }
    @GetMapping("/findfloors")
    @ResponseBody  //直接将json数据作为响应回给前端
    public R findFloors()
    {
        R r = R.ok("查询成功");
        r.setData(vfloorService.findAll());
        return  r;
    }
}
