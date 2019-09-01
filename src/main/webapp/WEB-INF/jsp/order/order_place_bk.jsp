<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生鲜-提交订单</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/main.css">
</head>
<body>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/search_bar.jsp" %>

<h3 class="common_title">确认收货地址</h3>
<div class="common_list_con clearfix">
    <dl>
        <dt>寄送到：</dt>
        <dd>
            <input type="radio" name="addressId" checked value="${address.id}">
            ${address.address} （${address.receiver} 收） ${address.mobile}
        </dd>
    </dl>
    <a href="user_center_site.html" class="edit_site">编辑收货地址</a>
</div>

<h3 class="common_title">支付方式</h3>
<div class="common_list_con clearfix">
    <div class="pay_style_con clearfix">
        <input type="radio" name="paymentType" value="1"><label class="weixin">微信支付</label>
        <input type="radio" name="paymentType" value="1"><label class="zhifubao"></label>
    </div>
</div>

<h3 class="common_title">商品列表</h3>

<div class="common_list_con clearfix">

    <ul class="goods_list_th clearfix">
        <li class="col01">商品名称</li>
        <li class="col02">商品单位</li>
        <li class="col03">商品价格</li>
        <li class="col04">数量</li>
        <li class="col05">小计</li>
    </ul>

    <c:forEach items="${order.itemList}" var="detail" varStatus="item">
        <ul class="goods_list_td clearfix">
            <li class="col01">${item.index + 1}</li>
            <li class="col02"><img src="${detail.goodsImg}"></li>
            <li class="col03">${detail.goodsName}</li>
            <li class="col04">${detail.goodsUnit}</li>
            <li class="col05">￥${detail.goodsPrice}</li>
            <li class="col06">${detail.goodsQuantity}</li>
            <li class="col07">￥${detail.goodsTotalPrice}</li>
        </ul>
        <input type="hidden" value="${detail.goodsId}" name="goodsId">
        <input type="hidden" value="${detail.goodsQuantity}" name="quantity">
    </c:forEach>
</div>

<h3 class="common_title">总金额结算</h3>

<div class="common_list_con clearfix">
    <div class="settle_con">
        <div class="total_goods_count">共<em>${order.totalQuantity}</em>件商品，总金额<b>￥${order.totalPrice}</b></div>
        <div class="transit">运费：<b>￥${order.freight}</b></div>
        <div class="total_pay">实付款：<b>￥${order.paymentAmount}</b></div>
    </div>
</div>

<div class="order_submit clearfix">

    <a href="javascript:;" id="order_btn">提交订单</a>
</div>


<div class="popup_con">
    <div class="popup">
        <p>订单提交成功！</p>
    </div>
    <div class="mask"></div>
</div>

<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>


<script type="text/javascript">


    $('#order_btn').bind('click', function () {
        var goodsIds = new Array();
        var quantitys = new Array();
        $('input[name="goodsId"]').each(function () {
            goodsIds.push(Number($(this).val()));
        });

        $('input[name="quantity"]').each(function () {
            quantitys.push(Number($(this).val()));
        });


        $.ajax({
            url: '${ctx}/order/submit',
            data: {
                addressId: $('input[name="addressId"]:checked').val(),
                goodsIds: goodsIds,
                quantitys: quantitys
            },
            dataType: 'json',
            type: 'post',
            success: function (r) {
                if (r.code === 0) {
                    layer.msg(r.msg, {
                        icon: 1,
                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
                    }, function () {
                        //跳转到支付页面
                        var orderNumber = r.data;
                        window.location.href = '${ctx}/pay/goPay?orderNumber=' + orderNumber + '&paymentAmount=${order.paymentAmount + order.freight}&subject=test';
                    });
                } else {
                    layer.alert(r.msg);
                }
            }
        })

    });
</script>
</body>
</html>