<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../header.jsp" %>
<body>

<form class="layui-form">
    <div class="layui-input-inline" style="width: 250px;">
        <input type="text" name="name" id="name" placeholder="请输入活动名称" class="layui-input" autocomplete="off">
    </div>
    <div class="layui-input-inline" style="width: 60px;">
        <button class="layui-btn" lay-submit lay-filter="sreach" type="button"><i
                class="layui-icon">&#xe615;</i>搜索
        </button>
    </div>
</form>

<table id="data-table" lay-filter="filter"></table>

<script type="text/html" id="toolbar">
    <button lay-event="add" class="layui-btn layui-btn-sm">
        <i class="layui-icon">&#xe608;</i>添加
    </button>
    <button lay-event="delAll" class="layui-btn layui-btn-sm layui-btn-danger">
        <i class="layui-icon">&#xe640;</i>批量删除
    </button>
</script>

<script type="text/html" id="tool">
    <a lay-event="update" title="编辑" href="javascript:"><i class="layui-icon">&#xe642;</i></a>
    <a lay-event="del" title="删除" href="javascript:"> <i class="layui-icon">&#xe640;</i></a>
</script>

<%@ include file="../../footer.jsp" %>
<script>

    url_list = '${ctx}/mall/promotion/list';
    url_add = '${ctx}/mall/promotion/add';
    url_update = '${ctx}/mall/promotion/update';
    url_del = '${ctx}/mall/promotion/del';
    url_delAll = '${ctx}/mall/promotion/delAll';

    // 数据表格
    table = laytable.render({
        elem: '#data-table',
        url: url_list,  //数据接口
        cols: [[ //表头
            {field: 'id', title: 'ID', type: 'checkbox'},
            {field: 'name', title: '图片名称',
                templet: function (d) {
                    return '<a href="' + d.url + '" target="_blank">' + d.name + '</a>'
                }
            },
            {
                field: 'img', title: '活动图片',
                templet: function (d) {
                    return '<img src="' + d.img + '" width="100px">'
                }
            },
            {
                field: 'url', title: '活动链接',
                templet: function (d) {
                    return '<a href="' + d.url + '" target="_blank">' + d.url + '</a>'
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
            case 'add':
                x_admin_show('新增分类', url_add);
                break;
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
                x_admin_show('编辑分类', url_update + '/' + obj.data.id);
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
