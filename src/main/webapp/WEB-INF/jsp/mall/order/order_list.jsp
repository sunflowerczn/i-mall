<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../header.jsp" %>
<body>

<form class="layui-form" id="search-form">

    <div class="layui-input-inline" style="width: 250px;">
        <input type="text" name="orderNumber" placeholder="请输入订单编号" class="layui-input" autocomplete="off">
    </div>

    <div class="layui-input-inline" style="width: 250px;">
        <input type="text" name="mobile" placeholder="请输入下单人手机号" class="layui-input" autocomplete="off">
    </div>

    <div class="layui-input-inline" style="width: 60px;">
        <button class="layui-btn" lay-submit lay-filter="sreach" type="button"><i
                class="layui-icon">&#xe615;</i>搜索
        </button>
    </div>
</form>

<table id="data-table" lay-filter="filter"></table>

<script type="text/html" id="toolbar">

</script>

<script type="text/html" id="tool">
    <a lay-event="detail" title="详情" href="javascript:"><i class="layui-icon">&#xe63c;</i></a>
</script>

<%@ include file="../../footer.jsp" %>
<script>
    url_list = '${ctx}/mall/order/list';
    url_detail = '${ctx}/mall/order/detail';
    // 数据表格
    table = laytable.render({
        elem: '#data-table',
        url: url_list,  //数据接口
        cols: [[ //表头
            {field: 'orderNumber', title: 'ID', type: 'checkbox'},
            {field: 'orderNumber', title: '订单编号'},
            {field: 'mobile', title: '电话'},
            {field: 'username', title: '下单用户',
                templet: function (d) {
                    var realName = d.realName;
                    if(realName!=''){
                        return realName;
                    }
                    return d.username;
                }
            },
            {field: 'paymentAmount', title: '应付金额'},
            {field: 'orderStatus', title: '订单状态',
                templet: function (d) {
                //订单状态 0 待支付 1 待发货 2 待收货 3 待评价 4 已完成 5 交易关闭
                    var status = d.orderStatus;
                    switch (status) {
                        case 0:
                            return '待支付';
                        case 1:
                            return '待发货';
                        case 2:
                            return '待收货';
                        case 3:
                            return '待评价';
                        case 4:
                            return '已完成';
                        case 5:
                            return '交易关闭';
                    }
                }
            },
            {field: 'createTime', title: '下单时间'},
            {fixed: 'right', toolbar: '#tool'}
        ]],
        toolbar: '#toolbar'
    });

    // 搜索按钮
    layform.on('submit(sreach)', function () {
        table.reload({
            where: $("#search-form").serializeObject()
        });
    });

    //行数据操作
    laytable.on('tool(filter)', function (obj) {
        switch (obj.event) {
            case 'detail':
                var url = url_detail + '/' + obj.data.orderNumber;
                var id =new Date().getTime();
                parent.element.tabAdd('xbs_tab', {
                    title: '订单详情',
                    content: '<iframe tab-id="' + id + '" frameborder="0" src="' + url + '" scrolling="yes" class="x-iframe"></iframe>',
                    id: id
                });
                parent.element.tabChange('xbs_tab', id);
                break;
        }
    });
</script>
</body>
</html>
