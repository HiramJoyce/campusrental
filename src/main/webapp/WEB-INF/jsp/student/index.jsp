<%@ page import="com.campus.rental.domain.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <style>
        .pic {
            width: 100px;
            height: 100px;
        }

        .pic img {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body style="background: url('${ctx}/resource/imgs/Sports.png')">
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">校园二手租赁平台</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <%
                        if (session.getAttribute("role") == null || !session.getAttribute("role").equals("student")) {
                            response.sendRedirect("/");
                        } else {
                    %>
                    <div class="btn-group" role="group" aria-label="...">
                        <a href="#" type="button"
                           class="btn btn-link navbar-btn"><%=session.getAttribute("realName")%>
                        </a>
                        <a href="${ctx}/logout" class="btn btn-link navbar-btn">注销</a>
                    </div>
                    <%
                        }
                    %>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <% Student merchant = (Student) request.getAttribute("student"); %>
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist" id="myTabs">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                                  data-toggle="tab">修改信息</a></li>
        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">我的交易</a></li>
        <li role="presentation"><a href="#profile2" aria-controls="profile2" role="tab" data-toggle="tab">我的商品</a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="home">
            <div id="merchant" style="width: 300px; margin: 20px auto;">
                <form action="/merchant/register" method="post" accept-charset="UTF-8">
                    <input type="hidden" name="id" value="<%=merchant.getId()%>">
                    <div class="form-group">
                        <label for="userName">姓名</label>
                        <input type="text" name="realName" disabled class="form-control" id="userName"
                               value="<%=merchant.getRealName()%>">
                    </div>

                    <div class="form-group">
                        <label for="email">学号</label>
                        <input type="email" name="stuNum" disabled class="form-control" id="email"
                               value="<%=merchant.getStuNum()%>">
                    </div>

                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" name="password" class="form-control" id="password"
                               value="<%=merchant.getPassword()%>">
                    </div>

                    <div class="form-group">
                        <label for="password2">确认密码</label>
                        <input type="password" name="password2" class="form-control" id="password2"
                               value="<%=merchant.getPassword()%>">
                    </div>

                    <div class="form-group">
                        <label for="phone">电话</label>
                        <input type="text" name="phone" class="form-control" id="phone"
                               value="<%=merchant.getPhone()%>">
                    </div>

                    <div class="form-group">
                        <label for="wechat">微信</label>
                        <input type="text" name="birth" class="form-control" id="wechat"
                               value="<%=merchant.getWeChat()%>">
                    </div>

                    <div class="form-group">
                        <label for="qq">QQ</label>
                        <input type="text" name="birth" class="form-control" id="qq"
                               value="<%=merchant.getQq()%>">
                    </div>

                    <div class="form-group" style="text-align: center;">
                        <input class="btn btn-info" type="submit" id="submit" value="保存">
                    </div>
                </form>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="profile" style="padding-top: 10px;">
            <table id="tradeTable" class="table table-striped table-hover table-bordered">
                <thead>
                <tr>
                    <td>ID</td>
                    <td>交易时间</td>
                    <td>状态</td>
                    <td>进度</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div role="tabpanel" class="tab-pane" id="profile2" style="padding-top: 10px;">
            <div>
                <div style="float: left;"><h2 style="margin-top: 0;">我的方案</h2></div>
                <div style="float: right;">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                        发布商品
                    </button>
                </div>
                <div style="clear: both;"></div>
            </div>
            <div>
                <ul class="list-group" id="programmes">

                </ul>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">发布商品</h4>
                        </div>
                        <form style="margin: 0;" action="${ctx}/good/create" method="post"
                              enctype="multipart/form-data">
                            <div class="modal-body" style="padding-bottom: 0;">
                                <div class="form-group">
                                    <label for="type">种类</label>
                                    <input type="text" name="type" class="form-control" id="type">
                                </div>
                                <div class="form-group">
                                    <label for="old">新旧程度</label>
                                    <input type="text" name="old" class="form-control" id="old">
                                </div>
                                <div class="form-group">
                                    <label for="name">商品名</label>
                                    <input type="text" name="name" class="form-control" id="name">
                                </div>
                                <div class="form-group">
                                    <label for="title">标题</label>
                                    <input type="text" name="title" class="form-control" id="title">
                                </div>
                                <div class="form-group">
                                    <label for="content">商品描述</label>
                                    <input type="text" name="content" class="form-control" id="content">
                                </div>

                                <div class="form-group">
                                    <label for="price">价格</label>
                                    <div class="input-group">
                                        <input type="text" id="price" name="price" class="form-control"
                                               aria-label="...">
                                        <div class="input-group-btn" style="width: 149px;">
                                            <button type="button" class="btn btn-default" style="width: 50px;">/</button>
                                            <%--<button type="button" class="btn btn-default dropdown-toggle"--%>
                                                    <%--data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                                                <%--Action <span class="caret"></span></button>--%>
                                            <select name="timeUnit" class="form-control" style="border-left: none; float: right; width: 100px; border-bottom-right-radius: 4px; border-top-right-radius: 4px;">
                                                <option value="0">小时</option>
                                                <option value="1">天</option>
                                                <option value="2">周</option>
                                                <option value="3">月</option>
                                                <option value="4">年</option>
                                            </select>
                                        </div><!-- /btn-group -->
                                    </div><!-- /input-group -->
                                </div>
                                <div class="form-group">
                                    <label for="phone1">联系电话</label>
                                    <input type="text" name="phone" class="form-control" id="phone1">
                                </div>
                                <div class="form-group">
                                    <label for="weChat1">微信</label>
                                    <input type="text" name="weChat" class="form-control" id="weChat1">
                                </div>
                                <div class="form-group">
                                    <label for="qq1">QQ</label>
                                    <input type="text" name="qq" class="form-control" id="qq1">
                                </div>
                                <div class="form-group">
                                    <label for="file">展示图</label>
                                    <input class="uploadImg" type="file" name="img" multiple id="file">
                                    <p class="help-block">最多选择五张图像</p>
                                    <div style="height: 100px;" id="showImg"></div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" value="发布"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- <script src="${ctx}/resource/js/canvas-nest.js"></script> -->
<script>
    $(function () {
        loadTrades();
        $("#file").change(function () {
            var files = this.files;
            var length = files.length;
            if (length > 5) {
                alert("请选择不多于五张图片");
                this.val(null);
                return
            }
            var showImg = $("#showImg");
            showImg.empty();
            for (var i = 0; i < length; i++) {
                var fr = new FileReader();
                fr.onload = function (e) {
                    $("#showImg").append('<div class="pic" style="float: left;"><img src="' + this.result + '"/></div>');
                };
                fr.readAsDataURL(files[i]);//读取文件
            }
            showImg.append('<div style="clear: both;"></div>')
        })
    });

    function loadTrades() {
        $.post("${ctx}/student/tradesFrom", function (data) {
            console.log(data);
            if (data.code === 1) {
                for (var i = 0; i < data.data.length; i++) {
                    $("#tradeTable tbody").append('<tr id="' + data.data[i].id + '">\n' +
                        '                    <td style="vertical-align: middle;"><a href="/trade/detial?id=' + data.data[i].id + '">' + data.data[i].id + '\n' +
                        '                    </a></td>\n' +
                        '                    <td style="vertical-align: middle;">' + new Date(parseInt(data.data[i].buyDate)).toLocaleString().replace(/:\d{1,2}$/, ' ') + '\n' +
                        '                    </td>\n' +
                        '                    <td style="vertical-align: middle;">' + (data.data[i].state === "buy" ? "等待施工" : data.data[i].state === "start" ? "正在施工" : data.data[i].state === "end" ? "等待质检" : data.data[i].state === "finish" || data.data[i].state === "finished" ? "交易完成" : "质检失败") + '\n' +
                        '                    </td>\n' +
                        '                    <td style="vertical-align: middle;">\n' +
                        '                        <div class="progress" style="width: 400px; margin: auto;">\n' +
                        '                            <div class="progress-bar progress-bar-' + (data.data[i].state === "finish" || data.data[i].state === "finished" ? "success" : "warning active") + ' progress-bar-striped"\n' +
                        '                                 role="progressbar"\n' +
                        '                                 aria-valuenow="75" aria-valuemin="0"\n' +
                        '                                 aria-valuemax="100"\n' +
                        '                                 style="width: ' + (data.data[i].state === "buy" || data.data[i].state === "unfinish" ? "15" : data.data[i].state === "start" ? "75" : data.data[i].state === "end" ? "90" : "100") + '%">\n' +
                        '                                <span class="sr-only">45% Complete</span>\n' +
                        '                            </div>\n' +
                        '                        </div>\n' +
                        '                    </td>\n' +
                        '                    <td>\n' +
                        '                        <div class="form-group" style="margin: auto;">\n' +
                        '                            ' + ((data.data[i].state === "buy" || data.data[i].state === "unfinish" ? '<button class="btn btn-info startTrade" onclick="trade(\'' + data.data[i].id + '\', \'start\')" value="' + data.data[i].id + '">开始施工</button>' : data.data[i].state === "start" ? '<button class="btn btn-info yesTrade" onclick="trade(\'' + data.data[i].id + '\', \'end\')\" value=\"' + data.data[i].id + '\">结束施工</button>' : "")) + '\n' +
                        '                        </div>\n' +
                        '                    </td>\n' +
                        '                </tr>')
                }
            }
        });
        $.post("${ctx}/student/tradesTo", function (data) {
            console.log(data);
            if (data.code === 1) {
                for (var i = 0; i < data.data.length; i++) {
                    $("#tradeTable tbody").append('<tr id="' + data.data[i].id + '">\n' +
                        '                    <td style="vertical-align: middle;"><a href="/trade/detial?id=' + data.data[i].id + '">' + data.data[i].id + '\n' +
                        '                    </a></td>\n' +
                        '                    <td style="vertical-align: middle;">' + new Date(parseInt(data.data[i].buyDate)).toLocaleString().replace(/:\d{1,2}$/, ' ') + '\n' +
                        '                    </td>\n' +
                        '                    <td style="vertical-align: middle;">' + (data.data[i].state === "buy" ? "等待施工" : data.data[i].state === "start" ? "正在施工" : data.data[i].state === "end" ? "等待质检" : data.data[i].state === "finish" || data.data[i].state === "finished" ? "交易完成" : "质检失败") + '\n' +
                        '                    </td>\n' +
                        '                    <td style="vertical-align: middle;">\n' +
                        '                        <div class="progress" style="width: 400px; margin: auto;">\n' +
                        '                            <div class="progress-bar progress-bar-' + (data.data[i].state === "finish" || data.data[i].state === "finished" ? "success" : "warning active") + ' progress-bar-striped"\n' +
                        '                                 role="progressbar"\n' +
                        '                                 aria-valuenow="75" aria-valuemin="0"\n' +
                        '                                 aria-valuemax="100"\n' +
                        '                                 style="width: ' + (data.data[i].state === "buy" || data.data[i].state === "unfinish" ? "15" : data.data[i].state === "start" ? "75" : data.data[i].state === "end" ? "90" : "100") + '%">\n' +
                        '                                <span class="sr-only">45% Complete</span>\n' +
                        '                            </div>\n' +
                        '                        </div>\n' +
                        '                    </td>\n' +
                        '                    <td>\n' +
                        '                        <div class="form-group" style="margin: auto;">\n' +
                        '                            ' + ((data.data[i].state === "buy" || data.data[i].state === "unfinish" ? '<button class="btn btn-info startTrade" onclick="trade(\'' + data.data[i].id + '\', \'start\')" value="' + data.data[i].id + '">开始施工</button>' : data.data[i].state === "start" ? '<button class="btn btn-info yesTrade" onclick="trade(\'' + data.data[i].id + '\', \'end\')\" value=\"' + data.data[i].id + '\">结束施工</button>' : "")) + '\n' +
                        '                        </div>\n' +
                        '                    </td>\n' +
                        '                </tr>')
                }
            }
        });
    }
</script>
</body>
</html>
