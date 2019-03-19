<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>QuestionPage</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
</head>
<body>
<div class="container" style="padding: 20px;">
    <a href="#" onclick="history.back()">返回</a>
    <div style="width: 500px; margin: auto;">
        <form action="${ctx}/student/updateAll" method="post" accept-charset="UTF-8">
            <input type="hidden" name="id" value="${student.id}">
            <div class="form-group">
                <label for="realName">姓名</label>
                <input type="text" name="realName" class="form-control" id="realName"
                       value="${student.realName}">
            </div>

            <div class="form-group">
                <label for="stuNum">学号</label>
                <input type="text" name="stuNum" class="form-control" id="stuNum"
                       value="${student.stuNum}">
            </div>

            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" name="password" class="form-control" id="password"
                       value="${student.password}">
            </div>

            <div class="form-group">
                <label for="phone">电话</label>
                <input type="text" name="phone" class="form-control" id="phone"
                       value="${student.phone}">
            </div>

            <div class="form-group">
                <label for="wechat">微信</label>
                <input type="text" name="weChat" class="form-control" id="wechat"
                       value="${student.weChat}">
            </div>

            <div class="form-group">
                <label for="qq">QQ</label>
                <input type="text" name="qq" class="form-control" id="qq"
                       value="${student.qq}">
            </div>

            <div class="form-group" style="text-align: center;">
                <button class="btn btn-info">保存</button>
            </div>
        </form>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>