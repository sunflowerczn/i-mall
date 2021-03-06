<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../header.jsp" %>
<body>

<form class="layui-form" id="data-from">
    <input type="hidden" name="id" value="${banner.id}">
    <div class="layui-form-item">
        <label class="layui-form-label">图片名称</label>
        <div class="layui-input-inline">
            <input type="text" name="name" required lay-verify="required"
                   placeholder="请输入名称" class="layui-input" autocomplete="off" value="${banner.name}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">关联商品</label>
        <div class="layui-input-inline">
            <input id="selectGoods" type="text" readonly
                   placeholder="请选择商品" class="layui-input" lay-verify="required" value="${goods.name}">
            <input id="goodsId" name="goodsId" type="hidden" value="${banner.goodsId}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">展示顺序</label>
        <div class="layui-input-inline">
            <input type="text" name="sort" required lay-verify="required|number"
                   placeholder="请输入数字" class="layui-input" autocomplete="off" value="${banner.sort}">
        </div>
    </div>

    <hr>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline">
            <img id="img" src='${banner.img}' width="100px"/>
            <input type="hidden" name="img" id="input-img" lay-verify="requiredFile" value="${banner.img}">
        </div>
    </div>
    <hr>
    <button type="button" class="layui-btn layui-btn-sm" id="upload">
        <i class="layui-icon">&#xe67c;</i>上传图片
    </button>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-sm" lay-submit lay-filter="add" type="button">保存</button>
            <button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<%@ include file="../../footer.jsp" %>

<script>

    $('#selectGoods').click(function () {
        x_admin_show('商品信息', '${ctx}/mall/goods/select');
    });

    layupload.render({
        elem: '#upload', //绑定元素
        accept: 'images', //images（图片）、file（所有文件）、video（视频）、audio（音频）
        acceptMime: 'image/*', //只显示图片文件
        field: 'uploadFile',
        url: '${ctx}/qiniuUpload', //上传接口
        done: function (r) {
            if (r.code == 0) {
                layer.msg(r.msg)
                $('#img').attr('src', r.data)
                $('#img').attr('width', '200px')
                $('#input-img').val(r.data)
            } else {
                layer.alert(r.msg)
            }
        }
    });
    layform.verify({
        requiredFile: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (value == '') {
                return '请上传图片'
            }
        }
    });

    //监听提交
    layform.on('submit(add)', function () {
        $.ajax({
            url: '${ctx}/mall/banner/update',
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
