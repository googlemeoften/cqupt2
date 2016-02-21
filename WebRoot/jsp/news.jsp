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
    		
    <title>${news.title }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/style-model.css" rel="stylesheet"  type="text/css"/>

  </head>
  
  <body>
		<div class="head">
			<div class="wrap">
				<img src="images/logo.png" / alt="cqupt">
				<p class="context">网络与信息安全中心</p>
			</div>
		</div>
		
		<div id="menuList" class="navList">
			<div id="menuList-wrap">
				<a href="<c:url value='/index.jsp'/>" class="connection" style="color:yellow">首页</a>
				<a href="<c:url value='/jsp/newsList.jsp'/>" class="connection">信安新闻</a>
				<a href="<c:url value='/jsp/teamProject.html'/>" class="connection">团队项目</a>
				<a href="<c:url value='/jsp/teamPhoto.html'/>" class="connection">团队照片</a>
				<a href="<c:url value='/jsp/introduce.html'/>" class="connection">关于我们</a>
			</div>
			<div id="navbottomtip"></div>
		</div>
		

		
		<div class="img-wrap">
			
		</div>
		
		
		<div class="contain clearfix">
			<div class="news_type">
				<h2>新闻中心</h2>
				<div class="new_type_content">
					<ul>
						<li><a href="list.html">信安新闻</a></li>
					</ul>
				</div>
			</div>
			<div class="list_box ">
				<h2>新闻中心</h2>
				<h1>${news.title}</h1>
					<p class="list_box_newsInfo">发布人：${news.author} 发布时间： ${news.publishtime}</p>
				 <div class="list_box_newsContent">
			        <p align="center"><img src="${news.image}"  height="300" alt=""/></p>
				 	<p style="width:710px;margin-top: 30px;"> ${content} </p>
				</div>
			</div><!--list_box结束-->
		</div>
		
	</body>
	
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	<script src="js/script-model.js" type="text/javascript"></script>
</html>
