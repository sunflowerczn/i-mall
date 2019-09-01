package com.imcode.mall.controller;

import com.imcode.common.model.R;
import com.imcode.mall.model.Address;
import com.imcode.mall.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AddressAction
{
    @Autowired
    private AddressService service;

    @GetMapping("/findaddress")
    @ResponseBody
    public R findAddress(int memberId)
    {
        Address param = new Address();
        param.setMemberId(memberId);
        List<Address> list = service.findList(param);
        R r = R.ok("查询成功！");
        r.setData(list);
        return r;
    }
}
