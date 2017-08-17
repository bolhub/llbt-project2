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
    <sec:csrfMetaTags/>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    </link>
    <link href="/css/signin.css" rel="stylesheet"></link>
    <title>登陆</title>
</head>

<body>
<c:if test="${!empty param.error}">
    <font color="red"><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></font>
</c:if>
<c:if test="${!empty success}">
    <span style="color: green; font-size: 12px;"><c:out value="${success}"/> </span>
</c:if>
<div class="container" >
    <form class="form-signin" action="<c:url value="/loginCheck.html"/> " method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label class="sr-only" for="inputEmail">Email address</label>
        <input id="inputEmail" class="form-control" placeholder="Email address" name="userName" required="" autofocus="" type="text">
        <label class="sr-only" for="inputPassword">Password</label>
        <input id="inputPassword" name="password" class="form-control" placeholder="Password" required="" type="password">
        <div class="checkbox">
            <label>
                <input value="remember-me" type="checkbox" name="_spring_security_remember_me"/>
                Remember me
            </label>
            <a href="<c:url value="/register.html"/>">注册</a>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>
</div>
</body>
</html>
