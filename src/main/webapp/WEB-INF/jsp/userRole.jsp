<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LLBT
  Date: 2017/8/16
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户权限</title>
</head>
<body>
    <h3>用户权限界面</h3>
    <table cellpadding="1px" cellspacing="1" border="1">
        <tr>
            <th>用户ID</th><th>用户名</th><th>用户角色</th><th>操作</th>
        </tr>
        <c:forEach items="userRoleList" var="userRole">
            <tr>
                <td>${userRole.userId}</td>
                <td>${userRole.userName}</td>
                <td>${userRole.roleName}</td>
                <td>
                    修改
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
