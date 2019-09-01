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

<script>
    $(function(){
        sendAjaxForCart();
    });
    //给定购物车，将购物车画出
    function drawCart(cart)
    {
        var html = "";
        $.each(cart.items,function(){
            html+= "     <ul class=\"cart_list_td clearfix\" id=\""+this.goods.id+"\">\n" +
                "\n" +
                "        <li class=\"col01\"><input type=\"checkbox\" class=\"checked\"\n" ;
            if (this.checked)
                html+=" checked";
            html+= "  value=\""+this.goods.id+"\"></li>\n" +
                "        <li class=\"col02\"><img src=\""+this.goods.img+"\"></li>\n" +
                "        <li class=\"col03\">"+this.goods.name+"<br><em>￥"+this.goods.price+"/"+this.goods.unit+"</em></li>\n" +
                "        <li class=\"col04\">"+this.goods.unit+"</li>\n" +
                "        <li class=\"col05\">\n" +
                "            ￥<em id=\"price_"+this.goods.id+"\">"+this.goods.price+"</em>\n" +
                "        </li>\n" +
                "        <li class=\"col06\">\n" +
                "            <div class=\"num_add\">\n" +
                "                <a href=\"javascript:;\" class=\"cart_add fl\" goodsId=\""+this.goods.id+"\">+</a>\n" +
                "                <input type=\"text\" class=\"num_show fl quantity\" value=\""+this.quantity+"\"\n" +
                "                       id=\"quantity_"+this.goods.id+"\"/>\n" +
                "                <a href=\"javascript:;\" class=\"cart_sub fl\" goodsId=\""+this.goods.id+"\">-</a>\n" +
                "            </div>\n" +
                "        </li>\n" +
                "        <li class=\"col07\">\n" +
                "            ￥<em id=\"totalPrice_"+this.goods.id+"\">"+this.totalPrice+"</em>\n" +
                "        </li>\n" +
                "        <li class=\"col08\"><a href=\"javascript:;\" class=\"cart_del\" id=\""+this.goods.id+"\">删除</a></li>\n" +
                "    </ul>";
        })
        $("#cart").html(html);
        $("#totalPrice").html(0.0);
        $("#totalQuantity").html(0);
        //右上角的数量显示
        $("#show_count").html(cart.totalCount);
        addEvent();//绑定事件
    }

    function updateCheckedInfo()
    {
        //根据各个商品的checked状态，来修改显示的信息
        var totalCheckedPrice = 0;  //被选中的总价
        var totalCheckedQuantity = 0;   //被选中的总数量
        $(".checked").each(function(){
            if ($(this).prop("checked"))  //如果该项目被选中
            {
                var goodsId = $(this).val();
                totalCheckedPrice+= Number($("#totalPrice_"+goodsId).text());
                totalCheckedQuantity+=Number($("#quantity_"+goodsId).val());
            }
        })
        totalCheckedPrice = totalCheckedPrice.toFixed(2);
        $("#totalPrice").html(totalCheckedPrice);
        $("#totalQuantity").html(totalCheckedQuantity);
    }
    //请求购物车数据
    function sendAjaxForCart()
    {
        $.getJSON("/getcart",{username:"${sessionScope.sessionUser.username}"},
        function(R)
        {
            if(R.code!=0)
            {
                alert(R.msg);
                return;
            }
            drawCart(R.data);
        }
        )
    }
</script>
<ul class="cart_list_th clearfix">
    <li class="col01">商品名称</li>
    <li class="col02">商品单位</li>
    <li class="col03">商品价格</li>
    <li class="col04">数量</li>
    <li class="col05">小计</li>
    <li class="col06">操作</li>
</ul>

<div id="cart">
</div>

<ul class="settlements">
    <li class="col01"><input type="checkbox" class="checkedAll" id="checkedAll"></li>
    <li class="col02">全选</li>
    <li class="col03">
        合计(不含运费)：<span>¥</span><em id="totalPrice"></em>
        <br>已选择<b id="totalQuantity"></b>件商品
    </li>
    <li class="col04"><a href="javascript:;" id="buy_btn" target="_blank">去结算</a></li>
