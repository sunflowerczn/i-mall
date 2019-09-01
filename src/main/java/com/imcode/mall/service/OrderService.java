package com.imcode.mall.service;

import com.imcode.common.service.AbstractService;
import com.imcode.mall.mapper.OrderItemMapper;
import com.imcode.mall.mapper.PaymentMapper;
import com.imcode.mall.model.Order;
import com.imcode.mall.model.OrderItem;
import com.imcode.mall.model.Payment;
import com.imcode.mall.vo.VCart;
import com.imcode.mall.vo.VCartItem;
import com.imcode.mall.vo.VOrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderService extends AbstractService<Order>
{
    @Autowired(required = false)
    private OrderItemMapper orderItemMapper;
    @Autowired(required = false)
    private PaymentMapper paymentMapper;
    //根据商品ID，从购物车中抽取出订单项目
    public List<VOrderItem> getOrderItemsFromCart(VCart cart, int[] goodsIds)
    {
        List<VOrderItem> result = new ArrayList<>();
        if (cart==null)
            return result;
        for(int goodsid:goodsIds)
        {
            for (VCartItem item : cart.getItems())
            {
                if (goodsid==item.getGoods().getId())
                {
                    VOrderItem oi = new VOrderItem();
                    oi.setGoodsId(goodsid);
                    oi.setGoodsImg(item.getGoods().getImg());
                    oi.setGoodsName(item.getGoods().getName());
                    oi.setGoodsPrice(item.getGoods().getPrice());
                    oi.setGoodsQuantity(item.getQuantity());
                    oi.setGoodsTotalPrice(item.getTotalPrice());
                    oi.setGoodsUnit(item.getGoods().getUnit());
                    oi.setGoodsFreight(item.getGoods().getFreight());
                    result.add(oi);
                    continue;
                }
            }
        }
        return result;
    }

    //计算总运费
    public BigDecimal getTotalFreight( List<VOrderItem> items)
    {
        BigDecimal totalFreight = new BigDecimal(0);
        for(VOrderItem item:items)
        {
            totalFreight = totalFreight.add(item.getGoodsFreight());
        }
        totalFreight = totalFreight.setScale(2,BigDecimal.ROUND_HALF_DOWN);
        return totalFreight;
    }

    //计算总价
    public BigDecimal getTotalPrice( List<VOrderItem> items)
    {
        BigDecimal totalPrice = new BigDecimal(0);
        for(VOrderItem item:items)
        {
            totalPrice = totalPrice.add(item.getGoodsTotalPrice());
        }
        totalPrice = totalPrice.setScale(2,BigDecimal.ROUND_HALF_DOWN);
        return totalPrice;
    }

    //计算总数量
    public int getTotalQuantity( List<VOrderItem> items)
    {
        int total = 0;
        for(VOrderItem item:items)
        {
            total += item.getGoodsQuantity();
        }
        return total;
    }
    private static Integer num = 0;  //mutex
    //产生唯一的订单号：时间+同步自增整数
    private static String createOrderNumber()
    {
        String ordernumber = "";
        synchronized (num) {

             ordernumber = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
                    + num;
            num++;
        }
        return ordernumber;
    }
    //根据商品ID，从购物车中抽取出Order订单项目
    public Order createOrder(int memberId, int addressId,BigDecimal freight,BigDecimal paymentAmount)
    {
        Order order = new Order();
        order.setAddressId(addressId);
        order.setCreateTime(new Date());
        order.setFreight(freight);
        order.setMemberId(memberId);
        order.setOrderStatus(0);
        order.setIsDelete(0);
        order.setOrderNumber(createOrderNumber());
        order.setPaymentAmount(paymentAmount);
        return order;
    }

    //根据商品ID，从购物车中抽取出订单项目
    public void createOrderItemsFromCart(VCart cart, int[] goodsIds,Order order)
    {
        List<OrderItem> result = new ArrayList<>();
        if (cart==null)
            return ;
        for(int goodsid:goodsIds)
        {
            for (VCartItem item : cart.getItems())
            {
                if (goodsid==item.getGoods().getId())
                {
                    OrderItem oi = new OrderItem();
                    oi.setGoodsId(goodsid);
                    oi.setGoodsImg(item.getGoods().getImg());
                    oi.setGoodsName(item.getGoods().getName());
                    oi.setGoodsPrice(item.getGoods().getPrice());
                    oi.setQuantity(item.getQuantity());
                    oi.setGoodsUnit(item.getGoods().getUnit());
                    oi.setOrderNumber(order.getOrderNumber()); //该订单项对应的订单编号
                    oi.setIsDelete(0);
                    result.add(oi);
                    continue;
                }
            }
        }
        order.setItemList(result);
    }
    //将订单添加到数据库中
    @Transactional(propagation = Propagation.REQUIRED)
    public void submitOrder(Order order)
    {
        //插入Order的记录
        this.add(order);
        //循环遍历OrderItem，分别插入OrderItem表
        for(OrderItem item:order.getItemList())
        {
            orderItemMapper.insert(item);
        }
    }

    //支付完毕后
    public  void afterPay(int memberId,String ordernumber,String paymentnumber,String paymentAmount)
    {
        //修改订单状态
        Order param = new Order();
        param.setOrderNumber(ordernumber);
        param.setOrderStatus(1);
        this.update(param);
        //添加payment记录
        Payment payment = new Payment();
        payment.setCreateTime(new Date());
        payment.setIsDelete(0);
        payment.setMemberId(memberId);
        payment.setOrderNumber(ordernumber);
        payment.setPaymentNumber(paymentnumber);
        payment.setPaymentType(1);
        BigDecimal paymentAmo = new BigDecimal(Float.parseFloat(paymentAmount)).setScale(2,BigDecimal.ROUND_HALF_DOWN);
        payment.setPaymentStatus(1);
        payment.setPaymentAmount(paymentAmo);
        paymentMapper.insert(payment);
    }
}
