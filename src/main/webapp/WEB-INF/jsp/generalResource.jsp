<%--
  Created by IntelliJ IDEA.
  User: LLBT
  Date: 2017/8/9
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>普通资源</title>
</head>
<body>
    <div>
        上传文件
        <div>
            <form action="/uploadGeneralResource.html" method="post" enctype="multipart/form-data">
                选择文件：<input type="file" name="generalResource"/>
                <input type="submit" value="提交"/>
            </form>
        </div>
    </div>
    <div>
        <input type="hidden" name="listCount" id="hidCount" value="${listCount}"/>
        已上传文件列表
        <div>
            <div id="content">
                <table>
                    <tr>
                        <th>编号</th><th>文件名称</th><th>上传时间</th><th>上传人</th><th>下载文件</th>
                    </tr>
                    <c:forEach items="${generalResourceList}" var="generalResource">
                        <tr>
                            <td>${generalResource.fileId}</td>
                            <td>${generalResource.filename}</td>
                            <td>${generalResource.updateTime}</td>
                            <td>${generalResource.owner}</td>
                            <td>
                                <form action="/downloadResume.html" method="post">
                                    <input type="hidden" value="${generalResource.filename}" name="filename"/>
                                    <input type="submit" value="下载"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="M-box">

            </div>
        </div>
    </div>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script>
        var local = window.location;
        var basePath = local.protocol + "//" + local.host + "/" ;
        var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf").attr("content");
        $(function(){
            var totalData = $('#hidCount').val();
            var pageCallback = function (api) {
                var url= basePath + "generalResourcePage.html";
                $.ajax({
                    type: 'post',
                    url: url,
                    dataType: 'json',
                    data:{
                        pageNo: api.getCurrent(),
                        pageSize: 5,
                    },
                    beforeSend: function(xhr){
                        xhr.setRequestHeader(header, token);
                    },
                    success:function(data){
                        contentHtml(data);
                    },
                    error:function(){

                    }
                })
            };
            $('.M-box').pagination({
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
        });

        var contentHtml = function (data) {
            $('#content').empty();
            var html = '<table>' +
                '<tr>' +
                '<th>编号</th><th>文件名称</th><th>上传时间</th><th>上传人</th><th>下载文件</th>' +
                '</th>';
            for (var i = 0; i < data.length; i++){
                var generalResource = data[i];
                html += '<tr>' +
                    '<td>' + generalResource.fileId + '</td><td>' + generalResource.filename + '</td><td>' + generalResource.updateTime + '</td><td>' +
                    generalResource.owner + '</td>' +
                    '<td><form action="<c:url value="/downloadResume.html"/>" method="post">' +
                    '<input type="hidden" name="filename" value="' + generalResource.filename + '"> ' +
                    '<input type="submit" value="下载"/>' +
                    '</form></td></tr>';
            }
            $('#content').html(html);
        }
    </script>
</body>
</html>
