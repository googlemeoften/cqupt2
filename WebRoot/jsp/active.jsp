<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'active.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
		body{
		 	font-size: 16px;
		 	font-family: "微软雅黑";
		 }
		#success,#failure{
			width: 210px;
			margin: 0 auto;
			text-align: center;
		}
		#success-wrap p,failure-wrap p:first-child{
			color:#0796CA;
		}
		.attention{
			color:red;
		}
		#mes{
			color: crimson;
		}
		.head {
			width: 100%;
			padding: 15px 0 20px 0;
		}
	
		.head .wrap {
			width: 1140px;
			position: relative;
			margin: 0 auto;
			background: url(../images/motto.png) no-repeat right;
		}
		.head .context {
			position: absolute;
			left: 280px;
			top: 21px;
			font-family: "microsoft yahei";
			font-size: 16px;
		}
	</style>
  </head>
  	<body>

		<div class="head">
			<div class="wrap">
				<img src="images/logo.png"  alt="cqupt">
				<p class="context">网络与信息安全中心</p>
			</div>
		</div>
		<c:choose>
			<c:when test="${msg==true }">
				<div id="success">
					<h1>恭喜你！</h1>
					<div id="success-wrap">
						<img src="images/hadoop2.png" alt="" />
						<p>你已注册成功！</p>
						<p>将在 <span id="mes">3</span> 秒钟后返回首页！</p>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div id="failure">
					<h1>抱歉！</h1>
					<div id="failure-wrap">
						<img src="images/hadoop2.png" alt="" />
						<p class="attention">${msg }</p>
						<p>将在 <span id="mes">5</span> 秒钟后返回首页！</p>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</body>
	<script language="javascript" type="text/javascript">
		var i =5;
		var timer;
		timer = setInterval("fun()", 1000);

		function fun() {
			if (i == 0) {
				window.location.href = "index.jsp";
				clearInterval(timer);
			}
			document.getElementById("mes").innerHTML = i;
			i--;
		}
	</script>
</html>
