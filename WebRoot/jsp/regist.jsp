<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<style>
		*{
			margin: 0;
			padding: 0;
		}
		.form-horizontal{
			margin-top: 130px;
		}
		body{
			background: url(images/bg2.png);
		}
		.confirm{
			 height: 34px;
			margin-left: 14px;
			 padding: 6px 12px;
			border: 1px solid #ccc;
 	        border-radius: 4px;
 	        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
 	        transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
		}
		.confirm:focus{
			 border-color: #66afe9;
  			outline: 0;
  			 -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
  			 box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
		}
		
		#confirm-error{
		position:absolute;
		margin-top:36px;
		margin-left:-177px;
		}
		.form-group .btn{
		margin-top:10px;
		}
		.invalid{
		color:#D9534F;
		}
		.valid{
		color:green;
		}
	</style>

  </head>
  
  <body>
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<a href="#" class="navbar-brand">注册</a>
				</div>
				<div class="collapse navbar-collapse">
					<form class="navbar-form navbar-right" role="search">
						<a href="index.jsp" type="button" class="btn btn-default ">返回主页</a>
					</form>
				</div>
			</div>
			
		</nav>
		
		<form class="form-horizontal" action="<c:url value='regist.action'/>" method="post">
			<input type="hidden" name="method" value="regist">
			<div class="form-group">
				<label class="col-sm-3 control-label">用户名</label>
				<div class="col-sm-6">
					<input type="text" id="username" class="form-control" placeholder="请输入用户名" name="username"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">密码</label>
				<div class="col-sm-6">
					<input type="password" id="password" class="form-control" placeholder="请输入密码" name="password"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">确认密码</label>
				<div class="col-sm-6">
					<input type="password" id="conpassword" class="form-control" placeholder="请再次输入密码" name="passwordconfirm"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">邮箱</label>
				<div class="col-sm-6">
					<input type="email" id="emial" class="form-control" placeholder="请输入邮箱" name="email" />
				</div>
			</div>
			<div class="form-group form-inline">
            	<label class=" col-sm-3 control-label">验证码</label>
                <div class="regist-cell">
                	<input id="confirm" id="verify" class="confirm" name="verifyText">
					<a href="javascript:change()"><img id="img" src="<c:url value='createVerifyCode.action'/>" width="70" height="40"></a>
                </div>
            </div>
			
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<button type="submit" id="submit" class="btn btn-success">立即注册</button>
				</div>
			</div>
			
		</form>
		
		<script type="text/javascript" src="js/jquery-1.11.2.min.js" ></script>
		<script type="text/javascript" src="js/jquery.validate-1.13.1.js" ></script>
		<script>
		function change(){
			 var imgFile=document.getElementById("img");
			 var url=imgFile.getAttribute("src")+"?a="+new Date();
			 imgFile.setAttribute("src",url);	  
		};
		
		$("#submit").click(function(){
			alert("欢迎注册，请到邮箱激活账户");
		});
		
		$(function(){
			$(".form-horizontal").validate({
				rules:{
				username:{
					required:true,
					minlength:3,
					maxlength:10,
					remote:{
						url:"findUserByName.action",
						type:"post"
					}
				},
				password:{
					required:true,
					minlength:6,
					maxlength:10
				},
				email:{
					required:true,
					email:true,
					remote:{
						url:"findByEmail.action",
						type:"post"
					}
				},
				passwordconfirm:{
					required:true,
					minlength:6,
					maxlength:10,
					equalTo:"#password"
				},
				verifyText:{
					required:true,
					remote:{
						url:"verifyCode.action",
						type:"post"
					}
					
				}
			},
			messages:{
				username:{
					required:"请填写用户名",
					minlength:"用户名最小为3位",
					maxlength:"用户名最大为10位",
					remote:"用户名已存在，请重新输入"
				},
				password:{
					required:"请填写密码",
					minlength:"密码最小为6位",
					maxlength:"密码最大为10位"
				},
				email:{
					required:"请填写邮箱",
					email:"请检查邮箱格式",
					remote:"邮箱已注册，请重新输入"
				},
				passwordconfirm:{
					required:"请填写确认密码",
					minlength:"密码最小为6位",
					maxlength:"密码最大为10位",
					equalTo:"请和原密码一致"
				},
				verifyText:{
					required:"请填写验证码",
					remote:"验证码错误，请重新输入"
					
				}
				
			},
			success:function(e){
				e.addClass("valid").text("ok");
			},
			errorClass:"invalid"
			});
			
		});
		</script>
	</body>
</html>
