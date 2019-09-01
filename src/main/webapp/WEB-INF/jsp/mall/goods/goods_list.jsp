<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../header.jsp" %>
<body>

<form class="layui-form">
    <div class="layui-input-inline" style="width: 250px;">
        <input type="text" name="name" id="name" placeholder="请输入商品名称" class="layui-input" autocomplete="off">
    </div>
    <div class="layui-input-inline" style="width: 60px;">
        <button class="layui-btn" lay-submit lay-filter="sreach" type="button"><i
                class="layui-icon">&#xe615;</i>搜索
        </button>
    </div>
</form>

<table id="data-table" lay-filter="filter"></table>

<script type="text/html" id="toolbar">
    <a lay-event="add" title="编辑" href="${ctx}/mall/goods/add" class="layui-btn layui-btn-sm">
        <i class="layui-icon">&#xe608;</i>添加
    </a>
    <a lay-event="delAll" title="批量删除" href="javascript:" class="layui-btn layui-btn-sm layui-btn-danger">
        <i class="layui-icon">&#xe640;</i>批量删除
    </a>
</script>

<script type="text/html" id="tool">
    <a lay-event="update" title="编辑" href="javascript:"><i class="layui-icon">&#xe642;</i></a>
    <a lay-event="del" title="删除" href="javascript:"> <i class="layui-icon">&#xe640;</i></a>
</script>

<%@ include file="../../footer.jsp" %>
<script>
    url_list = '${ctx}/mall/goods/list';
    url_add = '${ctx}/mall/goods/add';
    url_update = '${ctx}/mall/goods/update';
    url_del = '${ctx}/mall/goods/del';
    url_delAll = '${ctx}mall/goods/delAll';

    // 数据表格
    table = laytable.render({
        elem: '#data-table',
        url: url_list,  //数据接口
        cols: [[ //表头
            {field: 'id', title: 'ID', type: 'checkbox'},
            {field: 'name', title: '商品名称'},
            {field: 'price', title: '价格'},
            {field: 'unit', title: '单位'},
            {field: 'stock', title: '库存'},
            {
                field: 'status', title: '状态',
                templet: function (d) {
                    if (d.status === 0) {
                        return '已上架';
                    }
                    if (d.status === 1) {
                        return '已下架';
                    }
                }
            },
            {field: 'createTime', title: '创建时间'},
            {field: 'updateTime', title: '更新时间'},
            {fixed: 'right', toolbar: '#tool'}
        ]],
        toolbar: '#toolbar'
    });

    // 搜索按钮
    layform.on('submit(sreach)', function () {
        var name = $('#name').val();
        if (name) {
            table.reload({
                where: {
                    name: name
                }
            });
        } else {
            table.reload();
        }
    });

    // 表头工具栏
    laytable.on('toolbar(filter)', function (obj) {
        switch (obj.event) {
            // case 'add':
            //     x_admin_show('新增商品', url_add);
            //     break;
            case 'delAll':
                var data = laytable.checkStatus(obj.config.id).data;
                if (data.length > 0) {
                    layer.confirm('确认删除选中数据?', function (index) {
                        var ids = new Array();
                        for (var i in data) {
                            ids.push(data[i].id);
                        }
                        $.ajax({
                            url: url_delAll,
                            contentType: "application/json; charset=UTF-8",
                            type: 'post',
                            dateType: 'json',
                            data: JSON.stringify(ids),
                            success: function (r) {
                                if (r.code === 0) {
                                    layer.msg(r.msg);
                                    table.reload();
                                } else {
                                    layer.alert(r.msg)
                                }
                            }
                        })
                    })
                }
                break;
        }
    });

    //行数据操作
    laytable.on('tool(filter)', function (obj) {
        switch (obj.event) {
            case 'update':
                window.location.href = url_update + '/' + obj.data.id;
                //x_admin_show('编辑商品', url_update + '/' + obj.data.id);
                break;
            case 'list':
                table.reload({
                    where: {
                        parentId: obj.data.id
                    }
                });
                $('#parentId').val(obj.data.id);
                break;
            case 'del':
                layer.confirm('确认删除改行数据?', function () {
                    $.ajax({
                        url: url_del + '/' + obj.data.id,
                        type: 'get',
                        dateType: 'json',
                        success: function (r) {
                            if (r.code === 0) {
                                layer.msg(r.msg);
                                table.reload();
                            } else {
                                layer.alert(r.msg)
                            }
                        }
                    });
                });
                break;
        }
    });
</script>
</body>
</html>
