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
    
    <title>团队介绍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style-model.css" rel="stylesheet">

  </head>
  
  <body data-spy="scroll" data-target="#navbar" data-offset="10">
		
		<div class="modal fade" id="myModal" >
			<div class="modal-dialog  modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss = "modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalTitle" >图片预览</h4>
					</div>
					<div class="modal-body">
						<img src="" style="max-width: 1050px;height: 500px;"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="head">
			<div class="wrap">
				<img src="images/logo.png" / alt="cqupt">
				<p class="context">网络与信息安全中心</p>
			</div>
		</div>
		<div id="menuList" class="navList">
			<div id="menuList-wrap">
				<a href="<c:url value='/index.jsp'/>" class="connection" >首页</a>
				<a href="<c:url value='/jsp/newsList.jsp'/>" class="connection">信安新闻</a>
				<a href="<c:url value='/jsp/teamProject.jsp'/>" class="connection" style="color:yellow">团队项目</a>
				<a href="<c:url value='/jsp/teamPhoto.jsp'/>" class="connection">团队照片</a>
				<a href="<c:url value='/jsp/introduce.jsp'/>" class="connection">关于我们</a>
			</div>
			<div id="navbottomtip"></div>
		</div>
		<!--<div id="expandZone" class="expand">
			<div class="expdiv">
				<div class="expdiv-list">
					<a href="#">信安主页</a>
				</div>
				<div class="expdiv-list">
					<a href="#" id="A4">前端课程</a>
					<a href="#" id="A4">手机开发</a>
					<a href="#" id="A4">后台编程</a>
				</div>
				<div class="expdiv-list">
					<a href="#" id="A4">javascript</a>
					<a href="#" id="A4">css</a>
					<a href="#" id="A4">jQuery</a>
				</div>
				<div class="expdiv-list">
					<button id="btnLogin" hidefocus="true" class="login-btn">登录</button>
				</div>
				<div class="expdiv-list">

					<button id="btnLogin2" hidefocus="true" class="login-btn">了解更多</button>
				</div>
			</div>
			<div id="closeBtn" class="close-btn">
				<div class="spinner">
					<div class="double-bounce1"></div>
					<div class="double-bounce2"></div>
				</div>
			</div>
		</div>-->

		
		<div class="img-wrap">
			
		</div>
		
		<div class="contain clearfix">
			<div class="project_news_type">
				<h2 class="news-center">团队项目</h2>
				<div id="navbar" class="new_type_content">
					<ul class="nav nav-tabs" role="tablist">
						<li><a href="javascript:void(0)"  onclick="document.getElementById('content1').scrollIntoView();" >面向非结构化数据的并行挖掘算...</a></li>
						<li><a href="javascript:void(0)" onclick="document.getElementById('content2').scrollIntoView();">科技处科研成果管理系统</a></li>
						<li><a href="javascript:void(0)" onclick="document.getElementById('content3').scrollIntoView();">基于新浪微博的社交网络用户行...</a></li>
						<li><a href="javascript:void(0)" onclick="document.getElementById('content4').scrollIntoView();">多安全等级虚拟桌面系统关键技...</a></li>
						<li><a href="javascript:void(0)" onclick="document.getElementById('content5').scrollIntoView();">Ipox蛋白质组信息学分析系统</a></li>
						<li><a href="javascript:void(0)" onclick="document.getElementById('content6').scrollIntoView();">GPRS行业应用诊断精灵</a></li>
						
					</ul>
				</div>
			</div>
			<div class="project_list_box ">
				<div class="panel panel-default">
				<div class="panel-heading">
					团队项目
					<ol class="breadcrumb">
					  <li><a href="<c:url value='/index.jsp'/>">首页</a></li>
					  <li class="active">团队项目</li>
					</ol>
				</div>
				<div class="panel-body">
					<div class="row aqa" id="content1">
					  <div class="col-xs-9 col-md-5">
					    <a href="javascript:;" class="thumbnail">
					      <img src="images/teamProject/mxfjgh/mxfjgh1.jpg" alt="" data-toggle="modal" data-target="#myModal">
					    </a>
					     <div class="caption">
					        <h5>面向非结构化数据的并行挖掘算法研究和实现</h5>      
					      </div>
					  </div>
					  <div class="col-xs-9 col-md-5">
					    <a href="javascript:;" class="thumbnail">
					      <img src="images/teamProject/mxfjgh/mxfjgh2.jpg" alt="" data-toggle="modal" data-target="#myModal">
					    </a>
					     <div class="caption">
					        <h5>面向非结构化数据的并行挖掘算法研究和实现</h5>      
					      </div>
					  </div>
					  <div class="col-xs-9 col-md-5">
					    <a href="javascript:;" class="thumbnail">
					      <img src="images/teamProject/mxfjgh/mxfjgh3.jpg" alt="" data-toggle="modal" data-target="#myModal">
					    </a>
					     <div class="caption">
					        <h5>面向非结构化数据的并行挖掘算法研究和实现</h5>      
					      </div>
					  </div>
					</div>
					<hr style="border:1px solid #2DCB70">
					<div class="row" id="content2">
						 <div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/kjccg/kjc.jpg" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>科技处科研成果管理系统</h5>      
						     </div>
					     </div>
					</div>
					<hr style="border:1px solid #2DCB70">
					<div class="row" id="content3">
						 <div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/jyxlwb/sl1.jpg" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>基于新浪微博的社交网络用户行为分析系统</h5>      
						     </div>
					     </div>
					     <div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/jyxlwb/sl2.jpg" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>基于新浪微博的社交网络用户行为分析系统</h5>      
						     </div>
					     </div>
					     <div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/jyxlwb/sl3.jpg" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>基于新浪微博的社交网络用户行为分析系统</h5>      
						     </div>
					     </div>
					</div>
					<hr style="border:1px solid #2DCB70">
					<div class="row" id="content4">
						<div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/daqdj/daq1.png" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>多安全等级虚拟桌面系统关键技术研究</h5>      
						     </div>
					     </div>
					     <div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/daqdj/daq2.jpg" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>多安全等级虚拟桌面系统关键技术研究</h5>      
						     </div>
					     </div>
					     <div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/daqdj/daq3.png" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>多安全等级虚拟桌面系统关键技术研究</h5>      
						     </div>
					     </div>
					</div>
					<hr style="border:1px solid #2DCB70">
					<div class="row" id="content5">
						<div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/ipox/Ipox1.png" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>Ipox蛋白质组信息学分析系统</h5>      
						     </div>
					     </div>
					     <div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/ipox/Ipox2.png" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>Ipox蛋白质组信息学分析系统</h5>      
						     </div>
					     </div>
					     <div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/ipox/Ipox3.png" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>Ipox蛋白质组信息学分析系统</h5>      
						     </div>
					     </div>
					</div>
					<hr style="border:1px solid #2DCB70">
					<div class="row" id="content6">
					    <div class="col-xs-9 col-md-5" >
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/gprs/GPRS1.jpg" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>GPRS行业应用诊断精灵</h5>      
						     </div>
					    </div>
					     <div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/gprs/GPRS2.jpg" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>GPRS行业应用诊断精灵</h5>      
						     </div>
					    </div>
					     <div class="col-xs-9 col-md-5">
						    <a href="javascript:;" class="thumbnail">
						      <img src="images/teamProject/gprs/GPRS3.jpg" alt="" data-toggle="modal" data-target="#myModal">
						    </a>
						     <div class="caption">
						        <h5>GPRS行业应用诊断精灵</h5>      
						     </div>
					    </div>
					   </div>
				</div>
			</div>
			</div><!--list_box结束-->
			</div>
		
		
		<div class="footer">
			<!--<div class="contactstyle">
				<div class="shareto">
					<img src="images/sina.png" alt="sina" />
				</div>
				<div class="shareto">
					<img src="images/tecent.png" alt="tencent" />
				</div>
				<div class="shareto">
					<img src="images/renren.png" alt="renren" />
				</div>
			</div>-->
			<p><span>联系我们 (∩_∩)</span> | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065 | 渝ICP：10005091-2</p>
		</div>
		<script src="js/jquery-1.11.2.min.js"></script>
		<script src="js/script-model.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script>
			$('body').scrollspy({ target: '#navbar' });
			$(window).scroll(function(){
				
				var windowHeight = $(window).scrollTop();
				var sideHeight= $(".project_news_type").height();
				if(windowHeight>240){
					$(".project_news_type").attr("style","position:fixed;top:-1px");
				}else {
					$(".project_news_type").removeAttr("style");
					
				}
			});
			
		$(function(){
			$(".panel-body .row img").each(function(){
				
				$(this).click(function(){
					var osrc=$(this).attr("src");
					$("#myModal .modal-body img").attr("src",osrc);
				});
			});
		});
		</script>
	</body>
</html>
