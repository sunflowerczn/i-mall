<%@ page contentType="text/html;charset=UTF-8" %>
<script src="${ctx}/lib/jquery/jquery.min.js"></script>
<script src="${ctx}/lib/jquery/jquery.ext.js"></script>
<script src="${ctx}/lib/layui/layui.all.js"></script>
<script src="${ctx}/js/xadmin.js"></script>
<script>
    layform = layui.form;
    laytable = layui.table;
    layupload = layui.upload;

    laytable.set({
        page: {
            layout:['count','prev', 'page', 'next','limit','refresh','skip']
        }, //开启分页
        limit: 5,
        limits: [5, 8, 10, 15, 20, 30, 40, 50, 60, 70, 80, 90],
        request: {
            pageName: 'pageNum', //页码的参数名称，默认：page
            limitName: 'pageSize' //每页数据量的参数名，默认：limit
        },
        response: {
            statusName: 'code', //规定数据状态的字段名称，默认：code
            statusCode: 0, //规定成功的状态码，默认：0
            msgName: 'msg', //规定状态信息的字段名称，默认：msg
            countName: 'total', //规定数据总数的字段名称，默认：count
            dataName: 'data' //规定数据列表的字段名称，默认：data
        },
        //skin: 'line', //行边框风格
        // even: false, //开启隔行背景
        // size: 'sm', //小尺寸的表格
        // height: 'full-55'
    });
</script>

