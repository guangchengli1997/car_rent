<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="${PATH}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${PATH}/static/css/public.css" media="all"/>
    <link rel="stylesheet" href="${PATH}/static/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${PATH}/static/layui_ext/dtree/font/dtreefont.css">
</head>
<body class="childrenBody">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户姓名:</label>
            <div class="layui-input-inline">
                <input type="text" name="realname" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">登陆名称:</label>
            <div class="layui-input-inline">
                <input type="text" name="loginname" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户地址:</label>
            <div class="layui-input-inline">
                <input type="text" name="address" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户电话:</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" autocomplete="off" class="layui-input" lay-verify="required|phone">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-inline">
                <input type="text" name="identity" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-inline">
                <input type="radio" name="sex" value="1" title="男">
                <input type="radio" name="sex" value="0" title="女">
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center;">
        <div class="layui-input-block">
            <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询
            </button>
            <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
        </div>
    </div>
</form>


<!-- 搜索条件结束 -->

<!-- 数据表格开始 -->
<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
<div style="display: none;" id="userToolBar">
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteBatch">批量删除</button>
</div>
<div id="userBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="changeUserPwd">重置密码</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectUserRole">分配角色</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户姓名:</label>
                <div class="layui-input-inline">
                    <input type="hidden" name="userid">
                    <input type="text" name="realname" lay-verify="required" placeholder="请输入用户姓名" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登陆名称:</label>
                <div class="layui-input-inline">
                    <input type="text" name="loginname" lay-verify="required" placeholder="请输入用户登陆名称" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="identity" placeholder="请输入用户身份证号" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" placeholder="请输入用户地址" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户电话:</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" lay-verify="required|phone" placeholder="请输入用户电话" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户职位:</label>
                <div class="layui-input-inline">
                    <input type="text" name="position" placeholder="请输入用户职位" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户性别:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="1" checked="checked" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否可用:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="available" value="1" checked="checked" title="可用">
                    <input type="radio" name="available" value="0" title="不可用">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release"
                        lay-filter="doSubmit" lay-submit="">提交
                </button>
                <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh">重置
                </button>
            </div>
        </div>
    </form>

</div>

<!-- 添加和修改的弹出层结束 -->
<%--角色分配的弹出层开始--%>
<div style="display: none;" id="selectUserRole">
    <table class="layui-hide" id="roleTable" lay-filter="roleTable"></table>
