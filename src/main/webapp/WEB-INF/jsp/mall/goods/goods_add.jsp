<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../header.jsp" %>
<body>
<form class="layui-form" id="data-from">
    <div class="layui-tab layui-tab-brief mall-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">基本信息</li>
            <li>商品图片</li>
            <li>商品详情</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="layui-form-item">
                    <label class="layui-form-label">商品名称</label>
                    <div class="layui-input-block" style="width: 60%">
                        <input type="text" name="name" required lay-verify="required"
                               placeholder="请输入商品名称" class="layui-input" autocomplete="off">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">商品分类</label>
                    <div class="layui-input-inline">
                        <input id="selectCategory" type="text" readonly
                               placeholder="请输入商品分类" class="layui-input" lay-verify="required">
                        <input id="categoryId" name="categoryId" type="hidden">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">商品简介</label>
                    <div class="layui-input-block" style="width: 80%">
                        <input type="text" name="introduce" required lay-verify="required"
                               placeholder="请输入商品简介" class="layui-input" autocomplete="off">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">商品价格</label>
                    <div class="layui-input-inline">
                        <input type="text" name="price" required lay-verify="required|number"
                               placeholder="请输入数字" class="layui-input" autocomplete="off">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">价格单位</label>
                    <div class="layui-input-inline">
                        <input type="text" name="unit" required lay-verify="required"
                               placeholder="请输入价格单位" class="layui-input" autocomplete="off">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">库存数量</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stock" required lay-verify="required"
                               placeholder="请输入库存数量" class="layui-input" autocomplete="off">
                    </div>
                </div>

                <hr>
                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <img id="img" src='${ctx}/images/no.png' width="100px"/>
                        <input type="hidden" name="img" id="input-img" lay-verify="requiredFile">
                    </div>
                </div>
                <hr>
                <button type="button" class="layui-btn layui-btn-sm" id="uploadImg">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
            </div>


            <div class="layui-tab-item">
                <img id="detail-img" src='${ctx}/images/no.png' width="100px"/>
                <input type="hidden" name="detailImg" id="input-detail-img" lay-verify="requiredFile">
                <hr>
                <button type="button" class="layui-btn layui-btn-sm" id="uploadDetailImg">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
            </div>


            <div class="layui-tab-item">
                <textarea id="editor_id" name="detail" style="width:100%;height: 350px;"></textarea>
            </div>

            <hr>
            <button class="layui-btn layui-btn-sm" lay-submit lay-filter="add" type="button">保存</button>

        </div>
    </div>
</form>
<%@ include file="../../footer.jsp" %>
<script src="${ctx}/lib/kindeditor/kindeditor.min.js"></script>
<script src="${ctx}/lib/kindeditor/lang/zh-CN.js"></script>
<script>


    $('#selectCategory').click(function () {
        x_admin_show('选中商品分类', '${ctx}/mall/category/select');
    });

    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id',{
            uploadJson : '${ctx}/kindeditorUpload'
        });
    });

    layupload.render({
        elem: '#uploadImg', //绑定元素
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

    layupload.render({
        elem: '#uploadDetailImg', //绑定元素
        accept: 'images', //images（图片）、file（所有文件）、video（视频）、audio（音频）
        acceptMime: 'image/*', //只显示图片文件
        field: 'uploadFile',
        url: '${ctx}/aliyunUpload', //上传接口
        done: function (r) {
            if (r.code == 0) {
                layer.msg(r.msg)
                $('#detail-img').attr('src', r.data)
                $('#detail-img').attr('width', '200px')
                $('#input-detail-img').val(r.data)
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
        editor.sync();
        $.ajax({
            url: '${ctx}/mall/goods/add',
            type: 'post',
            dataType: 'json',
            data: $('#data-from').serialize(),
            success: function (r) {
                if (r.code == 0) {
                    layer.msg(r.msg, {
                        time: 1000
                    }, function () {
                        window.location.href='${ctx}/goods';
                        // parent.table.reload();
                        // parent.layer.closeAll();
                    });
                } else {
                    layer.alert(r.msg);
                }
            }
        })
    });
</script>
</body>
</html>
