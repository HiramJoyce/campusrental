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
            <button class="btn btn-success" onclick="window.location.href='${ctx}/good/add'">添加</button>
            <button class="btn btn-danger" type="button" onclick="formSubmit('${ctx}/good/delete');this.blur();">删除</button>
            <button class="btn btn-success" type="button" onclick="formSubmit('${ctx}/good/allow');this.blur();">通过</button>
            <button class="btn btn-danger" type="button" onclick="formSubmit('${ctx}/good/notAllow');this.blur();">禁止</button>
            <%--<button class="btn btn-info" data-toggle="modal" data-target="#myModal">导入</button>--%>
        </div>
        <form id="allGoods" method="post">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th class="num"></th>
                    <th class="process">图片</th>
                    <th class="name">ID</th>
                    <th class="name">分类</th>
                    <th class="operate">新旧程度</th>
                    <th class="node">标题</th>
                    <th class="process">价格</th>
                    <th class="operate">单位</th>
                    <th class="operate">状态</th>
                    <th class="operate">操作</th>
                </tr>
                </thead>
                <tbody align="center">
                <c:forEach items="${goods}" var="good">
                    <tr align="center">
                        <td><input type="checkbox" name="id" value="${good.id}"/></td>
                        <td><img style="width: 64px;" src="${ctx}/resource/uploadImg/${good.img.split(",")[0]}" alt=""></td>
                        <td>${good.id}</td>
                        <td>${good.type}</td>
                        <td>${good.old}</td>
                        <td>${good.title}</td>
                        <td>${good.price}</td>
                        <td>${good.timeUnit == 0 ? "小时" : good.timeUnit == 1 ? "天" : good.timeUnit == 2 ? "周" : good.timeUnit == 3 ? "月" : "年"}</td>
                        <td>${good.state == 0 ? "待审核" : "已通过"}</td>
                        <td class="operate">
                            <a href="${ctx}/good/delete?id=${good.id}" class="del">删除</a>
                            <a href="${ctx}/good/update?id=${good.id}" class="del">编辑</a>
                            <c:if test="${good.state == 0}"><a href="${ctx}/good/allow?id=${good.id}">通过</a></c:if>
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
    function deleteGood() {
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
        $("#allGoods").submit();
    }
    function formSubmit(url) {
        document.forms[0].action = url;
        document.forms[0].submit();
        return true;
    }
</script>
</body>
</html>