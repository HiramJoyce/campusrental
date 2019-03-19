<%@ page import="com.campus.rental.domain.Good" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
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
                        if (session.getAttribute("id") == null) {
                    %>
                    <div class="btn-group" role="group" aria-label="...">
                        <a type="button" class="btn btn-link navbar-btn" data-toggle="modal"
                           data-target="#myModal">登录</a>
                        <a type="button" class="btn btn-link navbar-btn" data-toggle="modal"
                           data-target="#myModal2">注册</a>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="btn-group" role="group" aria-label="...">
                        <a href="${ctx}/<%=session.getAttribute("role")%>?id=<%=session.getAttribute("id")%>"
                           type="button"
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
    <div class="row">
        <%
            List<Good> programmes = (List<Good>) request.getAttribute("goods");
            for (Good programme : programmes) {
                int desLength = programme.getContent().length();
                String img = programme.getImg() == null || programme.getImg().equals("") ? "" : programme.getImg().split(",")[0];
                String des = desLength > 13 ? programme.getContent().substring(0, 12) : programme.getContent();
        %>
        <a href="${ctx}/good/item?id=<%=programme.getId()%>">
            <div class="col-sm-6 col-md-3">
                <div class="thumbnail">
                    <%
                        if (img == null || img.equals("")) {
                    %>
                    <div style="width: 100%;"></div>
                    <%
                    } else {
                    %>
                    <img style="width: 100%; height: auto;" src="${ctx}/resource/uploadImg/<%=img%>" class="productImg"
                         alt="<%=img%>">
                    <%
                        }
                    %>
                    <div class="caption" style="padding-bottom: 0;">
                        <h3 style="margin-top: 0;">¥<%=programme.getPrice()%>
                        </h3>
                        <p style="line-height: 8px;"><%=programme.getTitle()%>
                        </p>
                        <p style="line-height: 8px;"><%=des%>...</p>
                    </div>
                </div>
            </div>
        </a>
        <%
            }
        %>
    </div>
</div>
<div style="position: fixed; bottom: 0; text-align: center; width: 100%;"><a href="${ctx}/admin/login">管理员登录</a></div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <form class="form" action="${ctx}/student/login" onsubmit="return loginCheck()" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">登录</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="stuNum">学号</label>
                        <input type="text" name="stuNum" class="form-control" id="stuNum" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button class="btn btn-success">登录</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <form class="form" action="${ctx}/student/register" onsubmit="return check()" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">注册</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="stuNum2">学号</label>
                        <input type="text" name="stuNum" class="form-control" id="stuNum2" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="realName">姓名</label>
                        <input type="text" name="realName" class="form-control" id="realName" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="phone">手机</label>
                        <input type="text" name="phone" class="form-control" id="phone" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="password2">密码</label>
                        <input type="password" name="password" class="form-control" id="password2" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="password22">确认密码</label>
                        <input type="password" name="password2" class="form-control" id="password22" placeholder="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary">注册</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- <script src="${ctx}/resource/js/canvas-nest.js"></script> -->
</body>
</html>
