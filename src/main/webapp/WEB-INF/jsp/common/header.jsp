<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到爱生鲜!</div>
        <div class="fr">
            <div class="login_btn fl">
                <c:if test="${empty sessionScope.sessionUser.username}">
                    <a href="${ctx}/login">登录</a>
                    <span>|</span>
                    <a href="${ctx}/member/register">注册</a>
                </c:if>
                <c:if test="${not empty sessionScope.sessionUser.username}">
                    欢迎您：<em>${sessionScope.sessionUser.username}</em>

                    <span>|</span>
                    <a href="${ctx}/loginout">退出</a>
                </c:if>
            </div>
            <div class="user_link fl">
                <span>|</span>
                <a href="${ctx}/member">会员中心</a>
                <span>|</span>
                <a href="${ctx}/cart">我的购物车</a>
                <span>|</span>
                <a href="${ctx}/member/order">我的订单</a>
            </div>
        </div>
    </div>
</div>
