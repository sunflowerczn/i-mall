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
    <dl id="address" >
        <dt>寄送到：</dt>
        <dd>
            <%--
            <input type="radio" name="addressId" checked value="${address.id}">
            ${address.address} （${address.receiver} 收） ${address.mobile}
            --%>
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

<div class="common_list_con clearfix" id="iteminfo">

    <ul class="goods_list_th clearfix">
        <li class="col01">商品名称</li>
        <li class="col02">商品单位</li>
        <li class="col03">商品价格</li>
        <li class="col04">数量</li>
        <li class="col05">小计</li>
    </ul>
    <%--
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
    --%>
</div>

<h3 class="common_title">总金额结算</h3>

<div class="common_list_con clearfix">
    <div class="settle_con">
        <div class="total_goods_count" id="total_goods_count">共<em>${order.totalQuantity}</em>件商品，总金额<b>￥${order.totalPrice}</b></div>
        <div class="transit" id="freight">运费：<b>￥${order.freight}</b></div>
        <div class="total_pay" id="payment_acount">实付款：<b>￥${order.paymentAmount}</b></div>
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
     $(function(){
         sendAjaxForAddress(); //查找地址
         sendAjaxForOrderItem();//查找订单项
         addEvent();//添加 按钮点击事件
     });

     function sendAjaxForAddress()
     {
        $.getJSON("${ctx}/findaddress",{memberId:${sessionUser.id}},
        function(R){
                if (R.code!=0)
                {
                    alert(R.msg);
                    return ;
                }
                var html = "<dt>寄送到：</dt>";
                $.each(R.data,
                    function()
                    {
                        html+="<dd>\n" ;
                        if (this.isDefault==1)
                            html+= "<input type=\"radio\" name=\"addressId\" checked value=\""+this.id+"\">\n";
                        else
                            html+= "<input type=\"radio\" name=\"addressId\" value=\""+this.id+"\">\n";

                        html+= "            "+this.address+" （"+this.receiver+" 收） "+this.mobile+"\n";
                        html+="</dd>"
                    }
                );
                $("#address").html(html);
            }
        )
     }

     function sendAjaxForOrderItem()
     {
        $.getJSON("${ctx}/order/getorderinfo",null,
            function(R)
            {
                if(R.code!=0)
                {
                    alert(R.msg);
                    return;
                }
                var html = "";
                $.each(R.data.itemList,
                    function(index)
                    {
                        html+="        <ul class=\"goods_list_td clearfix\">\n" +
                            "            <li class=\"col01\">"+(index+1)+"</li>\n" +
                            "            <li class=\"col02\"><img src=\""+this.goodsImg+"\"></li>\n" +
                            "            <li class=\"col03\">"+this.goodsName+"</li>\n" +
                            "            <li class=\"col04\">"+this.goodsUnit+"</li>\n" +
                            "            <li class=\"col05\">￥"+this.goodsPrice+"</li>\n" +
                            "            <li class=\"col06\">"+this.goodsQuantity+"</li>\n" +
                            "            <li class=\"col07\">￥"+this.goodsTotalPrice+"</li>\n" +
                            "        </ul>"
                    }
                )

                $("#iteminfo").append(html);
                html = "共<em>"+R.data.totalQuantity+"</em>件商品，总金额<b>￥<label id='paymentAmount'>"+R.data.totalPrice+"</label></b>"
                $("#total_goods_count").html(html);
                html = "运费：<b>￥<label id='frei'>"+R.data.freight+"</label></b>";
                $("#freight").html(html);
                html = "实付款：<b>￥"+R.data.paymentAmount+"</b>";
                $("#payment_acount").html(html);
            })
     }
    function addEvent()
    {
        $('#order_btn').bind('click', function () {
            $.ajax({
                url: '${ctx}/order/submit',
                data: {
                    addressId: $('input[name="addressId"]:checked').val(),
                    freight:$("#frei").text(),
                    paymentAmount:$("#paymentAmount").text()
                },
                dataType: 'json',
                type: 'post',
                success: function (R) {
                    if (R.code === 0) {
                        layer.msg(R.msg, {
                            icon: 1,
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            //跳转到支付页面
                            var orderNumber = R.data.orderNumber;
                            var totalAmount = R.data.paymentAmount+R.data.freight;
                            window.location.href = '${ctx}/pay/goPay?orderNumber=' + orderNumber + '&totalAmount='+totalAmount;
                        });
                    } else {
                        layer.alert(r.msg);
                    }
                }
            })

        });
    }
</script>
</body>
</html>