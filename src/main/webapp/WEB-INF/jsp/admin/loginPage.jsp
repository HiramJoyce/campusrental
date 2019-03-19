<%--
  Created by IntelliJ IDEA.
  User: hiram
  Date: 2019/3/18
  Time: 11:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>管理员登录</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/pure-css3-meteor-shower/css/style.css">
</head>
<body>
<div class="container-fluid">
<div class="panel panel-default" style="width: 300px; margin: 50px auto;">
    <div class="panel-heading">
        <h3 class="panel-title">管理员登录</h3>
    </div>
    <form action="${ctx}/admin/login" method="post" style="margin-bottom: 0;">
    <div class="panel-body" style="padding-bottom: 0;">
        <div class="form-group">
            <label for="userName">用户名</label>
            <input type="text" class="form-control" name="userName" id="userName" placeholder="">
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="">
        </div>
        <div class="form-group" style="text-align: center;">
            <button class="btn btn-success" style="width: 150px;">登录</button>
        </div>
    </div>
    </form>
</div>
</div>
<%--<div class="night">--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
    <%--<div class="shooting_star"></div>--%>
<%--</div>--%>
</body>
</html>
