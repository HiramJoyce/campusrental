<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.campus.rental.domain.Trade" %>
<%@ page import="com.campus.rental.domain.Good" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/><%--
  Created by IntelliJ IDEA.
  User: chlia
  Date: 2019/3/14
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trade Item</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
</head>
<body>
<nav class="navbar navbar-inverse" style="border-radius: 0;">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Lawyer Online</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <%
                        if (session.getAttribute("id") == null) {
                    %>
                    <div class="btn-group" role="group" aria-label="...">
                        <a href="${ctx}/" type="button" class="btn btn-link navbar-btn">登录</a>
                        <a href="${ctx}/" type="button" class="btn btn-link navbar-btn">注册</a>
                    </div>
                    <%
                    } else {
                    %>
                    <a href="${ctx}/<%=session.getAttribute("role")%>?id=<%=session.getAttribute("id")%>"><%=session.getAttribute("realName")%></a>
                    <%
                        }
                    %>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <%
        Trade trade = (Trade) request.getAttribute("trade");
        Good good = (Good) request.getAttribute("good");
    %>
    <div class="panel panel-default">
        <div class="panel-heading">交易详情</div>
        <table class="table">
            <tr>
                <td>交易ID</td>
                <td><%=trade.getId()%></td>
            </tr>
            <tr>
                <td>商品ID</td>
                <td><%=trade.getGoodId()%></td>
            </tr>
            <tr>
                <td>商品标题</td>
                <td><%=good != null ? good.getTitle() : "方案已下架"%></td>
            </tr>
            <tr>
                <td>租赁单位</td>
                <td><%=trade.getRentLast()%></td>
            </tr>
            <tr>
                <td>单价</td>
                <td><%=good != null ? good.getPrice() : "方案已下架"%></td>
            </tr>
            <tr>
                <td>总价</td>
                <td><%=trade.getTotal()%></td>
            </tr>
            <tr>
                <td>起租日期</td>
                <td><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(trade.getRentTime())%></td>
            </tr>
        </table>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
