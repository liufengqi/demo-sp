<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/25
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
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

<%--<div class="modal fade" id="myModalyanzhengxinwen2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
    <div class="modal fade" id="myModalyanzhengxinwen2" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <form  id="xinwenlista2">

                        <table class="table table-bordered"  >
                            <input type="hidden" name="newsid"/>
                            <tr>
                                <td>新闻标题</td>
                                <td><input type="text" name="newsname"/></td>
                            </tr>
                            <tr>
                                <td>新闻发布时间</td>
                                <td>
                                    <input type="text" name="publishtime"/>
                                </td>
                            </tr>
                            <tr>
                                <td>新闻内容</td>
                                <td><input type="text" name="content"/></td>
                            </tr>
                        </table>


            <div class="modal-footer">
                <button type="button" class="btn btn-success"  id="addxin">提交</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
            </div>
                    </form>
            </div>
        </div>
    </div>
</div>
<section class="wrapper">
    <button type="button" class="btn btn-success" onclick="addxinwen()">添加新闻</button>
    <table class="table" id="ppojjnj" border="1" ></table>
</section>

<div class="modal fade" id="modal-container-123456" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
    <form class="form-login" id="updateuser" action="index.jsp">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                    <h4 class="modal-title">新闻修改页面</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="newsid"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">新闻名称</label>
                        <div class="col-sm-5">
                            <input type="text" name="newsname">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">新闻时间</label>
                        <div class="col-sm-5">
                            <input type="text" name="publishtime">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                    <label class="col-sm-2 control-label">新闻内容</label>
                    <div class="col-sm-5">
                        <input type="text" name="content">
                    </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary" type="button" onclick="updateNews()">保存</button>
                </div>
            </div>
        </div>
    </form>
</div>




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


    //js代码
    function search(){
        $("#ppojjnj").bootstrapTable("refresh");
    };

    $(function(){
        $('#ppojjnj').bootstrapTable({
            url:'<%=request.getContextPath()%>/news/queryNews',
            striped: true,//隔行变色
            showPaginationSwitch:true,//是否显示 数据条数选择框
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            //search:true,//是否显示搜索框
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方
            //bootstrap默认是客户端分页client 若写服务端则出不来结果server
            sidePagination:"",//
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:3,//每页条数
            pageList:[1,3,5],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            onDblClickRow: function (row) {

                BootstrapDialog.show({
                    title: "新闻详情",       //title
                    message: $('<div></div>').load("<%=request.getContextPath()%>/news/queryXinfo?newsid="+row.newsid),
                    buttons : [{
                        label : "导出",
                        action : function(dialog){
                            $.ajax({
                                url : "<%=request.getContextPath()%>/news/queryToWord",
                                type : "post",
                                data : $("#WordForm").serialize(),
                                dataType:"json",
                                success : function(){
                                    location.reload();
                                }
                            })
                        }
                    },{
                        label : "取消",
                        action : function(dialog){
                            dialog.close();
                        }
                    }]
                })
            },
            columns:[[
                {field:'newsid',title:'ID',width:100},
                {field:'newsname',title:'新闻名称',width:100},
              {field:'content',title:'新闻内容',width:100},
                {field:'publishtime',title:'新闻时间',width:100},
                {field:'caozuo',title:'操作',width:100,
                    formatter:function(value,row,index){
                        return '<button href="#modal-container-123456"   data-toggle="modal" type="button" class="btn btn-primary" onclick="queryByIdNews('+row.newsid+')">修改</button>&nbsp;&nbsp;<button href="#modal-container-123456"   data-toggle="modal" type="button" class="btn btn-primary" onclick="deletexin('+row.newsid+')">删除</button>'
                    }}
            ]]
        })
    })

    function   deletexin(newsid){

        $.ajax({
            url:"<%=request.getContextPath()%>/news/deleteNews",
            tpey:"post",
            data:{"newsid":newsid},
            success:function(){
                location.reload();
            },
            error:function(){

            }

        })
    }

    function   addxinwen(){
        $('#myModalyanzhengxinwen2').modal({
            keyboard:false,
            backdrop:false
        })
    }

    $("#addxin").click(function(){

        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/news/addxinwen",
            data:$("#xinwenlista2").serialize(),
            success:function(){
                location.reload();
            },
            error:function(){

            }
        })
    })



    //回显
    function queryByIdNews(newsid){
        $.ajax({
            url:"<%=request.getContextPath()%>/news/queryByIdNews",
            type:"post",
            data:{"newsid":newsid},
            dataType:"json",
            async:false,
            success:function(news){
                $("[name='newsid']").val(news.newsid);
                $("[name='newsname']").val(news.newsname);
                $("[name='publishtime']").val(news.publishtime);
                $("[name='content']").val(news.content);
            },
            error:function(){
                alert("回显出错");
            }
        })
    }
    //修改
    function updateNews(){
        $.ajax({
            url:"<%=request.getContextPath()%>/news/updateNews",
            type:"post",
            data:$("#updateuser").serialize(),
            dataType:"text",
            async:false,
            success:function(){
                location.reload();
            },
            error:function(){
                alert("修改出错");
            }
        })
    }
    </script>
</body>
</html>
