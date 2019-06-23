<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <link rel="stylesheet" href="static/layui/css/layui.css"  media="all">
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/layui/layui.js" charset="utf-8"></script>
    <style>
        #content{
            width: 600px;
            margin: 50px auto;
        }
        .layui-table-cell{
            text-align: center;
        }
    </style>
</head>
<body>

<div id="content">
    <div class="demoTable">
        ID：
        <div class="layui-inline">
            <input class="layui-input" name="userId" id="userId" autocomplete="off">
        </div>
        名字：
        <div class="layui-inline">
            <input class="layui-input" name="userName" id="userName" autocomplete="off">
        </div>
        <button class="layui-btn layui-btn-normal" data-type="reload">搜索</button>
    </div>

    <table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>
</div>

<script>
    layui.use('table', function(){
        var table = layui.table;
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/userinfo'
            ,limit:5
            ,limits:[5,10,20]
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'userId', title: 'ID', width:100, sort: true}
                ,{field:'userName', title: '名字', width:120}
                ,{field:'age', title: '年龄', width:100, sort: true}
                ,{field:'phone', title: '电话', width:130}
                ,{field:'address', title: '地址'}
            ]]
            ,id: 'testReload'
            ,page: true
        });
        var $ = layui.$, active = {
            reload: function(){
                var idNode = $('#userId');
                var nameNode = $('#userName');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        userId: idNode.val(),
                        userName: nameNode.val()
                    }
                });
            }
        };
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');// type='reload'
            active[type] ? active[type].call(this) : '';
        });
    });
</script>

</body>
</html>