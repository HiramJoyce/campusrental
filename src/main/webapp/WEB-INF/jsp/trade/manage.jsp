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
<div>
    <div class="container" style="padding: 20px;">
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
        <div style="margin-bottom: 10px;">
            <button class="btn btn-danger" type="button" onclick="deleteTrade()">删除</button>
            <%--<button class="btn btn-info" data-toggle="modal" data-target="#myModal">导入</button>--%>
        </div>
        <form action="${ctx}/trade/delete" id="allTrades" method="post">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <td></td>
                    <td>ID</td>
                    <td>FROM</td>
                    <td>TO</td>
                    <td>起租时间</td>
                    <td>总价</td>
                    <td>租赁时长</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody align="center">
                <c:forEach items="${trades}" var="trade">
                    <tr align="center">
                        <td><input type="checkbox" name="id" value="${trade.id}"/></td>
                        <td>${trade.id}</td>
                        <td>${trade.fromId}</td>
                        <td>${trade.toId}</td>
                        <td>${trade.rentTime}</td>
                        <td>${trade.total}</td>
                        <td>${trade.rentLast}</td>
                        <td class="operate">
                            <a href="${ctx}/trade/delete?id=${trade.id}" class="del">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    function deleteTrade() {
        var ids = "";
        $("input:checkbox[name='id']:checked").each(function () {
            ids += $(this).val() + ",";
        });
        //判断最后一个字符是否为逗号，若是截取
        var id = ids.substring(ids.length - 1, ids.length);
        if (id === ",") {
            ids = ids.substring(0, ids.length - 1);
        }
        if (ids === "") {
            alert("请选择要删除的记录！");
            return;
        }
        $("#allTrades").submit();
    }
</script>
</body>
</html>