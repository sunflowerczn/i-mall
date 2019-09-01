<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../header.jsp" %>
<body>


<form class="layui-form">
    <div class="layui-input-inline" style="width: 400px;">
        <input type="text" name="name" id="name" placeholder="请输入分类名称" class="layui-input" autocomplete="off">
    </div>
    <div class="layui-input-inline">
        <button class="layui-btn" lay-submit lay-filter="sreach" type="button"><i class="layui-icon">&#xe615;</i>搜索
        </button>
    </div>
</form>


<table id="data-table" lay-filter="filter"></table>

<%@ include file="../../footer.jsp" %>
<script>
    url_list = '${ctx}/mall/category/list';
    // 数据表格
    table = laytable.render({
        elem: '#data-table',
        url: url_list,  //数据接口
        cols: [[ //表头
            {field: 'id', title: 'ID', type: 'radio'},
            {field: 'name', title: '类目名称'}
        ]]
    });

    laytable.on('radio(filter)', function(obj){
        $("#selectCategory",window.parent.document).val(obj.data.name);
        $("#categoryId",window.parent.document).val(obj.data.id);
        parent.layer.closeAll();
        parent.layer.msg('已选择类目:' + obj.data.name)
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
</script>
</body>
</html>
