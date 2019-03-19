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
    <div style="margin: auto; width: 350px;">
        <c:if test="${message != null}">
            <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <strong>Success!</strong> ${message}
            </div>
        </c:if>
        <c:if test="${error != null}">
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <strong>Error!</strong> ${error}
            </div>
        </c:if>
    </div>
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
                <form action="${ctx}/student/update" method="post" accept-charset="UTF-8">
                    <input type="hidden" name="id" value="<%=merchant.getId()%>">
                    <input type="hidden" name="realName" value="<%=merchant.getRealName()%>">
                    <input type="hidden" name="stuNum" value="<%=merchant.getStuNum()%>">
                    <div class="form-group">
                        <label for="realName2">姓名</label>
                        <input type="text" name="realName2" disabled class="form-control" id="realName2"
                               value="<%=merchant.getRealName()%>">
                    </div>

                    <div class="form-group">
                        <label for="stuNum2">学号</label>
                        <input type="text" name="stuNum2" disabled class="form-control" id="stuNum2"
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
                        <label for="weChat">微信</label>
                        <input type="text" name="weChat" class="form-control" id="weChat"
                               value="<%=merchant.getWeChat()%>">
                    </div>

                    <div class="form-group">
                        <label for="qq">QQ</label>
                        <input type="text" name="qq" class="form-control" id="qq"
                               value="<%=merchant.getQq()%>">
                    </div>

                    <div class="form-group" style="text-align: center;">
                        <input class="btn btn-info" type="submit" id="submit" value="保存">
                    </div>
                </form>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="profile" style="padding-top: 10px;">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div>租出</div>
                    <table id="tradeTableFrom" class="table table-striped table-hover table-bordered">
                        <thead>
                        <tr>
                            <td>ID</td>
                            <td>时间</td>
                            <td>单位</td>
                            <td>总价</td>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div>租入</div>
                    <table id="tradeTableTo" class="table table-striped table-hover table-bordered">
                        <thead>
                        <tr>
                            <td>ID</td>
                            <td>时间</td>
                            <td>单位</td>
                            <td>总价</td>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
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
                <ul class="list-group" id="goods">

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
                                            <button type="button" class="btn btn-default" style="width: 50px;">/
                                            </button>
                                            <%--<button type="button" class="btn btn-default dropdown-toggle"--%>
                                            <%--data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                                            <%--Action <span class="caret"></span></button>--%>
                                            <select name="timeUnit" class="form-control"
                                                    style="border-left: none; float: right; width: 100px; border-bottom-right-radius: 4px; border-top-right-radius: 4px;">
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
        loadGoods();
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

    function loadGoods() {
        $.post("/good/goods", {"studentId": <%=session.getAttribute("id")%>}, function (data) {
            console.log('- loadGoods -');
            console.log(data);
            if (data.code === 1) {
                for (var i = 0; i < data.data.length; i++) {
                    $("#goods").append('<li class="list-group-item" id="' + data.data[i].id + '"><div class="media">\n' +
                        '                <div class="media-left">\n' +
                        '                    <a href="#">\n' +
                        '                        <img class="media-object" style="width: 96px;" src="${ctx}/resource/uploadImg/' + data.data[i].img.split(",")[0] + '" alt="...">\n' +
                        '                    </a>\n' +
                        '                </div>\n' +
                        '                <div class="media-body">\n' +
                        '                    <h4 class="media-heading">' + "【" + data.data[i].type + "】 " + data.data[i].name + " " + data.data[i].old + " " + data.data[i].title + ' - ¥' + data.data[i].price + " / " + (data.data[i].timeUnit === 0 ? "小时" : data.data[i].timeUnit === 1 ? "天" : data.data[i].timeUnit === 2 ? "周" : data.data[i].timeUnit === 3 ? "月" : "年") + '</h4><button class="btn btn-danger" style="float: right;" onclick="deleteGood(\'' + data.data[i].id + '\')">下架</button>\n' +
                        '                    ' + data.data[i].content + '\n' +
                        '                </div>\n' +
                        '            </div></li>')
                }
            }
        });
    }

    function loadTrades() {
        $.post("${ctx}/student/tradesFrom", function (data) {
            console.log(data);
            if (data.code === 1) {
                for (var i = 0; i < data.data.length; i++) {
                    $("#tradeTableFrom tbody").append('<tr id="' + data.data[i].id + '"><td style="vertical-align: middle;">' + data.data[i].id + '</td><td style="vertical-align: middle;">' + new Date(parseInt(data.data[i].rentTime)).toLocaleString().replace(/:\d{1,2}$/,' ') + '</td><td style="vertical-align: middle;">' + data.data[i].rentLast + '</td><td style="vertical-align: middle;">' + data.data[i].total + '</td></tr>')
                }
            }
        });
        $.post("${ctx}/student/tradesTo", function (data) {
            console.log(data);
            if (data.code === 1) {
                for (var i = 0; i < data.data.length; i++) {
                    $("#tradeTableTo tbody").append('<tr id="' + data.data[i].id + '"><td style="vertical-align: middle;">' + data.data[i].id + '</td><td style="vertical-align: middle;">' + new Date(parseInt(data.data[i].rentTime)).toLocaleString().replace(/:\d{1,2}$/,' ') + '</td><td style="vertical-align: middle;">' + data.data[i].rentLast + '</td><td style="vertical-align: middle;">' + data.data[i].total + '</td></tr>')
                }
            }
        });
    }

    function deleteGood(id) {
        console.log(id);
//        $.post("/good/delete",
//            {"id": id},
//            function (data) {
//                console.log(data);
//                if (data.code === 1) {
//                    $("#" + id).remove()
//                }
//            },
//            "json"
//        );
    }
</script>
</body>
</html>
