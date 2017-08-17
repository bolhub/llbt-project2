<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="secutrity" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: LLBT
  Date: 2017/8/16
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <secutrity:csrfMetaTags/>
    <title>注册页面</title>
</head>
<body>
    <c:if test="${!empty error}">
        <span style="color: red; font-size: 12px;"><c:out value="${error}"/></span>
    </c:if>
    <h3>用户注册</h3>
    <form action="/doRegister.html" method="post">
        用户名：
        <input type="text" name="userName"/>
        <br/>
        密   码：
        <input type="password" name="password"/><br/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="提交"/>
        <input type="reset" value="重置"/>
    </form>
</body>
</html>
