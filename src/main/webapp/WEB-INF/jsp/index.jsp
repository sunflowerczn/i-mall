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


<script>

    $(function(){
        sendAjaxForCategorys();
        sendAjaxForBanners();
        sendAjaxForPromotions();
        sendAjaxForFloors();
    })
    function sendAjaxForCategorys()
    {
        $.getJSON("${ctx}/findcategorys",null,
            function (R)
            {
                if (R.code==0)
                {
                    var html="";
                    var index = 0;
                    $.each(R.data,function(){
                        html+=" <li><a href=\"#model"+index+"\" class=\""+this.logo+"\">"+this.name+"</a></li>";
                        index++;
                    })
                    $("#category_ul").html(html);
                }
            }
        )
    }

    function sendAjaxForBanners()
    {
        $.getJSON("${ctx}/findbanners",null,
            function (R)
            {
                if (R.code==0)
                {
                    var html="";
                    $.each(R.data,function(){
                        html+="<li><img src=\""+this.img+"\" alt=\""+this.name+"\"></li>";

                    })
                    $("#banner_ul").html(html);
                    var html2 = "<script type=\"text/javascript\" src=\"${ctx}/js/slide.js\">";
                    html2 += "<//script>";
                    $("body").append(html2);
                }
            }
        )
    }


    function sendAjaxForPromotions()
    {
        $.getJSON("${ctx}/findpromotions",null,
            function (R)
            {
                if (R.code==0)
                {
                    var html="";
                    $.each(R.data,function(){
                        html+="<a href=\""+this.url+"\"><img src=\""+this.img+"\"></a>";

                    })
                    $("#promotion_div").html(html);
                }
            }
        )
    }

    function sendAjaxForFloors()
    {
        $.getJSON("${ctx}/findfloors",null,
            function (R)
            {
                if (R.code==0)
                {
                    var html="";
                    var index = 0;
                    $.each(R.data,function(){
                        html+="<div class=\"list_model\">\n" +
                            "        <div class=\"list_title clearfix\">\n" +
                            "            <h3 class=\"fl\" id=\"model"+index+"\">"+this.categoryName+"</h3>\n" +
                            "            <div class=\"subtitle fl\">\n" +
                            "                <span>|</span>\n" +
                            "                <a href=\"#\">鲜芒</a>\n" +
                            "                <a href=\"#\">加州提子</a>\n" +
                            "                <a href=\"#\">亚马逊牛油果</a>\n" +
                            "            </div>\n" +
                            "            <a href=\"#\" class=\"goods_more fr\" id=\"fruit_more\">查看更多 ></a>\n" +
                            "        </div>\n" +
                            "\n" +
                            "        <div class=\"goods_con clearfix\">\n" +
                            "            <div class=\"goods_banner fl\"><img src=\""+this.categoryImg+"\"></div>\n" +
                            "            <ul class=\"goods_list fl\">";

                            $.each(this.goodsList,function(){
                                html += "                    <li>\n" +
                                    "                        <h4><a href=\"${ctx}/goods/detail/"+this.id+"\" target=\"_blank\">"+this.name+"</a></h4>\n" +
                                    "                        <a href=\"${ctx}/goods/detail/"+this.id+"\" target=\"_blank\"><img src=\""+this.img+"\"></a>\n" +
                                    "                        <div class=\"prize\">¥"+this.price+"</div>\n" +
                                    "                    </li>"
                            })
                            html+="</ul>\n" +
                                "        </div>\n" +
                                "    </div>";
                            $("#vfloor_div").html(html);
                            index++;

                    })
                    $("#promotion_div").html(html);
                }
            }
        )
    }

</script>
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
    <ul class="subnav fl" id="category_ul">
    </ul>
    <div class="slide fl">
        <ul class="slide_pics" id="banner_ul">

        </ul>
        <div class="prev"></div>
        <div class="next"></div>
        <ul class="points"></ul>
    </div>
    <div class="adv fl" id="promotion_div">
    </div>
</div>

<div id="vfloor_div">  <!--楼层信息-->

</div>

<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-ui.min.js"></script>

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