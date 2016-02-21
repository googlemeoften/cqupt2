
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理员首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/management.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">

</head>

<body>
	<div class="main-box">
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header bg-info">
			<a class="navbar-brand ">信安后台管理界面</a>
		</div>
		<ul class="navbar-nav nav ">
			<a href="#"> <i class="fa fa-indent indent"></i> </a>
		</ul>
		<ul class="navbar-nav navbar-right nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button"">信息提示</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button">管理员</a></li>
		</ul>
		</nav>

		<div class="content-box">
			<div class="aside">
				<nav class="navbar">
				<ul class="nav navlist">
					<li><a class="text-sm">系统功能</a>
					</li>
					<li><a href="<c:url value='findAllUser.action'/>"
						class="hover-color"><i class="fa fa-music"></i><span>查看所有用户</span>
					</a>
					</li>
					<li><a href="<c:url value='findAllAdmin.action'/>"
						class="hover-color"><i class="fa fa-fire"></i><span>查看所有管理员</span>
					</a>
					</li>
					<c:if test="${session_admin.level==1 }">
						<li><a class="text-sm">系统</a>
						</li>
						<li><a href="adminjsp/handle/admin_add.jsp"
							class="hover-color"><i class="fa fa-beer"></i><span>添加管理员</span>
						</a>
						</li>
					</c:if>
					<li><a class="text-sm">项目</a>
					</li>
					<li><a href="adminjsp/handle/admin_addProject.jsp"
						class="hover-color newslistclick" style="cursor:pointer "><i
							class="fa fa-share"></i><span>项目发布</span>
					</a>
					</li>
					<li><a href="adminjsp/handle/admin_projectList.jsp"
						class="hover-color"><i class="fa fa-share"></i><span>项目列表</span>
					</a>
					</li>
					<li><a class="text-sm">新闻</a>
					</li>
					<li><a href="adminjsp/handle/admin_index.jsp"
						class="hover-color newslistclick" style="cursor:pointer "><i
							class="fa fa-share"></i><span>新闻列表</span>
					</a>
					</li>
					<li><a href="adminjsp/handle/publishNews.jsp"
						class="hover-color"><i class="fa fa-share"></i><span>新闻发布</span>
					</a>
					</li>
					<li><a class="text-sm">介绍</a>
					</li>
					<li><a href="adminjsp/handle/admin_uploadSummy.jsp"
						class="hover-color"><i class="fa fa-share"></i><span>总体概述发布</span>
					</a>
					</li>
					<li><a href="adminjsp/handle/admin_uploadTeacher.jsp"
						class="hover-color"><i class="fa fa-share"></i><span>教师风采发布</span>
					</a>
					</li>
					<li><a href="adminjsp/handle/admin_uploadStudent.jsp"
						class="hover-color"><i class="fa fa-share"></i><span>优秀学生发布</span>
					</a>
					</li>
					<li><a href="adminjsp/handle/admin_deleteTeacher.jsp"
						class="hover-color"><i class="fa fa-share"></i><span>教师列表</span>
					</a>
					</li>
					<li><a href="adminjsp/handle/admin_deleteStudent.jsp"
						class="hover-color"><i class="fa fa-share"></i><span>学生列表</span>
					</a>
					</li>
				</ul>
				</nav>
			</div>
			<div class="content">
				<ol class="breadcrumb">
					<li><a href="adminjsp/handle/admin_index.jsp">主页</a>
					</li>
					<li><a href="javascript:void(0)">公告管理</a>
					</li>
				</ol>
				<div class="alert alert-info" role="alert">
					  <p style="text-align: center;">${msg }</p>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">公告列表</h3>
					</div>
					<div class="row wrapper">
						<div class="col-sm-5  btn-group">
							<select
								class=" form-control input-s-sm  btn btn-group select-border">
								<option value="0">信安通告</option>
								<option value="1">信安新闻</option>
								<option value="2">web前端</option>
								<option value="3">web后台</option>
							</select>
							<button class="btn  btn-default">确定</button>
						</div>
						<div class="col-sm-4 m-b-xs">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-sm btn-default active"> <input
									type="radio" name="options"> Day </label> <label
									class="btn btn-sm btn-default"> <input type="radio"
									name="options"> Week </label> <label
									class="btn btn-sm btn-default"> <input type="radio"
									name="options"> Month </label>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<input type="text" class="input-sm form-control"
									placeholder="搜索内容.."> <span class="input-group-btn">
									<button class="btn btn-sm btn-default" type="button">搜索!</button>
								</span>
							</div>
						</div>
					</div>

					<table class="table table-striped">
						<thead>
							<tr>
								<th width="20px"><input type="checkbox">
								</th>
								<th>标号</th>
								<th>标题</th>
								<th>发表时间</th>
								<th>作者</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="table"></tbody>
					</table>

					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-4"></div>
							<div class="col-sm-4">
								<nav>
								<ul class="pagination">
									<%--
								    
									    <li><a href="adminjsp/handle/admin_index.jsp">1</a></li>
									    <li><a href="adming">2</a></li>
									    <li><a href="#">3</a></li>
									    <li><a href="#">4</a></li>
								    
								  --%>
								</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div></div>
		</div>
	</div>
</body>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
	$(function() {

		load();
	});

	function load() {
		$.ajax({
			type : "get",
			url : "findNewsList.action",
			dataType : "json",
			async : "false",
			success : function(data) {
				var html = null;
				var pageBody = "";
				for ( var i = 0; i < data.length; i++) {
					html += "<tr><td><input type='checkbox'></td><td>"
							+ (i + 1)
							+ "</td><td><a href='findNewsById.action?nid="
							+ data[i].nid + "'>" + data[i].title
							+ "</a></td><td>" + data[i].publishtime
							+ "</td><td>" + data[i].author
							+ "</td><td><a href='deleteNews.action?nid="
							+ data[i].nid + "'>删除新闻</a></td></tr>";
				}
				/*暂时未添加页码功能*/
				/* for(var j=0;j<data[0].tp;j++){
					pageBody+="<li><a href='javascript:;' class='pagecode'>"+(j+1)+"</a></li>";
				} */

				$("#table").html(html);

			}
		});
	};
</script>
</html>
