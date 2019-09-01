package com.imcode.mall.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;
import com.imcode.common.controller.BaseController;
import com.imcode.common.model.R;
import com.imcode.mall.model.Member;
import com.imcode.mall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

//支付宝
//添加支付记录
@Controller
@RequestMapping("/pay")
public class PaymentAction extends BaseController
{

    @Autowired
    private OrderService service;
    @GetMapping("/goPay")
    @ResponseBody
    public String gotoPay(String orderNumber,String totalAmount)
    {
        try {
            //获得初始化的AlipayClient
            AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

            //设置请求参数
            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
            alipayRequest.setReturnUrl(AlipayConfig.return_url);
           //alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
            //String subject = new String("测试".getBytes("gbk"),"utf-8");
            String subject = "test";
            //订单名称，必填
            //String iso = new String(subject.getBytes("gbk"),"ISO-8859-1");
            //subject = new String(iso.getBytes("ISO-8859-1"),"UTF-8");
            System.out.println(subject);
            //商品描述，可空
            String body = "";

            alipayRequest.setBizContent("{\"out_trade_no\":\"" + orderNumber + "\","
                    + "\"total_amount\":\"" + totalAmount + "\","
                    + "\"subject\":\"" + subject + "\","
                    + "\"body\":\"" + body + "\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            //TODO 校验订单编号和付款金额是否和数据库的订单金额一致

            //请求
            String result = alipayClient.pageExecute(alipayRequest).getBody();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }
    }

    /**
     * 支付成功回调响应
     * @return
     * @throws AlipayApiException
     */
    @GetMapping("/notifyPay")
    @ResponseBody
    public R result(int result,String ordernumber,String paymentAmount) throws AlipayApiException
    {
        if (result==1)  //支付成功！
        {
            String paymentnumber = "1111111";
            int memberId = ((Member) session.getAttribute("sessionUser")).getId();
            service.afterPay(memberId,ordernumber,paymentnumber,paymentAmount);
            // 保存支付信息
            return R.ok("支付成功");
        }
        else
        {
            return R.ok("支付失败");
        }
    }
}