</div>
<%--角色分配的弹出层结束--%>
<script src="${PATH}/static/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
    layui.extend({
        dtree: '${PATH}/static/layui_ext/dist/dtree'
    }).use(['jquery', 'layer', 'form', 'table', 'dtree'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var dtree = layui.dtree;
        //渲染数据表格
        tableIns = table.render({
            elem: '#userTable'   //渲染的目标对象
            , url: '${PATH}/user/loadAllUser' //数据接口
            , title: '用户数据表'//数据导出来的标题
            , toolbar: "#userToolBar"   //表格的工具条
            , height: 'full-200'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left', width: 80}
                , {field: 'userid', title: 'ID', align: 'center', width: 80}
                , {field: 'loginname', title: '用户名称', align: 'center', width: 80}
                , {field: 'identity', title: '身份证号', align: 'center', width: 180}
                , {field: 'realname', title: '真实姓名', align: 'center', width: 130}
                , {
                    field: 'sex', title: '性别', align: 'center', width: 60, templet: function (d) {
                        return d.sex == '1' ? '<font color=blue>男</font>' : '<font color=red>女</font>';
                    }
                }
                , {field: 'address', title: '住址', align: 'center', width: 60}
                , {field: 'phone', title: '电话号码', align: 'center', width: 160}
                , {field: 'position', title: '职位', align: 'center', width: 80}
                , {
                    field: 'available', title: '是否可用', align: 'center', width: 60, templet: function (d) {
                        return d.available == '1' ? '<font color=blue>可用</font>' : '<font color=red>不可用</font>';
                    }
                }
                , {fixed: 'right', title: '操作', toolbar: '#userBar', align: 'center'}
            ]]
            , done: function (data, curr, count) {
                // 如果当前页不是第一页，且删除之后这页没有数据了，那么跳到前一页
                if (count == 0 && curr != 1) {
                    tableIns.reload({
                        page: {
                            curr: curr - 1
                        }
                    })
                }
            }
        })
        //模糊查询
        $("#doSearch").click(function () {
            var params = $("#searchFrm").serialize();
            tableIns.reload({
                url: "${PATH}/user/loadAllUser?" + params
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(userTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddUser();
                    break;
                case 'deleteBatch':
                    deleteBatch();
                    break;
            }
            ;
        })
        //监听行工具事件
        table.on('tool(userTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('真的删除【' + data.realname + '】这个管理员吗', function (index) {
                    //向服务端发送删除指令
                    $.post("${PATH}/user/delUser", {userid: data.userid}, function (res) {
                        layer.msg(res.msg);
                        //刷新数据 表格
                        tableIns.reload();
                    })
                });
            } else if (layEvent === 'edit') { //编辑
                openUpdateUser(data);
            } else if (layEvent === 'selectUserMenu') {
                openselectUser(data);
            } else if (layEvent === 'selectUserRole') {
                openselectUserRole(data);
            } else if (layEvent === 'changeUserPwd') {
                layer.confirm("真的要重置这个用户的密码吗", {icon: 3, title: '提示'}, function () {
                    $.post("${PATH}/user/changeUserPwd", {userid: data.userid}, function (res) {
                        layer.msg(res.msg);
                    });
                })

            }
        });

        var url;
        var mainIndex;

        //打开添加页面
        function openAddUser() {
            mainIndex = layer.open({
                type: 1,
                title: '添加用户',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '300px'],
                success: function (index) {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    url = "${PATH}/user/addUser";
                }
            });
        }

        //打开修改页面
        function openUpdateUser(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改用户',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '300px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    url = "${PATH}/user/updateUser";
                }
            });
        }

        //保存，可用于修改和保存管理员
        form.on("submit(doSubmit)", function (obj) {
            //序列化表单数据
            var params = $("#dataFrm").serialize();
            console.log(params);
            $.post(url, params, function (obj) {
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex)
                //刷新数据 表格
                tableIns.reload();
            })
        });

        //批量删除
        function deleteBatch() {
            //得到选中的数据行
            var checkStatus = table.checkStatus('userTable');
            var data = checkStatus.data;
            var params = "";
            $.each(data, function (i, item) {
                if (i == 0) {
                    params += "ids=" + item.roleid;
                } else {
                    params += "&ids=" + item.roleid;
                }
            });
            layer.confirm('真的删除选中的这些用户吗', function (index) {
                //向服务端发送删除指令
                $.post("${PATH}/user/deleteBatchUser", params, function (res) {
                    layer.msg(res.msg);
                    //刷新数据 表格
                    tableIns.reload();
                })
            });
        }

        //打开给用户添加角色的弹出层
        function openselectUserRole(data) {
            console.log(data);
            var mainIndex = layer.open({
                type: 1,
                title: '分配【' + data.realname + '】的角色',
                content: $("#selectUserRole"),
                area: ['800px', '400px'],
                btnAlign: 'c',
                height: 'full',
                page: true,
                btn: ['<div class="layui-icon layui-icon-release">确认分配</div>', '<div class="layui-icon layui-icon-close">取消分配</div>'],
                yes: function (index, layero) {
                    var checkStatus = table.checkStatus('roleTable'); //idTest 即为基础参数 id 对应的值
                    var roleData = checkStatus.data //获取选中行的数据
                    var params = "userid=" + data.userid;
                    $.each(roleData, function (i, item) {
                        params += "&ids=" + item.roleid;
                    });

                    $.post("${PATH}/user/saveUserRole", params, function (res) {
                        //关闭弹出层
                        layer.close(mainIndex)
                        layer.msg(res.msg);

                    })
                },
                success: function (index) {
                    //渲染数据表格
                    var roleTableIns = table.render({
                        elem: '#roleTable'   //渲染的目标对象
                        , url: '${PATH}/user/initUserRoleTable?userid=' + data.userid //数据接口
                        , title: '角色列表'//数据导出来的标题
                        , cellMinWidth: 100 //设置列的最小默认宽度
                        , cols: [[   //列表数据
                            {type: 'checkbox', fixed: 'left'}
                            , {field: 'roleid', title: 'ID', align: 'center'}
                            , {field: 'rolename', title: '角色名称', align: 'center'}
                            , {field: 'roledesc', title: '角色备注', align: 'center'}
                        ]]
                    })
                }
            });
        }
    });
</script>
</body>
</html>


