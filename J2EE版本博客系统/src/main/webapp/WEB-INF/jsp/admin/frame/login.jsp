<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nicky's blog</title>
<!-- 页面logo设置 start-->
<link rel="icon" type="image/png" href="static/images/logo/logo.png">
<!-- 页面logo设置 end -->
<!-- 页面样式设置，使用bootstrap前端框架 start-->
<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/matrix-login.css" />
<link href="static/login/font-awesome.css" rel="stylesheet" />
<!-- 页面样式设置，使用bootstrap前端框架 end-->
<!-- 引入JQuery库 start -->
<script type="text/javascript" src="static/js/jquery-1.8.3.js"></script>
<!-- 引入JQuery库 end -->
<!-- 引入JQuery提示库 start-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<!-- 引入JQuery提示库 end-->
<!-- 引入Cookie库 start-->
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<!-- 引入Cookie库 end -->
</head>

<body>
	<div
		style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
		<div id="loginbox">
			<form action="" method="post" name="loginForm"
				id="loginForm">
				<div class="control-group normal_text">
					<h3>
						<img width="40px" height="40px" src="static/images/logo/logo.png" alt="Logo" />
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="username" id="username" value="" placeholder="请输入用户名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="static/login/suo.png" /></i>
							</span><input type="password" name="password" id="password" placeholder="请输入密码" value="" />
						</div>
					</div>
				</div>
				<div style="float:right;padding-right:10%;">
					<div style="float: left;margin-top:3px;margin-right:2px;">
						<font color="white">记住密码</font>
					</div>
					<div style="float: left;">
						<input name="form-field-checkbox" id="saveid" type="checkbox"
							onclick="savePaw();" style="padding-top:0px;" />
					</div>
				</div>
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">

						<div style="float: left;">
							<i><img src="static/login/yan.png" /></i>
						</div>
						<div style="float: left;" class="codediv">
							<input type="text" name="code" id="code" class="login_code"
								style="height:16px; padding-top:0px;" />
						</div>
						<div style="float: left;">
							<i><img style="height:22px;" id="codeImg" alt="点击更换"
								title="点击更换" src="" /></i>
						</div>

						<span class="pull-right" style="padding-right:3%;"><a
							href="javascript:onRegister();" class="btn btn-success">注册</a></span> <span
							class="pull-right"><a onclick="loginCheck();"
							class="flip-link btn btn-info" id="to-recover">登录</a></span>

					</div>
				</div>

			</form>

			<div class="controls">
				<div class="main_input_box">
					<font color="white">
					<span id="nameerr">Copyright ©Nicky's blog 2017</span>
					</font>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		/**加载页面时获取验证码**/
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
		});
		
		/**记住密码，页面加载时自动填写**/
		$(document).ready(function(){
			var username = $.cookie('username');
			var password = $.cookie('password');
			if(typeof(username)!="undefined"
					&&typeof(password)!="undefined"){
				$("#username").val(username);
				$("#password").val(password);
			}
			$("#saveid").attr("checked", true);
			$("#code").focus();
		});
	
		/**按回车键触发登录按钮事件**/
		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});
	
		/**获取时间戳**/
		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}
	
		/**刷新验证码的脚本处理**/
		function changeCode() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}
		
		/**记住密码的脚本处理**/
		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('username', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#username").val('');
				$("#password").val('');
			}
		}

		/**登录成功之后，保存Cookie**/		
		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('username', $("#username").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		
		/**客户端校验**/
		function checkValidity() {

			if ($("#username").val() == "") {

				$("#username").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#username").focus();
				return false;
			} 

			if ($("#password").val() == "") {
				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {

				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#code").focus();
				return false;
			}

			return true;
		}
		
		/**服务器校验**/
		function loginCheck(){
			if(checkValidity()){
				var username = $("#username").val();
				var password = $("#password").val();
				var code = username+","+password+","+$("#code").val();
				$.ajax({
					type: "POST",//请求方式为POST
					url: 'logincheck.do',//检验url
			    	data: {LOGINDATA:code,tm:new Date().getTime()},//请求数据
					dataType:'json',//数据类型为JSON类型
					cache: false,//关闭缓存
					success: function(data){//响应成功
						if("success" == data.result){
							saveCookie();//保存Cookie
							$("#loginbox").tips({
								side : 1,
								msg : '正在登录 , 请稍后 ...',
								bg : '#68B500',
								time : 10
							});
							window.location.href="admin/index";
						}else if("uerror" == data.result){
							$("#username").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#username").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							$("#code").focus();
						}else if("locked" == data.result){
							alert('您的账号被锁定了，呜呜');
						}else{
							$("#username").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#username").focus();
						}
					}
				});
			}
		}
	</script>
</body>
</html>
