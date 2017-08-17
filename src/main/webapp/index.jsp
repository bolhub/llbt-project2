<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-07-31
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <sec:csrfMetaTags/>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    </link>
    <link href="/css/signin.css" rel="stylesheet"/>
    <title>登陆</title>
</head>

<body>
<c:if test="${!empty param.error}">
    <font color="red"><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></font>
</c:if>
<div class="container" >
    <form class="form-signin" action="<c:url value="/loginCheck.html"/> " method="post">
        <h2 class="form-signin-heading">请输入</h2>
        <label class="sr-only" for="inputEmail">用户名</label>
        <input id="inputEmail" class="form-control" placeholder="用户名" name="userName" required="" autofocus="" type="text">
        <label class="sr-only" for="inputPassword">密码</label>
        <input id="inputPassword" name="password" class="form-control" placeholder="密码" required="" type="password">
        <div class="checkbox">
            <label>
                <input value="remember-me" type="checkbox">
                Remember me
            </label>
            <a href="/register.html">注册</a>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>
</div>
</body>
</html>
