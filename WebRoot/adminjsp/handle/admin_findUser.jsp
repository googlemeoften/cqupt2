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
    
    <title>所有用户</title>
    
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
					<a href="#">
						<i class="fa fa-indent indent"></i>
					</a>
				</ul>
				<ul class="navbar-nav navbar-right nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"">信息提示</a>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">${session_admin.admin_name }</a>
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
						<li><a href="javascript:void(0)">公告管理</a></li>
					</ol>
					<div class="alert alert-info" role="alert">
					  <p style="text-align: center;">${msg }</p>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">所有用户</div>
						
							<table class="table table-striped table-bordered">
								<thead>
									<tr><th>用户名</th><th>邮箱</th><th>操作</th></tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${userList }">
										<tr>
											<td >${user.username }</td>
											<td>${user.email }</td>
											<c:if test="${session_admin.level==1 }">
											 <td><a href="<c:url value='AdminServlet.jsp?method=addAdmin&uid=${user.uid }'/>">添加为管理员</a></td>
											</c:if>
											<td><a href="<c:url value='deleteUser.action?uid=${user.uid }'/>">删除用户</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						
						<div class="panel-footer">
							<div class="row">
								<div class="col-sm-4"></div>
								<div class="col-sm-4" style="text-align: center;">
								</div>
								<div class="col-sm-4">
									<nav><%--
										  <ul class="pagination">
											    <li>
											      <a href="#" aria-label="Previous">
											        <span aria-hidden="true">&laquo;</span>
											      </a>
											    </li>
											    <c:forEach var="i" begin="1" end="${pb.tp }">
												    <li><a href="#">${i }</a></li>
											    </c:forEach>
											    <li>
											      <a href="#" aria-label="Next">
											        <span aria-hidden="true">&raquo;</span>
											      </a>
											    </li>
										  </ul>
									--%></nav>
								</div>
							</div>
						</div>
					</div><!--panel 结束-->
				</div><!--content 结束-->			
			</div><!--content-box结束-->
		</div><!--main-box结束-->
	</body>
	<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	function newsListfromDB(){
		$.ajax({
			type:"get",
			url:"NewsListServlet?method=findAllNewsList",
			dataType:"json",
			success:function(data){
				var html=null;
				var pageHead= "<li><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
				var pageBody="";
				var pageFoot="<li><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
				console.log(data[0].tp);
				for(var i=0;i<data[0].beanlist.length;i++){
					html+="<tr><td><input type='checkbox'></td><td>"+(i+1)+"</td><td><a href='"+data[0].beanlist[i].nid+"'>"+data[0].beanlist[i].title+"</a></td><td>"+data[0].beanlist[i].date+"</td></tr>";
				}
				for(var j=0;j<data[0].tp;j++){
					pageBody+="<li><a href='#'>"+(j+1)+"</a></li>";
				}
				$(".pagination").html(pageHead+pageBody+pageFoot);
				$("#table").html(html);
			}
		});
	}
	</script>
</html>