</ul>

<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.js"></script>
<script>
    function addEvent()
    {
        // 取结算
        $('#buy_btn').bind('click', function () {
            var quantitys = new Array();
            var goodsIds = new Array();

            $('.checked:checked').each(function () {
                goodsIds.push($(this).val());
                quantitys.push($("#quantity_"+$(this).val()).val());
            });
            var url = '${ctx}/order/place?goodsIds=' + goodsIds + '&quantities=' + quantitys + '&fromCart=true';
            $(this).attr('href', url);
        });

        $('.checked').bind('click', function ()
            {
                updateCheckedInfo();//只要点击，就刷新总价重算。
            }
        );

        $('.checkedAll').bind('click', function ()
        {
            $(".checked").prop("checked",$(this).prop("checked"));
            //根据最新的选中状态，修改页面的元素
            updateCheckedInfo();
        });


        $('.cart_add').bind('click', function () {
            var goodsId = $(this).attr('goodsId');
            var quantity = $('#quantity_' + goodsId);
            var subTotalPrice = $("#totalPrice_"+goodsId);
            var price = $("#price_"+goodsId);

            $.ajax({
                url: '${ctx}/cart/update',
                type: 'post',
                dataType: 'json',
                data: {
                    goodsId: goodsId,
                    quantity: Number(quantity.val()) + 1
                },
                success: function (R) {
                    if (R.code == 0) {
                        $("#show_count").html(R.data.totalCount);
                        quantity.val(Number(quantity.val()) + 1);
                        subTotalPrice.text((Number(subTotalPrice.text()) + Number(price.text())).toFixed(2));
                        if ($(".checked[value="+goodsId+"]").prop("checked"))
                        {
                            updateCheckedInfo(); //修改选中的信息
                        }
                        /*
                        if (r.cartItem.checked) {
                            totalPrice.text((Number(totalPrice.text()) + Number(price.text())).toFixed(2));
                            totalQuantity.text(Number(totalQuantity.text()) + 1);
                        }
                        */
                    } else {
                        layer.alert(r.msg)
                    }
                }
            })

        });

        $('.cart_sub').bind('click', function () {

            var goodsId = $(this).attr('goodsId');
            var quantity = $('#quantity_' + goodsId);
            var subTotalPrice = $("#totalPrice_"+goodsId);
            var price = $("#price_"+goodsId);
            if (quantity.val() > 1) {
                $.ajax({
                    url: '${ctx}/cart/update',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        goodsId: goodsId,
                        quantity: Number(quantity.val()) - 1
                    },
                    success: function (R) {
                        if (R.code == 0) {
                            $("#show_count").html(R.data.totalCount);
                            quantity.val(Number(quantity.val()) - 1);
                            subTotalPrice.text((Number(subTotalPrice.text()) - Number(price.text())).toFixed(2));
                            if ($(".checked[value="+goodsId+"]").prop("checked"))
                            {
                                updateCheckedInfo(); //修改选中的信息
                            }
                        } else {
                            layer.alert(r.msg)
                        }
                    }
                })
            }

        });


        $('.cart_del').bind('click', function ()
        {
            /*
            if(!layer.confirm("确定删除该项？",{icon:7}))
                return;
                */
            var goodsId = $(this).attr('id');
            if (!$(".checked[value="+goodsId+"]").prop("checked"))
            {
                layer.msg("请先选中该项！",{icon:7});
                return;
            }

            $.ajax({
                url: '${ctx}/cart/delete',
                type: 'post',
                dataType: 'json',
                data: {
                    goodsId: goodsId
                },
                success: function (R) {
                    if (R.code == 0) {
                        layer.msg(R.msg)
                        drawCart(R.data); //重画整个购物车
                    } else {
                        layer.alert(R.msg)
                    }
                }
            })
        });
    }
</script>
</body>
</html>