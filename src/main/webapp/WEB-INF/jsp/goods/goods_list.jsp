<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生鲜-商品列表</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<%@ include file="common/header.jsp" %>
<%@ include file="common/search_bar.jsp" %>

<div class="navbar_con">
    <div class="navbar clearfix">
        <div class="subnav_con fl">
            <h1>全部商品分类</h1>
            <span></span>
            <ul class="subnav">
                <li><a href="#" class="fruit">新鲜水果</a></li>
                <li><a href="#" class="seafood">海鲜水产</a></li>
                <li><a href="#" class="meet">猪牛羊肉</a></li>
                <li><a href="#" class="egg">禽类蛋品</a></li>
                <li><a href="#" class="vegetables">新鲜蔬菜</a></li>
                <li><a href="#" class="ice">速冻食品</a></li>
            </ul>
        </div>
        <ul class="navlist fl">
            <li><a href="">首页</a></li>
            <li class="interval">|</li>
            <li><a href="">手机生鲜</a></li>
            <li class="interval">|</li>
            <li><a href="">抽奖</a></li>
        </ul>
    </div>
</div>

<div class="breadcrumb">
    <a href="#">全部分类</a>
    <span>></span>
    <a href="#">新鲜水果</a>
</div>

<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>新品推荐</h3>
            <ul>
                <li>
                    <a href="#"><img src="images/goods/goods001.jpg"></a>
                    <h4><a href="#">进口柠檬</a></h4>
                    <div class="prize">￥3.90</div>
                </li>
                <li>
                    <a href="#"><img src="images/goods/goods002.jpg"></a>
                    <h4><a href="#">玫瑰香葡萄</a></h4>
                    <div class="prize">￥16.80</div>
                </li>
            </ul>
        </div>
    </div>

    <div class="r_wrap fr clearfix">
        <div class="sort_bar">
            <a href="#" class="active">默认</a>
            <a href="#">价格</a>
            <a href="#">人气</a>
        </div>

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

            <li>
                <a href="#"><img src="images/goods/goods008.jpg"></a>
                <h4><a href="#">栗子</a></h4>
                <div class="operate">
                    <span class="prize">￥9.50</span>
                    <span class="unit">9.50/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="images/goods/goods009.jpg"></a>
                <h4><a href="#">海南香蕉</a></h4>
                <div class="operate">
                    <span class="prize">￥3.30</span>
                    <span class="unit">3.30/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="images/goods/goods010.jpg"></a>
                <h4><a href="#">青苹果</a></h4>
                <div class="operate">
                    <span class="prize">￥5.00</span>
                    <span class="unit">5.00/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="images/goods/goods011.jpg"></a>
                <h4><a href="#">山莓</a></h4>
                <div class="operate">
                    <span class="prize">￥28.80</span>
                    <span class="unit">28.8/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="images/goods/goods012.jpg"></a>
                <h4><a href="#">奇异果</a></h4>
                <div class="operate">
                    <span class="prize">￥25.80</span>
                    <span class="unit">25.8/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>
            <li>
                <a href="#"><img src="images/goods/goods013.jpg"></a>
                <h4><a href="#">蜜桔</a></h4>
                <div class="operate">
                    <span class="prize">￥4.80</span>
                    <span class="unit">4.8/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>
            <li>
                <a href="#"><img src="images/goods/goods014.jpg"></a>
                <h4><a href="#">脐橙</a></h4>
                <div class="operate">
                    <span class="prize">￥3.50</span>
                    <span class="unit">3.50/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>
            <li>
                <a href="#"><img src="images/goods/goods001.jpg"></a>
                <h4><a href="#">进口柠檬</a></h4>
                <div class="operate">
                    <span class="prize">￥3.90</span>
                    <span class="unit">3.90/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>
            <li>
                <a href="#"><img src="images/goods/goods002.jpg"></a>
                <h4><a href="#">玫瑰香葡萄</a></h4>
                <div class="operate">
                    <span class="prize">￥16.80</span>
                    <span class="unit">16.80/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>
        </ul>

        <div class="pagenation">
            <a href="#">
                <上一页
            </a>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">下一页></a>
        </div>
    </div>
</div>
</body>
</html>