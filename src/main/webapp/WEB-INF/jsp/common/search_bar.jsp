<%@ page contentType="text/html;charset=UTF-8" %>
<div class="search_bar clearfix">
    <a href="${ctx}/" class="logo fl"><img src="${ctx}/images/logo.png"></a>
    <div class="search_con fl">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
    <div class="guest_cart fr">
        <a href="${ctx}/cart" class="cart_name fl">我的购物车</a>
        <div class="goods_count fl" id="show_count"></div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/layer/theme/default/layer.css">
<script>
    <c:if test="${not empty sessionScope.sessionUser}">
        $("#show_count").text(${sessionScope.totalCount})
    </c:if>
</script>