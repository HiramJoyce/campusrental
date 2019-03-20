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
        <form action="${ctx}/good/update" method="post" accept-charset="UTF-8">
            <input type="hidden" name="id" value="${good.id}">
            <div class="form-group">
                <label for="type">分类</label>
                <input type="text" name="type" class="form-control" id="type"
                       value="${good.type}">
            </div>

            <div class="form-group">
                <label for="old">新旧程度</label>
                <input type="text" name="old" class="form-control" id="old"
                       value="${good.old}">
            </div>

            <div class="form-group">
                <label for="title">标题</label>
                <input type="text" name="title" class="form-control" id="title"
                       value="${good.title}">
            </div>

            <div class="form-group">
                <label for="content">内容</label>
                <input type="text" name="content" class="form-control" id="content"
                       value="${good.content}">
            </div>

            <div class="form-group">
                <label for="name">商品名</label>
                <input type="text" name="name" class="form-control" id="name"
                       value="${good.name}">
            </div>

            <div class="form-group">
                <label for="img">展示图</label>
                <input type="text" name="img" class="form-control" id="img"
                       value="${good.img}">
            </div>

            <div class="form-group">
                <label for="phone">电话</label>
                <input type="text" name="phone" class="form-control" id="phone"
                       value="${good.phone}">
            </div>

            <div class="form-group">
                <label for="weChat">微信</label>
                <input type="text" name="weChat" class="form-control" id="weChat"
                       value="${good.weChat}">
            </div>

            <div class="form-group">
                <label for="qq">QQ</label>
                <input type="text" name="qq" class="form-control" id="qq"
                       value="${good.qq}">
            </div>

            <div class="form-group">
                <label for="price">价格</label>
                <div class="input-group">
                    <input type="text" id="price" name="price" class="form-control" value="${good.price}"
                           aria-label="...">
                    <div class="input-group-btn" style="width: 149px;">
                        <button type="button" class="btn btn-default" style="width: 50px;">/
                        </button>
                        <select name="timeUnit" class="form-control"
                                style="border-left: none; float: right; width: 100px; border-bottom-right-radius: 4px; border-top-right-radius: 4px;">
                            <option value="0" ${good.timeUnit==0 ? "checked" : ""}>小时</option>
                            <option value="1" ${good.timeUnit==1 ? "checked" : ""}>天</option>
                            <option value="2" ${good.timeUnit==2 ? "checked" : ""}>周</option>
                            <option value="3" ${good.timeUnit==3 ? "checked" : ""}>月</option>
                            <option value="4" ${good.timeUnit==4 ? "checked" : ""}>年</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="createTime">发布时间</label>
                <input type="text" name="createTime" class="form-control" id="createTime"
                       value="${good.createTime}" ${good.createTime == null || good.createTime ? "disabled" : ""}>
            </div>

            <div class="form-group">
                <label for="state">状态</label>
                <input type="text" name="state" class="form-control" id="state"
                       value="${good.state}">
            </div>

            <div class="form-group">
                <label for="studentId">用户ID</label>
                <input type="text" name="studentId" class="form-control" id="studentId"
                       value="${good.studentId}">
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