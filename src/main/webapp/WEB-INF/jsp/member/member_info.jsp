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
        <div class="info_con clearfix">
            <h3 class="common_title2">基本信息</h3>
            <ul class="user_info_list">
                <li><span>用户名：</span>${sessionScope.sessionUser.username}</li>
                <li><span>手机号：</span>${sessionScope.sessionUser.mobile}</li>
                <li><span>邮箱：</span>${sessionScope.sessionUser.email}</li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>