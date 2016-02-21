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
    
 		<title>总体概述发布</title>
		    
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/management.css" rel="stylesheet">
		<link href="css/font-awesome.css" rel="stylesheet">
		<script src="js/jquery-1.11.2.min.js"></script>
	</head>
	<body>
		<div class="main-box">
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="navbar-header bg-info">
					<a class="navbar-brand ">信安后台管理界面</a>
				</div>
				<ul class="navbar-nav nav ">
					<a href="#">
						<i class="fa fa-indent indent"></i>
					</a>
				</ul>
				<ul class="navbar-nav navbar-right nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"">信息提示</a>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">管理员</a>
					</li>
				</ul>
			</nav>
			
			<div class="content-box">
				<div class="aside">
					<nav class="navbar">
						<ul class="nav navlist">
							<li><a class="text-sm">系统功能</a></li>
							<li><a href="<c:url value='findAllUser.action'/>" class="hover-color"><i class="fa fa-music"></i><span>查看所有用户</span></a></li>
							<li><a href="<c:url value='findAllAdmin.action'/>" class="hover-color"><i class="fa fa-fire"></i><span>查看所有管理员</span></a></li>
							<c:if test="${session_admin.level==1 }">
								<li><a class="text-sm">系统</a></li>
								<li><a href="adminjsp/handle/admin_add.jsp" class="hover-color"><i class="fa fa-beer"></i><span>添加管理员</span></a></li>
							</c:if>
							<li><a class="text-sm">项目</a></li>
							<li><a href="adminjsp/handle/admin_addProject.jsp" class="hover-color newslistclick" style="cursor:pointer "><i class="fa fa-share"></i><span>项目发布</span></a></li>
							<li><a href="adminjsp/handle/admin_projectList.jsp" class="hover-color"><i class="fa fa-share"></i><span>项目列表</span></a></li>
							<li><a class="text-sm">新闻</a></li>
							<li><a href="adminjsp/handle/admin_index.jsp" class="hover-color newslistclick" style="cursor:pointer "><i class="fa fa-share"></i><span>新闻列表</span></a></li>
							<li><a href="adminjsp/handle/publishNews.jsp" class="hover-color"><i class="fa fa-share"></i><span>新闻发布</span></a></li>
							<li><a class="text-sm">介绍</a></li>
							<li><a href="adminjsp/handle/admin_uploadSummy.jsp" class="hover-color"><i class="fa fa-share"></i><span>总体概述发布</span></a></li>
							<li><a href="adminjsp/handle/admin_uploadTeacher.jsp" class="hover-color"><i class="fa fa-share"></i><span>教师风采发布</span></a></li>
							<li><a href="adminjsp/handle/admin_uploadStudent.jsp" class="hover-color" ><i class="fa fa-share"></i><span>优秀学生发布</span></a></li>
							<li><a href="adminjsp/handle/admin_deleteTeacher.jsp" class="hover-color"><i class="fa fa-share"></i><span>教师列表</span></a></li>
							<li><a href="adminjsp/handle/admin_deleteStudent.jsp" class="hover-color" ><i class="fa fa-share"></i><span>学生列表</span></a></li>
						</ul>
					</nav>
				</div>
				
				<div class="content">
					<ol class="breadcrumb">
								<li><a href="adminjsp/handle/admin_index.jsp">主页</a></li>
								<li><a href="javascript:void(0)">总体概述</a></li>
					</ol>
					<div class="alert alert-info" role="alert">
					  <p style="text-align: center;">${msg }</p>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">总体概述发布</div>
						<div class="panel-body">
							<form action="<c:url value='addIntroduce.action'/>" method="post" enctype="multipart/form-data" class="form-horizontal">

								<div class="form-group">
									<div class="col-sm-3" >
										<input id="upFile" type="file"  name="upload" multiple="multiple" class="form-control btn btn-default " />
									</div>
								</div>
								<div class="form-group">
									<input type="submit" class="btn btn-default btn-lg btn-block" value="确认上传"/>
								</div>
									
							</form>
							<div class="form-group">
								<a href="<c:url value='downloadIntroduce.action'/>" class="btn btn-primary btn-lg btn-block" >文档下载</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
	</body>
</html>
