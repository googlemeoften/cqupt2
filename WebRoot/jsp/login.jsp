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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/login.css">
  </head>
  
  <body>
		<div class="header">登录表单</div>
		<div class="box">
			<div class="msg">${msg }</div>
			<div class="photo"><img src="images/avtar.png"></div>
			<div class="login">
				<form action="<c:url value='/UserServlet.jsp'/>" method="post">	
						<input type="hidden" name="method" value="login">
						<span><img src="images/user.svg" alt="#" width="30" height="30"></span>
						<input class="input" type="text" name="username" value="${form.username }" placeholder="Username">
	
						<span><img src="images/word.svg" alt="#" width="30" height="30"></span>
						<input class="input" type="password" name="password" value="${form.password }" placeholder="Password">

						<div class="submit">
							<input id="submit" type="submit" value="Login">
						</div>
				</form>
			</div>
		</div>
	</body>
</html>
