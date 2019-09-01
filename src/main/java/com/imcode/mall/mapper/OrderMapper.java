package com.imcode.mall.mapper;

import com.imcode.mall.model.Order;
import tk.mybatis.mapper.common.Mapper;
import java.util.List;

public interface OrderMapper extends Mapper<Order> {


    /**
     * 查询会员的订单数据
     * @param memberId
     * @return
     */
    List<Order> selectOrder(Integer memberId);

}