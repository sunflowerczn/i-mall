<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生鲜-登录</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="js/jquery.min.js"></script>
</head>
<body>
<div class="login_top clearfix">
    <a href="/" class="login_logo"><img src="images/logo.png"></a>
</div>
<div class="login_form_bg">
    <div class="login_form_wrap clearfix">
        <div class="login_banner fl"></div>
        <div class="slogan fl">多快好省 · 只为品质</div>
        <div class="login_form fr">
            <div class="login_title clearfix">
                <h1>用户登录</h1>
                <a href="${ctx}/member/register">立即注册</a>
            </div>
            <div class="form_input">
                <form id="login-form" onsubmit="return false">
                    <input type="text" name="username" id="username" class="name_input" placeholder="请输入用户名"
                           autocomplete="off">
                    <div class="user_error">请输入用户名</div>
                    <input type="password" name="password" id="password" class="pass_input" placeholder="请输入密码"
                           autocomplete="off">
                    <div class="pwd_error">请输入密码</div>
                    <div class="more_input clearfix">
                        <input type="checkbox" name="rembermer" value="0">
                        <label>记住用户名</label>
                        <a href="#">忘记密码</a>
                    </div>

                    <input type="button" value="登录" class="input_submit" id="btn-login">
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $('#btn-login').bind('click', function (e) {
        var username = $('#username').val();
        var password = $('#password').val();
        if (username == '') {
            $('.user_error').show();
        } else if (password == '') {
            $('.pwd_error').show();
        } else {
            $.ajax({
                url: '/login',
                type: 'post',
                dataType: 'json',
                data: $('#login-form').serialize(),
                success: function (r) {
                    if (r.code === 0) {
                        window.location.href = '/'
                    } else {
                        alert(r.msg);
                    }
                }
            })
        }
    })
</script>
</body>
</html>