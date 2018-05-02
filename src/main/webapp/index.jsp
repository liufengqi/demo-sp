
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<title>登录界面</title>
	<link href="<%=request.getContextPath()%>/xixi/css/default.css" rel="stylesheet" type="text/css" />
	<!--å¿è¦æ ·å¼-->
	<link href="<%=request.getContextPath()%>/xixi/css/styles.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/xixi/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/xixi/css/loaders.css" rel="stylesheet" type="text/css" />
</head>
<body>

<form id="userform">
	<div class='login'>
		<div class='login_title'>
			<div align="center">
				<font size="5px">登录</font>
			</div>
		</div>

		<div class='login_fields'>
			<div class='login_fields__user'>
				<div class='icon'>
					<img alt="" src='<%=request.getContextPath()%>/xixi/img/user_icon_copy.png'>
				</div>
				<input name="username" placeholder='用户名' maxlength="16" type='text' autocomplete="off"/>
				<div class='validation'>
					<img alt="" src='<%=request.getContextPath()%>/xixi/img/tick.png'>
				</div>
			</div>
			<div class='login_fields__password'>
				<div class='icon'>
					<img alt="" src='<%=request.getContextPath()%>/xixi/img/lock_icon_copy.png'>
				</div>
				<input name="userpass" placeholder='密码' maxlength="16" type="password" autocomplete="off">
				<div class='validation'>
					<img alt="" src='<%=request.getContextPath()%>/xixi/img/tick.png'>
				</div>
			</div>
			<div class='login_fields__password'>
				<div class='icon'>
					<img alt="" src='<%=request.getContextPath()%>/xixi/img/key.png'>
				</div>
				<input name="code" placeholder='验证码' maxlength="4" type='text' name="ValidateNum" autocomplete="off">
				<div class='validation' style="opacity: 1; right: -5px;top: -3px;">
					<canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
				</div>
			</div>
			<div class='login_fields__submit'>
				<!--   <input type='button'  onclick="dengluuser()" value='登录'> -->
				<div align="center"><input type='button' value='登录'/></div>
			</div>
		</div>
		<div class='success'>
		</div>
		<div class='disclaimer' align="center">
			<a href="#"><font color="#99ffff">没有账号?去注册</font></a></br>
			欢迎登录CRM管理平台
			<!-- <a href="http://www.mycodes.net/" target="_blank">æºç ä¹å®¶</a> -->
		</div>
	</div>
</form>

<div class='authent'>
	<div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
		<div class="loader-inner ball-clip-rotate-multiple">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<p>认证中...</p>
</div>
<div class="OverWindows"></div>

<link href="<%=request.getContextPath()%>/xixi/layui/css/layui.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/xixi/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/xixi/js/jquery-ui.min.js"></script>
<script type="text/javascript" src='<%=request.getContextPath()%>/xixi/js/stopExecutionOnTimeout.js?t=1'></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/xixi/layui/layui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/xixi/js/Particleground.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/xixi/js/Treatment.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/xixi/js/jquery.mockjax.js"></script>
<script type="text/javascript">

    var canGetCookie = 0;//æ¯å¦æ¯æå­å¨Cookie 0 ä¸æ¯æ 1 æ¯æ
    var ajaxmockjax = 1;//æ¯å¦å¯ç¨èæAjaxçè¯·æ±å 0 ä¸å¯ç¨  1 å¯ç¨
    //é»è®¤è´¦å·å¯ç 

    /* 	var truelogin = "123456";
        var truepwd = "123456"; */

    var CodeVal = 0;
    Code();
    function Code() {
        if(canGetCookie == 1){
            createCode("AdminCode");
            var AdminCode = getCookieValue("AdminCode");
            showCheck(AdminCode);
        }else{
            showCheck(createCode(""));
        }
    }

    function showCheck(a) {
        CodeVal = a;
        var c = document.getElementById("myCanvas");
        var ctx = c.getContext("2d");
        ctx.clearRect(0, 0, 1000, 1000);
        ctx.font = "80px 'Hiragino Sans GB'";
        ctx.fillStyle = "#E8DFE8";
        ctx.fillText(a, 0, 100);
    }

    $(document).keypress(function (e) {
        // åè½¦é®äºä»¶
        if (e.which == 13) {
            $('input[type="button"]').click();
        }
    });
    //ç²å­èæ¯ç¹æ
    $('body').particleground({
        dotColor: '#E8DFE8',
        lineColor: '#133b88'
    });



    layui.use('layer', function () {

        $('input[type="button"]').click(function () {
            var a = "";
            var b = "";
            var code = $('input[name="code"]').val();
            a=code.toLowerCase();
            var asdf =  CodeVal.toUpperCase();
            b=asdf.toLowerCase();
            if(a==b){
                $.ajax({
                    url:"<%=request.getContextPath()%>/news/selectUser",
                    type:"post",
                    async:false,
                    data:$("#userform").serialize(),
                    dataType:"text",
                    success:function(cus){
                        alert(cus);
                        if(cus == "0"){
                            ErroAlert('请输入您的账号');
                        }
                        if(cus == "1"){
                            ErroAlert('请输入密码');
                        }
                        if(cus == "2"){
                            location.href="<%=request.getContextPath()%>/aa.jsp";
                        }
                    }
                })
            }else{
                ErroAlert('验证码错误');
            }
        })
    })

    function zhu(){
        alert("aaaa")
    }

</script>

</body>
</html>



