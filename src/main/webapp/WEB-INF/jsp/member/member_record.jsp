<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生鲜-会员中心</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/main.css">
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/search_bar.jsp" %>

<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>会员中心</h3>
        <ul>
            <li><a href="${ctx}/member/record" class="active">· 最近浏览</a></li>
            <li><a href="${ctx}/member/order">· 我的订单</a></li>
            <li><a href="${ctx}/member/address">· 收货地址</a></li>
            <li><a href="${ctx}/member">· 个人信息</a></li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <h3 class="common_title2">最近浏览</h3>
        <div class="has_view_list">
            <ul class="goods_type_list clearfix">
                <li>
                    <a href="detail.html"><img src="images/goods/goods003.jpg"></a>
                    <h4><a href="detail.html">大兴大棚草莓</a></h4>
                    <div class="operate">
                        <span class="prize">￥16.80</span>
                        <span class="unit">16.80/500g</span>
                        <a href="#" class="add_goods" title="加入购物车"></a>
                    </div>
                </li>

                <li>
                    <a href="#"><img src="images/goods/goods004.jpg"></a>
                    <h4><a href="#">吐鲁番梨光杏</a></h4>
                    <div class="operate">
                        <span class="prize">￥5.50</span>
                        <span class="unit">5.50/500g</span>
                        <a href="#" class="add_goods" title="加入购物车"></a>
                    </div>
                </li>

                <li>
                    <a href="#"><img src="images/goods/goods005.jpg"></a>
                    <h4><a href="#">黄肉桃</a></h4>
                    <div class="operate">
                        <span class="prize">￥10.00</span>
                        <span class="unit">10.00/500g</span>
                        <a href="#" class="add_goods" title="加入购物车"></a>
                    </div>
                </li>

                <li>
                    <a href="#"><img src="images/goods/goods006.jpg"></a>
                    <h4><a href="#">进口西梅</a></h4>
                    <div class="operate">
                        <span class="prize">￥28.80</span>
                        <span class="unit">28.8/500g</span>
                        <a href="#" class="add_goods" title="加入购物车"></a>
                    </div>
                </li>

                <li>
                    <a href="#"><img src="images/goods/goods007.jpg"></a>
                    <h4><a href="#">香梨</a></h4>
                    <div class="operate">
                        <span class="prize">￥6.45</span>
                        <span class="unit">6.45/500g</span>
                        <a href="#" class="add_goods" title="加入购物车"></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>