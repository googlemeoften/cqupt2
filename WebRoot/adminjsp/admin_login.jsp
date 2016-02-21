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
    
    <title>信安管理员登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<style>
		body{
			background: url(ima);
		}
		form{
			margin-top: 160px;
		}
		.info h1{
			position: relative;
			top:100px;
			text-align: center;
			font-family: "微软雅黑","microsoft yahei";
			font-size: 27px;
			color: #5bc0de;
		}
		#msg{
			color: RED;
			
		}
	</style>
	
  </head>
  
  <body>
		<div class="container">
			<div class="info">
				<h1>信安后台管理登录</h1>
			</div>
			
			<form class="form-horizontal" action="<c:url value='adminLogin.action'/>" method="post">
				<input name="method" value="login" type="hidden">
				 <div class="form-group ">
				    <label for="username" class="col-sm-2 control-label col-sm-offset-2 "></label>
					    <div class="col-sm-4">
					      <span id="msg">${msg }</span>	
					    </div>
				  </div>
				 <div class="form-group ">
				    <label for="username" class="col-sm-2 control-label col-sm-offset-2 ">用户名</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" name="admin_name" id="username" placeholder="用户名">
					      <span class="warning1"></span>
					    </div>
				  </div>
				  <div class="form-group">
					    <label for="password" class="col-sm-2 control-label col-sm-offset-2">密码</label>
					    <div class="col-sm-4">
					      <input type="password" class="form-control" name="password" id="password" placeholder="密码">
					      <span class="warning2"></span>
					    </div>
				  </div>
				  <div class="form-group">
				  		<div class="col-sm-4 col-sm-offset-4">
				  			<input type="submit" class="form-control btn btn-info " value="登录"/>
				  		</div>
				  </div>
			</form>
		</div>
	</body>
	<script src="js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript">
		  /*简单验证*/
			$(function(){
				$("#username").blur(function(){
					if($(this).val()==""){
						$(".warning1").html("用户名不能为空").css("color","red");
					}
					$("#username").focus(function(){
						$(".warning1").html("");
					});
				});

				$("#password").blur(function(){
					if($(this).val()==""){
						$(".warning2").html("密码不能为空").css("color","red");
					}
					$("#password").focus(function(){
						$(".warning2").html("");
					});
				});
			});
			
			/*ajax提交数据*/
			$(".form-horizontal").submit(function(){
				if($(this).attr('dis')=='1'){
						return false;
				};
				if($("#username").val()==""||$("#password").val()==""){
					$(".warning1,.warning2").html("请输入用户名密码").css("color","red");
					return false;
				}
				$(this).attr("dis","1");
	});
</script>
</html>
