<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 插件 css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- Bootstrap 核心css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
       <!-- Bootstrap TreeView css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">
       <!-- Bootstrap addTabs css -->
    <link href="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">
     <!-- Bootstrap table css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">
   <!-- bootstrap-datetimepicker css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
   
     <!-- bootstrap-dialog css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/css/bootstrap-dialog.css" rel="stylesheet">
     <!-- bootstrap-fileinput css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-fileinput/css/fileinput.css" rel="stylesheet">  
</head>
<body>

<!-- <div style="width: 100%;height: 100%;background: url('../img/timg.jpg');">
	<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto;"></div>
</div> -->

   <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>


<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/highcharts.js"></script>
<script src="<%=request.getContextPath()%>/js/exporting.js"></script>
 <!-- bootstrap 核心js文件 -->
    <script src="<%=request.getContextPath() %>/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- bootStrap TreeView -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
    
    <!-- bootStrap addTabs -->
    <%--<script src="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.js"></script>--%>
    
    <!-- bootStrap table -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.js"></script>
    <!-- bootStrap table 语言包中文-->
    <script src="<%=request.getContextPath() %>/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
    
    <!-- bootstrap-datetimepicker -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    
     <!-- bootstrap-dialog -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
     <!-- bootstrap-fileinput -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/fileinput.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/locales/zh.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/chart-master/Chart.js"></script>
   
   <script type="text/javascript">

   $(function(){
	   //alert(eval("0*1"))
		 $.ajax({
			   url:"<%=request.getContextPath()%>/news/insertmong",
			   type:"post",
			   dataType:"json",
			   async:false,
			   success:function(data){
				   console.log(data)
					   Highcharts.chart('container', {
					       chart: {
					           plotBackgroundColor: null,
					           plotBorderWidth: null,
					           plotShadow: false,
					           type: 'pie'
					       },
					       title: {
					           text: '計算'
					       },
					       tooltip: {
					           pointFormat: '{series.type}: <b>{point.percentage:.1f}%</b>'
					      
					       },
					       plotOptions: {
					           pie: {
					               allowPointSelect: true,
					               cursor: 'pointer',
					               dataLabels: {
					                   enabled: true,
					                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',				   
					                   style: {
					                       color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
					                   }
					               }
					           }
					       },
					       series: [{
					           name: 'Brands',
					           colorByPoint: true,
         
					           data:data ,
					       }]
					   });
			   },error:function(){
				   alert("报错");
			   }
			   
		   })
	})
   
   </script>
   


</body>
</html>