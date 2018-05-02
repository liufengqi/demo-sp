<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/27
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form  id="WordForm" >
    <table class="table table-bordered">
        <input type="hidden" name="newsid" value="${news.newsid}">

        <tr>
            <td>新闻内容</td>
            <td>
                <input type="text" value="${news.content}" name="content"/>
            </td>
        </tr>


    </table>
</form>

</body>
</html>
