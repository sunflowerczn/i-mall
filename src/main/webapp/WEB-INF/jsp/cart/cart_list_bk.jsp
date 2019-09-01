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

<ul class="cart_list_th clearfix">
    <li class="col01">商品名称</li>
    <li class="col02">商品单位</li>
    <li class="col03">商品价格</li>
    <li class="col04">数量</li>
    <li class="col05">小计</li>
    <li class="col06">操作</li>
</ul>

<c:forEach var="cart" items="${cart.itemList}">
    <ul class="cart_list_td clearfix" id="${cart.goodsId}">

        <li class="col01"><input type="checkbox" class="checked"
                                 <c:if test="${cart.checked}">checked</c:if> value="${cart.goodsId}"></li>
        <li class="col02"><img src="${cart.goodsImg}"></li>
        <li class="col03">${cart.goodsName}<br><em>￥${cart.goodsPrice}/${cart.goodsUnit}</em></li>
        <li class="col04">${cart.goodsUnit}</li>
        <li class="col05">
            ￥<em id="price_${cart.goodsId}">${cart.goodsPrice}</em>
        </li>
        <li class="col06">
            <div class="num_add">
                <a href="javascript:;" class="cart_add fl" goodsId="${cart.goodsId}">+</a>
                <input type="text" class="num_show fl quantity" value="${cart.goodsQuantity}"
                       id="quantity_${cart.goodsId}"/>
                <input type="hidden" class="goodsId" value="${cart.goodsId}"/>
                <a href="javascript:;" class="cart_sub fl" goodsId="${cart.goodsId}">-</a>
            </div>
        </li>
        <li class="col07">
            ￥<em id="totalPrice_${cart.goodsId}">${cart.goodsTotalPrice}</em>
        </li>
        <li class="col08"><a href="javascript:;" class="cart_del" id="${cart.goodsId}">删除</a></li>
    </ul>
</c:forEach>


<ul class="settlements">
    <li class="col01"><input type="checkbox" class="checkedAll" <c:if test="${cart.checkedAll}">checked</c:if>></li>
    <li class="col02">全选</li>
    <li class="col03">
        合计(不含运费)：<span>¥</span><em id="totalPrice">${cart.totalPrice}</em>
        <br>已选择<b id="totalQuantity">${cart.checkedQuantity}</b>件商品
    </li>
    <li class="col04"><a href="javascript:;" id="buy_btn" target="_blank">去结算</a></li>
</ul>

