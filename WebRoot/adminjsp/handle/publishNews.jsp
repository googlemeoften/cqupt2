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

<title>CMS内容发布</title>

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
					<div class="panel-heading">CMS内容发布</div>
					<div class="panel-body">
						<form action="<c:url value='addNews.action'/>" method="post">
							<div class="form-horizontal">

								<div class="form-group">
									<label class="control-label col-md-1">标题</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="title" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-1">作者</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="author" />
									</div>
								</div>
								<input type="hidden" name="image" value="" id="imgsrc">

								<div class="form-group">
									<img src="" alt="" id="img" height="300" style="display:none;"
										class="col-md-offset-1"> <input id="fileToUpload"
										type="file" size="20" name="fileToUpload"
										style="visibility:hidden;width:0px;height:0px"><br />
									<input type="button" class="col-md-offset-1" value="选 择 图 片"
										id="select"
										onclick="document.getElementById('fileToUpload').click()">
								</div>

								<div class="form-group">
									<label class="control-label col-md-1">内容</label>
									<textarea id="projectContent"
										class="form-control textarea-width" rows="10"
										style="resize: none;" name="content"></textarea>
								</div>

								<div class="form-group">
									<button type="submit"
										class="btn btn-info col-md-1 col-md-offset-1">发布</button>
								</div>
							</div>
						</form>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
	$(function() {
		//图片上传
		$("#fileToUpload").change(function() {
			$.ajaxFileUpload({
				url : "newsImage.action",
				secureuri : false,
				fileElementId : "fileToUpload",
				dataType : "text",
				success : function(data) {
					$("#img").attr("src", data).show();
					$("#imgsrc").attr("value", data);
				}
			});
		});

		enterListener('#projectContent');

		/*换行自动加br*/
		function enterListener(id) {
			$(id).bind(
					'keydown',
					function(e) {
						var theEvent = e || window.event;
						var code = TouchEvent.keyCode || theEvent.which
								|| theEvent.charCode;
						if (code == 13) {
							console.log('aaaa');
							var enter = "<br/>";
							var content = $(id).val();
							var newContent = content + enter;
							console.log(newContent);
							$(id).val(newContent);
						}
					})
		}
		;

	});
</script>
</html>
