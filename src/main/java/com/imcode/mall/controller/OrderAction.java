package com.imcode.mall.controller;

import com.imcode.common.controller.BaseController;
import com.imcode.common.model.R;
import com.imcode.common.util.RedisUtil;
import com.imcode.mall.model.Member;
import com.imcode.mall.model.Order;
import com.imcode.mall.service.OrderService;
import com.imcode.mall.vo.VCart;
import com.imcode.mall.vo.VCartItem;
import com.imcode.mall.vo.VOrder;
import com.imcode.mall.vo.VOrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.List;

//确定购买的行为
//地址相关的操作
@Controller
@RequestMapping("/order")
public class OrderAction extends BaseController
{
    @Autowired
    private RedisUtil redis;
    @Autowired
    private OrderService service;
    @GetMapping("/place")
    public String toPlaceOrder(int[] goodsIds,int[] quantities)
    {
        //使用session存放 goodsids和quantities，便于下个页面，发起ajax请求时无需携带参数！
        session.setAttribute("goodsids",goodsIds);
        session.setAttribute("quantities",quantities);
        return "order/order_place";
    }

    @GetMapping("/getorderinfo")
    @ResponseBody
    public R getOrderInfo()
    {
        //1 从session中获取 之前保存的 要买的商品编号和数量
        int[] goodsIds = (int[]) session.getAttribute("goodsids");
        int[] quantities = (int[]) session.getAttribute("quantities");
        //2 浏览购物车，根据上面数据获取商品详情
        String username = ((Member) session.getAttribute("sessionUser")).getUsername();
        VCart cart = redis.readCartFromRedis(username);
        if (cart==null)
            return R.error("获取订单信息失败，购物车被清空！");
        //3 构造 VOrderItem对象和VOrder
        List<VOrderItem> items = service.getOrderItemsFromCart(cart,goodsIds);
        //4 将VOrder对象存储到R中返回
        VOrder order = new VOrder();
        order.setItemList(items);
        order.setFreight(service.getTotalFreight(items));
        order.setTotalPrice(service.getTotalPrice(items));
        order.setTotalQuantity(service.getTotalQuantity(items));
        order.setPaymentAmount(order.getTotalPrice().add(order.getFreight()).setScale(2, BigDecimal.ROUND_HALF_DOWN)) ;  //实收总价
        R r = R.ok("获取订单信息成功！");
        r.setData(order);
        //todo：释放session中的goodsid和数量
        return r;
    }

    @PostMapping("/submit")
    @ResponseBody
    public R submitOrder(int addressId,String freight,String paymentAmount)
    {
        //1 从session中获取 之前保存的 要买的商品编号和数量
        int[] goodsIds = (int[]) session.getAttribute("goodsids");
        int[] quantities = (int[]) session.getAttribute("quantities");
        //2 使用业务类进行下面的行为：
        // 根据上面的数据，生成Order对象和OrderItem对象
        int memberId = ((Member) session.getAttribute("sessionUser")).getId();
        String username = ((Member) session.getAttribute("sessionUser")).getUsername();
        VCart cart = redis.readCartFromRedis(username);
        BigDecimal frei = new BigDecimal(Float.parseFloat(freight));
        frei = frei.setScale(2,BigDecimal.ROUND_HALF_DOWN);
        BigDecimal payment = new BigDecimal(Float.parseFloat(paymentAmount));
        payment = payment.setScale(2,BigDecimal.ROUND_HALF_DOWN);
        Order order = service.createOrder(memberId,addressId,frei,payment);
        service.createOrderItemsFromCart(cart,goodsIds,order);
        //插入到数据库中
        service.submitOrder(order);
        //删除购物车的记录
        //3 返回R
        R r = R.ok("插入订单成功！");
        order.setItemList(null); //清空Order的子项目，只将Order主体信息返回给前端
        r.setData(order);
        return  r;
    }
}
