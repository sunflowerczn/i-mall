package com.imcode;

import com.imcode.mall.service.VFloorService;
import com.imcode.mall.vo.VFloor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-config.xml")

public class TestFloorService
{
    @Autowired
    private VFloorService service;

    @Test
    public void test()
    {
        List<VFloor> floorList = service.findAll();
        System.out.println(floorList);
    }
}
