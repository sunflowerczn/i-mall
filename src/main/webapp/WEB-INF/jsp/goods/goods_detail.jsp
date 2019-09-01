<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生鲜-商品详情</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/main.css">
</head>

<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/search_bar.jsp" %>

<script>
    $(function()
    {
        sendAjaxForDetail(${goods_id})
    })
    function sendAjaxForDetail(goodsId)
    {
        $.getJSON("${ctx}/goods/detail/getdetail",{goodsId:goodsId},
            function(R){
                if (R.code==0)
                {
                    $("#img").attr("src",R.data.detailImg);
                    $("#show_prize").html("¥<em>"+R.data.price+"</em>");
                    $("#show_unit").text("单  位："+R.data.unit+")");
                    $("#total").html("¥<em>"+R.data.price+"</em>");
                    $("#goods_name").html(R.data.name);
                    $("#introduce").html(R.data.introduce);
                    $("#detail_dd").html(R.data.detail);

                }
            }
        )
    }

</script>
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
    <span>></span>
    <a href="#">商品详情</a>
</div>


<div class="goods_detail_con clearfix">
    <div class="goods_detail_pic fl"><img src="#" id="img"></div>

    <div class="goods_detail_list fr">
        <h3 id="goods_name"></h3>
        <p id="introduce"></p>
        <div class="prize_bar">
            <span class="show_pirze" id="show_prize"></span>
            <span class="show_unit" id="show_unit"></span>
        </div>
        <div class="goods_num clearfix">
            <div class="num_name fl">数 量：</div>
            <div class="num_add fl">
                <input type="text" class="num_show fl" value="1" id="quantity">
                <a href="javascript:;" class="add fr">+</a>
                <a href="javascript:;" class="minus fr">-</a>
            </div>
        </div>
        <div class="total" id="total"></div>
        <div class="operate_btn">
            <a href="javascript:;" class="buy_btn" id="buy_btn" target="_blank">立即购买</a>
            <a href="javascript:;" class="add_cart" id="add_cart">加入购物车</a>
        </div>
    </div>
</div>

<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>新品推荐</h3>
            <ul>
                <li>
                    <a href="#"><img src="${ctx}/images/goods/goods001.jpg"></a>
                    <h4><a href="#">进口柠檬</a></h4>
                    <div class="prize">￥3.90</div>
                </li>
                <li>
                    <a href="#"><img src="${ctx}/images/goods/goods002.jpg"></a>
                    <h4><a href="#">玫瑰香葡萄</a></h4>
                    <div class="prize">￥16.80</div>
                </li>
            </ul>
        </div>
    </div>

    <div class="r_wrap fr clearfix">
        <ul class="detail_tab clearfix">
            <li id='tag_detail' class="active">商品介绍</li>
        </ul>

        <div class="tab_content" id="tab_detail">
            <dl>
                <dt>商品详情：</dt>
                <dd id="detail_dd"></dd>
            </dl>
        </div>
    </div>
</div>


<div class="add_jump"></div>
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript">
    // 计算商品的总价格
    function update_goods_amount() {
        // 获取商品的单价和数量
        price = $('.show_pirze').children('em').text()
        count = $('.num_show').val()
        // 计算商品的总价
        price = parseFloat(price)
        count = parseInt(count)
        amount = price * count
        // 设置商品的总价
        $('.total').children('em').text(amount.toFixed(2) + '元')
    }

    // 增加商品的数量
    $('.add').click(function () {
        // 获取商品原有的数目
        count = $('.num_show').val()
        // 加1
        count = parseInt(count) + 1
        // 重新设置商品的数目
        $('.num_show').val(count)
        // 更新商品的总价
        update_goods_amount()
    })

    // 减少商品的数量
    $('.minus').click(function () {
        // 获取商品原有的数目
        count = $('.num_show').val()
        // 减1
        count = parseInt(count) - 1
        if (count <= 0) {
            count = 1
        }
        // 重新设置商品的数目
        $('.num_show').val(count)
        // 更新商品的总价
        update_goods_amount()
    })

    // 手动输入商品的数量
    $('.num_show').blur(function () {
        // 获取用户输入的数目
        count = $(this).val()
        // 校验count是否合法
        if (isNaN(count) || count.trim().length == 0 || parseInt(count) <= 0) {
            count = 1
        }
        // 重新设置商品的数目
        $(this).val(parseInt(count))
        // 更新商品的总价
        update_goods_amount()
    })


    // 立即下单
    $('#buy_btn').bind('click', function () {
        var quantity = $('#quantity').val();
        var url = '${ctx}/order/place?goodsIds=' + ${goods_id} +'&quantitys=' + quantity + '&fromCart=false';
        $(this).attr('href', url);
    });


    // 获取add_cart div元素左上角的坐标
    var $add_x = $('#add_cart').offset().top;
    var $add_y = $('#add_cart').offset().left;

    // 获取show_count div元素左上角的坐标
    var $to_x = $('#show_count').offset().top;
    var $to_y = $('#show_count').offset().left;

    // 添加商品到购物车
    $('#add_cart').bind('click', function () {

        var member = '${sessionScope.sessionUser}';
        if(member == ''){
            window.location.href = "${ctx}/login"
            return;
        }

        $.ajax({
            url: '/cart/add',
            data: {
                goodsId: '${goods_id}',
                quantity: $('#quantity').val()  //数量
            },
            dataType: 'json',
            type: 'post',
            success: function (r) {
                if (r.code === 0) {
                    // 添加成功
                    $(".add_jump").css({'left': $add_y + 80, 'top': $add_x + 10, 'display': 'block'})
                    $(".add_jump").stop().animate({
                            'left': $to_y + 7,
                            'top': $to_x + 7
                        },
                        "fast", function () {
                            $(".add_jump").fadeOut('fast', function () {
                                // 重新设置用户购物车中商品的条目数
                                $('#show_count').html(r.data);
                            });
                        });
                } else {
                    // 添加失败
                    alert(r.msg)
                }
            }
        });


    })
</script>

</body>
</html>