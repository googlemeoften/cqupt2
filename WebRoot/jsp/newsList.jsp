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

<title>新闻列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/style-model.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
	<div class="head">
		<div class="wrap">
			<img src="images/logo.png" / alt="cqupt">
			<p class="context">网络与信息安全技术市级工程实验室</p>
		</div>
	</div>
	<div id="menuList" class="navList">
		<div id="menuList-wrap">
			<a href="<c:url value='/index.jsp'/>" class="connection">首页</a> <a
				href="<c:url value='/jsp/newsList.jsp'/>" class="connection"
				style="color:yellow">通知公告</a> <a
				href="<c:url value='/jsp/team_intruoduce.html'/>" class="connection">团队介绍</a>
			<a href="<c:url value='/jsp/teamPhoto.html'/>" class="connection">团队文化</a>
			<a href="<c:url value='/jsp/aboutUs.html'/>" class="connection">关于我们</a>
		</div>
		<div id="navbottomtip"></div>
	</div>



	<div class="img-wrap"></div>

	<div class="contain clearfix">
		<div class="news_type">
			<h2 class="news-center">信安新闻</h2>
			<div class="new_type_content">
				<ul>
					<li><a href="<c:url value='/jsp/newsList.jsp'/>">信安新闻</a></li>

				</ul>
			</div>
		</div>
		<div class="list_box ">
			<div class="panel panel-default">
				<div class="panel-heading">
					信安新闻
					<ol class="breadcrumb">
						<li><a href="#">首页</a></li>
						<li class="active">信安新闻</li>
					</ol>
				</div>
				<table class="table table-striped table-condensed table-hover">
					<thead>
						<tr>
							<th>编号</th>
							<th>标题</th>
							<th>发布时间</th>
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
							</ul>
							</nav>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!--list_box结束-->
	</div>

	<div class="footer">

		<p>
			<span>联系我们 (∩_∩)</span> | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065 |
			渝ICP：10005091-2
		</p>
	</div>

</body>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/script-model.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {

		$.ajax({
			type : "get",
			url : "findNewsList.action",
			dataType : "json",
			success : function(data) {
				var html = null;
				var pageBody = "";
				for ( var i = 0; i < data.length; i++) {
					html += "<tr><td>" + (i + 1)
							+ "</td><td><a href='findNewsById.action?nid="
							+ data[i].nid + "'>" + data[i].title
							+ "</a></td><td>" + data[i].publishtime
							+ "</td></tr>";
				}

				$("#table").html(html);

			}
		});

	});
</script>
</html>
