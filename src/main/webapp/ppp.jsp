<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
    <jsp:include page="bootcommon.jsp" flush="true"></jsp:include>
    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath() %>/assets/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/assets/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/css/style-responsive.css" rel="stylesheet">

    <!-- Bootstrap 插件 css -->
    <link href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- Bootstrap 核心css -->
    <link href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap TreeView css -->
    <link href="<%=request.getContextPath()%>/js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">
    <!-- Bootstrap addTabs css -->
    <link href="<%=request.getContextPath()%>/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">
    <!-- Bootstrap table css -->
    <link href="<%=request.getContextPath()%>/js/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<center>
<form id="userform">
<table>
    <tr>
        <td>用户名</td>
        <td><input type="text" name="username"></td>
    </tr>
    <tr>
        <td>密码</td>
        <td><input type="text" name="userpass"></td>
    </tr>
</table>
    <input type="button" value="登录" onclick="dengluyan()">
</form>



<script src="<%=request.getContextPath() %>/assets/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-table/dist/bootstrap-table.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>
<!-- js placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.backstretch.min.js"></script>
<script type="text/javascript">

 function dengluyan(){
        $.ajax({
            url:'<%=request.getContextPath()%>/news/selectUser',
            type:"post",
            async:false,
            data:$("#userform").serialize(),
            dataType:"text",
            success:function(cus){
                if(cus == "0"){
                    alert("账号不存在");
                }
                if(cus == "1"){
                    alert("密码错误");
                }
                if(cus == "2"){
                    location.href="<%=request.getContextPath()%>/aa.jsp";
                }
            }
        })
    }



</script>
</center>
</body>
</html>