<%--
  Created by IntelliJ IDEA.
  User: LLBT
  Date: 2017/8/3
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <sec:csrfMetaTags/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>人员简历/标书</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css"/>
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/offcanvas.css"/>
    <%--<link rel="stylesheet" type="text/css" href="/css/pagination.css"/>--%>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">联龙博通</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><sec:authentication property="principal.username"></sec:authentication>,欢迎您！</a></li>
                    <%--<li><a href="#">Settings</a></li>
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Help</a></li>--%>
                </ul>
                <%--<form class="navbar-form navbar-right">
                    <input type="text" class="form-control" placeholder="Search...">
                </form>--%>
            </div>
        </div>
    </nav>
    <%--<div class="container theme-showcase" role="main">
        <div class="row row-offcanvas row-offcanvas-right">
            <div class="col-xs-12 col-sm-9">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">上传简历</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-group" action="/uploadResume.html" method="post" enctype="multipart/form-data">
                            <span class="input-group-addon">姓名</span>
                            <input type="text" class="form-control" placeholder="姓名" required autofocus>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
                <div class="list-group">
                    <a href="#" class="list-group-item active">上传简历</a>
                    <a href="#" class="list-group-item">查找简历</a>
                </div>
            </div>
        </div>

    </div>--%>
    <div>

        <h3>上传建立</h3>
        <!-- 上传简历 -->
        <div>
            <input type="hidden" name="listCount" id="hidCount" value="${listCount}"/>
            <form action="/uploadResume.html" method="post" enctype="multipart/form-data">
                <div>
                    姓名
                    <input type="text" name="personName"/>
                    &nbsp;&nbsp;
                    毕业时间
                    <input type="date" name="graduatedYear"/>
                    &nbsp;&nbsp;
                    学历
                    <select name="educationBackground">
                        <option selected="selected"></option>
                        <option>中专</option>
                        <option>本科</option>
                    </select>
                    &nbsp;&nbsp;
                    入场项目
                    <input type="text" name="projects" />
                </div>
                选择文件：<input type="file" name="uploadResume"/>
                <input type="submit" value="提交"/>
            </form>
        </div>
    </div>

    <div>
        <h3>搜索简历</h3>
        <div>
            <input type="text" id="personName" name="personName"/><input type="button" id="search" value="搜索"/><br/>
            毕业年限
            <select id="graduatedYear" name="graduatedYear">
                <option></option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>>5</option>
            </select>&nbsp;&nbsp;
            学历
            <select id="educationBackground" name="educationBackground">
                <option></option>
                <option>本科</option>
            </select>&nbsp;&nbsp;
            入场项目
            <input type="text" id="projects" name="projects"/>
        </div>
        <div id="content">
            <table cellpadding="1" border="1" cellspacing="1">
                <tr>
                    <th>编号</th><th>姓名</th><th>毕业时间</th><th>学历</th><th>入场项目</th><th>操作</th>
                </tr>
                <c:forEach items="${resumeList }" var="resume">
                    <tr>
                        <td>${resume.fId}</td>
                        <td>${resume.personName}</td>
                        <td>${resume.graduatedYear}</td>
                        <td>${resume.educationBackground}</td>
                        <td>${resume.projects}</td>
                        <td><%--<a href="<c:url value="/downloadResume.html"/>" filename="${resume.fileName}">下载</a>--%>
                            <form action="<c:url value="/downloadResume.html"/> " method="post">
                                <input type="hidden" name="filename" value="${resume.fileName}">
                                <input type="submit" value="下载"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="M-box1"></div>
    </div>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script>
        var local = window.location;
        var basePath = local.protocol + "//" + local.host + "/" ;
        var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        $(function(){
            var totalData = $('#hidCount').val();
            var resumeInfo = {
                personName: "",
                graduatedYear: "",
                educationBackground: "",
                projects: ""
            }
            var pageCallback = function (api) {
                var url= basePath + "resumepage.html";
                $.ajax({
                    type: 'post',
                    url: url,
                    dataType: 'json',
                    data:{
                        pageNo: api.getCurrent(),
                        pageSize: 5,
                        resumeInfo: resumeInfo
                    },
                    beforeSend:function(xhr){
                        xhr.setRequestHeader(header, token);
                    },
                    success:function(data){
                        contentHtml(data);
                    },
                    error:function(){

                    }
                })
            };
            var pagePagination = function(){
                $('.M-box1').empty();
                $('.M-box1').pagination({
                    totalData:totalData,
                    showData:5,
                    coping:true,
                    jump:true,
                    homePage:'首页',
                    endPage:'末叶',
                    prevContext:'上页',
                    nextContent:'下页',
                    callback:pageCallback,
                });
            };
            pagePagination();
            var updateResultCount = function(){
                var url = basePath + "resumeCount.html";
                $.ajax({
                    type: 'post',
                    url: url,
                    dataType: 'text',
                    data: resumeInfo,
                    beforeSend: function(xhr){
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(data){
                        totalData = data;
                        refreshData();
                        pagePagination();
                        if (totalData > 0)
                            $('.M-box1').show();
                    },
                    error: function(data){

                    }
                })
            };
            var refreshData = function(){
                var url = basePath + "resumepage.html";
                $.ajax({
                    type: 'post',
                    url: url,
                    dataType: 'json',
                    data:{
                        pageNo: 1,
                        pageSize: 5,
                        personName: resumeInfo.personName,
                        graduatedYear: resumeInfo.graduatedYear,
                        educationBackground: resumeInfo.educationBackground,
                        projects: resumeInfo.projects
                    },
                    beforeSend:function(xhr){
                        xhr.setRequestHeader(header, token);
                    },
                    success: function (data) {
                        contentHtml(data);
                    },
                    error: function(data){

                    }
                })

            }
            $('#search').click(function(){
                resumeInfo.educationBackground = $('#educationBackground').val();
                resumeInfo.graduatedYear = $('#graduatedYear').val();
                resumeInfo.personName = $('#personName').val();
                resumeInfo.projects = $('#projects').val();
                //更新记录条数
                updateResultCount();
            })
        });
        var contentHtml = function (data) {
            $('#content').empty();
            var html = '<table cellspacing="1" cellpadding="1" border="1">' +
                '<tr>' +
                '<th>编号</th><th>姓名</th><th>毕业年限</th><th>学历</th><th>入场项目</th><th>操作</th>' +
                '</th>';
            for (var i = 0; i < data.length; i++){
                var resume = data[i];
                html += '<tr>' +
                    '<td>' + resume.fId + '</td><td>' + resume.personName + '</td><td>' + resume.graduatedYear + '</td><td>' +
                    resume.educationBackground + '</td><td>' + resume.projects + '</td>' +
                    '<td><form action="<c:url value="/downloadResume.html"/>" method="post">' +
                    '<input type="hidden" name="filename" value="' + resume.fileName + '"> ' +
                    '<input type="submit" value="下载"/>' +
                    '</form></td></tr>';
            }
            $('#content').html(html);
        }
    </script>
</body>
</html>
