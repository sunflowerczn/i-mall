<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生鲜-首页</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/main.css">
</head>
<body>
<%@ include file="common/header.jsp" %>
<%@ include file="common/search_bar.jsp" %>

<div class="navbar_con">
    <div class="navbar">
        <h1 class="fl">全部商品分类</h1>
        <ul class="navlist fl">
            <li><a href="">首页</a></li>
            <li class="interval">|</li>
            <li><a href="">手机生鲜</a></li>
            <li class="interval">|</li>
            <li><a href="">抽奖</a></li>
        </ul>
    </div>
</div>


<div class="center_con clearfix">
    <ul class="subnav fl">
        <c:forEach items="${categoryList}" var="category" varStatus="s">
            <li><a href="#model${s.index}" class="${category.logo}">${category.name}</a></li>
        </c:forEach>
    </ul>
    <div class="slide fl">
        <ul class="slide_pics">
            <c:forEach items="${bannerList}" var="banner">
                <li><img src="${banner.img}" alt="${banner.name}"></li>
            </c:forEach>
        </ul>
        <div class="prev"></div>
        <div class="next"></div>
        <ul class="points"></ul>
    </div>
    <div class="adv fl">
        <c:forEach items="${promotionList}" var="promotion">
            <a href="${promotion.url}"><img src="${promotion.img}"></a>
        </c:forEach>
    </div>
</div>

<c:forEach items="${floorList}" var="floor" varStatus="s">
    <div class="list_model">
        <div class="list_title clearfix">
            <h3 class="fl" id="model${s.index}">${floor.categoryName}</h3>
            <div class="subtitle fl">
                <span>|</span>
                <a href="#">鲜芒</a>
                <a href="#">加州提子</a>
                <a href="#">亚马逊牛油果</a>
            </div>
            <a href="#" class="goods_more fr" id="fruit_more">查看更多 ></a>
        </div>

        <div class="goods_con clearfix">
            <div class="goods_banner fl"><img src="${floor.categoryImg}"></div>
            <ul class="goods_list fl">
                <c:forEach items="${floor.goodsList}" var="goods">
                    <li>
                        <h4><a href="${ctx}/goods/detail/${goods.id}" target="_blank">${goods.name}</a></h4>
                        <a href="${ctx}/goods/detail/${goods.id}" target="_blank"><img src="${goods.img}"></a>
                        <div class="prize">¥ ${goods.price}</div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</c:forEach>

<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${ctx}/js/slide.js"></script>
<script type="text/javascript">
    var oFruit = document.getElementById('fruit_more');
    var oShownum = document.getElementById('show_count');
    var hasorder = localStorage.getItem('order_finish');
    if (hasorder) {
        oShownum.innerHTML = '2';
    }
    oFruit.onclick = function () {
        window.location.href = 'list.html';
    }
</script>

</body>
</html>