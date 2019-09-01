<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8>
    <title>爱生鲜-注册</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/main.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
</head>
<body>
<div class="register_con">
    <div class="l_con fl">
        <a class="reg_logo"><img src="${ctx}/images/logo.png"></a>
        <div class="reg_slogan">多块好省 · 只为品质</div>
        <div class="reg_banner"></div>
    </div>
    <div class="r_con fr">
        <div class="reg_title clearfix">
            <h1>用户注册</h1>
            <a href="${ctx}/login">登录</a>
        </div>
        <div class="reg_form clearfix">
            <form id="register-form">
                <ul>
                    <li>
                        <label>用户名:</label>
                        <input type="text" name="username" id="username">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密码:</label>
                        <input type="password" name="password" id="password">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>确认密码:</label>
                        <input type="password" name="cpwd" id="cpwd">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>邮箱:</label>
                        <input type="text" name="email" id="email">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li class="agreement">
                        <input type="checkbox" name="allow" id="allow" checked="checked">
                        <label>同意"爱生鲜用户使用协议"</label>
                        <span class="error_tip2">提示信息</span>
                    </li>
                    <li class="reg_sub">
                        <input type="button" value="注 册" id="btn-register">
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
<script>
    var error_name = false;
    var error_password = false;
    var error_check_password = false;
    var error_email = false;
    var error_check = false;

    $('#username').blur(function () {
        check_user_name();
    });

    $('#password').blur(function () {
        check_pwd();
    });

    $('#cpwd').blur(function () {
        check_cpwd();
    });

    $('#email').blur(function () {
        check_email();
    });

    $('#allow').click(function () {
        if ($(this).is(':checked')) {
            error_check = false;
            $(this).siblings('span').hide();
        }
        else {
            error_check = true;
            $(this).siblings('span').html('请勾选同意');
            $(this).siblings('span').show();
        }
    });


    function check_user_name() {
        var len = $('#username').val().length;
        if (len < 5 || len > 20) {
            $('#username').next().html('请输入5-20个字符的用户名')
            $('#username').next().show();
            error_name = true;
        }
        else {
            $('#username').next().hide();
            error_name = false;
        }
    }

    function check_pwd() {
        var len = $('#password').val().length;
        if (len < 8 || len > 20) {
            $('#password').next().html('密码最少8位，最长20位')
            $('#password').next().show();
            error_password = true;
        }
        else {
            $('#password').next().hide();
            error_password = false;
        }
    }


    function check_cpwd() {
        var pass = $('#password').val();
        var cpass = $('#cpwd').val();

        if (pass != cpass) {
            $('#cpwd').next().html('两次输入的密码不一致')
            $('#cpwd').next().show();
            error_check_password = true;
        }
        else {
            $('#cpwd').next().hide();
            error_check_password = false;
        }

    }

    function check_email() {
        var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;

        if (re.test($('#email').val())) {
            $('#email').next().hide();
            error_email = false;
        }
        else {
            $('#email').next().html('你输入的邮箱格式不正确')
            $('#email').next().show();
            error_check_password = true;
        }
    }

    $('#btn-register').bind('click',function () {
        check_user_name();
        check_pwd();
        check_cpwd();
        check_email();
        if (error_name == false && error_password == false
            && error_check_password == false
            && error_email == false
            && error_check == false) {

            // 校验通过的时候 向后台异步发送数据
            $.ajax({
                url:"${ctx}/member/register",
                type: "post",
                dataType: 'json',
                data: $('#register-form').serialize(),
                success: function (r) {
                    if (r.code === 0) {
                        alert("注册成功,请登录注册邮箱激活账号")
                        window.location.href = '${ctx}/login'
                    } else {
                        alert(r.msg)
                    }
                }
            })
        }
        else {
            return false;
        }


    });
</script>
</body>
</html>