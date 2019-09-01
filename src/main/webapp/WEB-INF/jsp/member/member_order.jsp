<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <h3>用户中心</h3>
        <ul>
            <li><a href="${ctx}/member/record" class="active">· 最近浏览</a></li>
            <li><a href="${ctx}/member/order">· 我的订单</a></li>
            <li><a href="${ctx}/member/address">· 收货地址</a></li>
            <li><a href="${ctx}/member">· 个人信息</a></li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <h3 class="common_title2">全部订单</h3>


        <c:forEach items="${pageInfo.list}" var="order">
            <ul class="order_list_th w978 clearfix">
                <li class="col01">
                    <fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </li>
                <li class="col02">订单编号：${order.orderNumber}</li>
            </ul>
            <table class="order_list_table w980">
                <tbody>
                <c:forEach items="${order.itemList}" var="item" varStatus="status">
                    <tr>
                        <td style="text-align: left;padding: 10px 10px;vertical-align: top" width="580px">
                            <div style="float: left;display:inline;">
                                <img src="${item.goodsImg}" style="width:60px;height:60px;border:1px solid #ddd;">
                            </div>
                            <div style="float: left;display:inline;margin-left :20px;vertical-align: top;margin-top: 10px;width: 380px">
                                    ${item.goodsName}
                            </div>
                            <div style="float: left;display:inline;margin-left :20px;vertical-align: top;margin-top: 10px">
                                数量：x${item.quantity}
                            </div>
                            <div style="float: left;display:inline;margin-left :20px;vertical-align: bottom;margin-top: 10px">
                                单价：￥${item.goodsPrice}/${item.goodsUnit}
                            </div>
                        </td>
                        <c:if test="${status.index == 0}">
                            <td rowspan="${fn:length(order.itemList)}" style="width: 130px">
                                总额：￥${order.paymentAmount}
                                <br>
                                <br>
                                （运费：￥${order.freight}）
                            </td>

                            <c:choose>
                                <c:when test="${order.orderStatus == 0}">
                                    <td rowspan="${fn:length(order.itemList)}" style="width: 120px">
                                        待支付
                                    </td>
                                    <td rowspan="${fn:length(order.itemList)}">
                                        <a href="${ctx}/pay/goPay?orderNumber=${order.orderNumber}&paymentAmount=${order.paymentAmount + order.freight}&subject=test" class="oper_btn">去付款</a>
                                    </td>
                                </c:when>
                                <c:when test="${order.orderStatus == 1}">
                                    待发货
                                </c:when>
                                <c:when test="${order.orderStatus == 2}">
                                    待收货
                                </c:when>
                                <c:when test="${order.orderStatus == 3}">
                                    待评价
                                </c:when>
                                <c:when test="${order.orderStatus == 4}">
                                    已完成
                                </c:when>
                                <c:when test="${order.orderStatus == 5}">
                                    交易关闭
                                </c:when>
                            </c:choose>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:forEach>

        <c:if test="${pageInfo.pages>1}">
            <div class="pagenation">
                <c:if test="${not pageInfo.isFirstPage}">
                    <a href="${ctx}/member/order?pageNum=${pageInfo.pageNum-1}">&lt; 上一页</a>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                    <c:if test="${num == pageInfo.pageNum}">
                        <a class="active">${num}</a>
                    </c:if>
                    <c:if test="${num != pageInfo.pageNum}">
                        <a href="${ctx}/member/order?pageNum=${num}">${num}</a>
                    </c:if>
                </c:forEach>

                <c:if test="${not pageInfo.isLastPage}">
                    <a href="${ctx}/member/order?pageNum=${pageInfo.pageNum+1}">下一页 &gt;</a>
                </c:if>

            </div>
        </c:if>
    </div>
</div>
</body>
</html>