<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.js"></script>
<script>
    // 取结算
    $('#buy_btn').bind('click', function () {
        var quantitys = new Array();
        $('.quantity').each(function () {
            quantitys.push($(this).val());
        });

        var goodsIds = new Array();
        $('.goodsId').each(function () {
            goodsIds.push($(this).val());
        });
        var url = '${ctx}/order/place?goodsIds=' + goodsIds + '&quantitys=' + quantitys + '&fromCart=true';
        $(this).attr('href', url);
    });

    $('.checked').bind('click', function () {
        var goodsId = $(this).val();
        var $_checked_list = $('.checked');
        var $_checked_all = $('.checkedAll');
        $.ajax({
            url: '${ctx}/cart/checked',
            type: 'post',
            dataType: 'json',
            data: {
                goodsId: goodsId,
                checked: $(this).prop('checked')
            },
            success: function (r) {
                if (r.code == 0) {
                    var checkedAll = true;
                    $_checked_list.each(function () {
                        if (!$(this).prop('checked')) {
                            checkedAll = false;
                            return;
                        }
                    });
                    $_checked_all.prop('checked', checkedAll);


                    var totalPrice = $('#totalPrice');
                    var totalQuantity = $('#totalQuantity');

                    if (r.cartItem.checked) {
                        totalPrice.text((Number(totalPrice.text()) + r.cartItem.goodsTotalPrice).toFixed(2));
                        totalQuantity.text(Number(totalQuantity.text()) + r.cartItem.goodsQuantity);

                    } else {
                        totalPrice.text((Number(totalPrice.text()) - r.cartItem.goodsTotalPrice).toFixed(2));
                        totalQuantity.text(Number(totalQuantity.text()) - r.cartItem.goodsQuantity);

                    }

                } else {
                    layer.alert(r.msg)
                }
            }
        });
    });

    $('.checkedAll').bind('click', function () {
        var $_this = $(this);
        var $_checked = $('.checked');
        $.ajax({
            url: '${ctx}/cart/checkedAll',
            type: 'post',
            dataType: 'json',
            data: {
                checkedAll: $(this).prop('checked')
            },
            success: function (r) {
                if (r.code == 0) {
                    if ($_this.prop('checked')) {
                        $_checked.prop('checked', true);
                    } else {
                        $_checked.prop('checked', false);
                    }

                    $('#totalPrice').text(r.cart.totalPrice);
                    $('#totalQuantity').text(r.cart.checkedQuantity);


                } else {
                    layer.alert(r.msg)
                }
            }
        });
    });


    $('.cart_add').bind('click', function () {

        var goodsId = $(this).attr('goodsId');

        var quantity = $('#quantity_' + goodsId);
        var price = $('#price_' + goodsId);
        var subTotalPrice = $('#totalPrice_' + goodsId);

        var totalPrice = $('#totalPrice');
        var totalQuantity = $('#totalQuantity');

        $.ajax({
            url: '${ctx}/cart/update',
            type: 'post',
            dataType: 'json',
            data: {
                goodsId: goodsId,
                quantity: Number(quantity.val()) + 1
            },
            success: function (r) {
                if (r.code == 0) {
                    $('#show_count').text(r.data);
                    quantity.val(Number(quantity.val()) + 1);
                    subTotalPrice.text((Number(subTotalPrice.text()) + Number(price.text())).toFixed(2));

                    if (r.cartItem.checked) {
                        totalPrice.text((Number(totalPrice.text()) + Number(price.text())).toFixed(2));
                        totalQuantity.text(Number(totalQuantity.text()) + 1);
                    }
                } else {
                    layer.alert(r.msg)
                }
            }
        })

    });

    $('.cart_sub').bind('click', function () {

        var goodsId = $(this).attr('goodsId');
        var quantity = $('#quantity_' + goodsId);
        if (quantity.val() > 1) {

            var price = $('#price_' + goodsId);
            var subTotalPrice = $('#totalPrice_' + goodsId);

            var totalPrice = $('#totalPrice');
            var totalQuantity = $('#totalQuantity');

            $.ajax({
                url: '${ctx}/cart/update',
                type: 'post',
                dataType: 'json',
                data: {
                    goodsId: goodsId,
                    quantity: Number(quantity.val()) - 1
                },
                success: function (r) {
                    if (r.code == 0) {
                        $('#show_count').text(r.data);
                        quantity.val(Number(quantity.val()) - 1);
                        subTotalPrice.text((Number(subTotalPrice.text()) - Number(price.text())).toFixed(2));

                        totalPrice.text((Number(totalPrice.text()) - Number(price.text())).toFixed(2));
                        totalQuantity.text(Number(totalQuantity.text()) - 1);
                    } else {
                        layer.alert(r.msg)
                    }
                }
            })
        }

    });


    $('.cart_del').bind('click', function () {
        var goodsId = $(this).attr('id');

        var quantity = $('#quantity_' + goodsId).val();
        var price = $('#totalPrice_' + goodsId).text();

        var totalPrice = $('#totalPrice').text();
        var totalQuantity = $('#totalQuantity').text();

        $.ajax({
            url: '${ctx}/cart/delete',
            type: 'post',
            dataType: 'json',
            data: {
                goodsId: goodsId
            },
            success: function (r) {
                if (r.code == 0) {
                    layer.msg(r.msg)
                    $('#' + goodsId).remove();
                    $('#show_count').text(r.data);


                    if (totalPrice > 0 && r.cartItem.checked) {
                        $('#totalPrice').text(totalPrice - r.cartItem.goodsTotalPrice);
                        $('#totalQuantity').text(totalQuantity - r.cartItem.goodsQuantity);
                    }
                } else {
                    layer.alert(r.msg)
                }
            }
        })
    });
</script>
</body>
</html>