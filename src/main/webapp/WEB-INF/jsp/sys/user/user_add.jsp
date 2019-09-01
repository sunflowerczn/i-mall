<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../header.jsp" %>
<body>
<form class="layui-form" id="data-from">

    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="required"
                   placeholder="请输入用户名" class="layui-input" autocomplete="off">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" name="email" required lay-verify="email"
                   placeholder="请输入用户名" class="layui-input" autocomplete="off">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" name="phone" required lay-verify="phone"
                   placeholder="请输入用户名" class="layui-input" autocomplete="off">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">初始化密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required"
                   placeholder="请输入初始化密码" class="layui-input" autocomplete="off">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-sm" lay-submit lay-filter="add" type="button">保存</button>
            <button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<%@ include file="../../footer.jsp" %>

<script>
    //监听提交
    layform.on('submit(add)', function () {
        $.ajax({
            url: '${ctx}/sys/user/add',
            type: 'post',
            dataType: 'json',
            data: $('#data-from').serialize(),
            success: function (r) {
                if (r.code == 0) {
                    layer.msg(r.msg, {
                        time: 1000
                    }, function () {
                        parent.table.reload();
                        parent.layer.closeAll();
                    })
                } else {
                    layer.alert(r.msg);
                }
            }
        })
    });
</script>
</body>
</html>
