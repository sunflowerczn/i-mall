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
        <h3 class="common_title2">收货地址</h3>

        <c:forEach items="${addressList}" var="address">
            <div class="site_con">
                <dl>
                    <dt>当前地址：</dt>
                    <dd>北京市 海淀区 东北旺西路8号中关村软件园 （李思 收） 182****7528</dd>
                </dl>
            </div>

            <div class="site_con">
                <dl>
                    <dd>北京市 海淀区 东北旺西路8号中关村软件园 （李思 收） 182****7528</dd>
                </dl>
            </div>

            <div class="site_con">
                <dl>
                    <dt>当前地址：</dt>
                    <dd>北京市 海淀区 东北旺西路8号中关村软件园 （李思 收） 182****7528</dd>
                </dl>
            </div>
            <div class="site_con">
                <dl>
                    <dt>当前地址：</dt>
                    <dd>北京市 海淀区 东北旺西路8号中关村软件园 （李思 收） 182****7528</dd>
                </dl>
            </div>
        </c:forEach>

        <h3 class="common_title2">编辑地址</h3>
        <div class="site_con">
            <form>
                <div class="form_group">
                    <label>收件人：</label>
                    <input type="text" name="">
                </div>
                <div class="form_group form_group2">
                    <label>详细地址：</label>
                    <textarea class="site_area"></textarea>
                </div>
                <div class="form_group">
                    <label>邮编：</label>
                    <input type="text" name="">
                </div>
                <div class="form_group">
                    <label>手机：</label>
                    <input type="text" name="">
                </div>

                <input type="submit" name="" value="提交" class="info_submit">
            </form>
        </div>
    </div>
</div>
</body>
</html>