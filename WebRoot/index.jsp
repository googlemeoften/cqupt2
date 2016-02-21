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
    
    <title>信安首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/fakeLoader.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet"  type="text/css"/>
	
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="js/fakeLoader.min.js"></script>
	<script type="text/javascript" src="js/modernizr.custom.js"></script>
	<script type="text/javascript" src="js/classie.js"></script>
	<script type="text/javascript" src="js/uisearch.js"></script>
	<script type="text/javascript" src="js/custompp.js"></script>

  </head>
  
  <body>
        <div class="demoo"></div>
		<!--登陆&注册遮罩层-->
		<div id="loginmask" class="loginmask"></div>
		<div id="loginface" class="loginface">
			<div class="logintip"><span class="userlogin">用户登录</span><span class="noaccount">还没有账号</span><span id="assign" class="assign">立即注册</span>
			</div>
			<p class="maillogin"></p>
			<form class="loginform" onSubmit="return false;">
				<input type="hidden" name="method" value="login">
				<input class="input1" type="text" placeholder="邮箱/用户名" name="username" />
				<input class="input2" type="password" placeholder="密码"  name="password" />
				<input class="input3" type="submit" value="登录" />
				<div class="holdogin"><a href="<c:url value='UserServlet.jsp?method=alterpw'/>">忘记密码？</a>
				</div>
			</form>
			<div class="others">
				<div class="otherslogin">
					<p>用第三方账号直接登录</p>
					<div class="qqweibo">
						<a class="qq">微博账号登录</a>
						<a class="weibo">qq账号登录</a>
					</div>
				</div>
			</div>
		</div>
		
		<div id="instant-reg" class="instant-reg">
			<input id="backto" class="backto" type="button" value="返回" />
			<div class="qweireg">
				<p>您可以选择直接注册或第三方帐号注册,一分钟完成 ^_^ </p>
				<div class="qweiwrap">
					<a class="wei" href="jsp/regist.jsp">直接注册</a>
					<a class="q">QQ账号注册</a>
				</div>
			</div>
			<div id="overlay" class="png-fix">
				<div id="title">

				</div>
			</div>
		</div>
		<!--loading层-->
		

		<!--顶部导航层-->
		<div class="topbar">
		    <div class="tobar-share">
				<div class="shareto1">
					<a href="http://d.weibo.com/"><img class="shareto1-img" src="images/sina.png" width="25px" height="25px" ></a>
				</div>
				<div class="shareto2">
					<a href="http://t.qq.com/"><img class="shareto1-img" src="images/tecent.png" width="25px" height="25px" alt=""></a>
				</div>
				<div class="shareto3">
					<a href="http://www.renren.com/"><img class="shareto1-img" src="images/renren.png" width="30px" height="25px" alt=""></a>
				</div>
			</div>
			<c:choose>
				<c:when test="${empty sessionScope.session_user}">
					<div class="topbar-wrap">
						<a href="jsp/login.jsp"><input id="btn1" class="btn1" type="submit" value="登陆" /></a>
						<input id="btn2" class="btn2" type="submit" value="注册" />
					</div>
				</c:when>
				<c:otherwise>
					<div class="loginbar-wrap">
						<p><span>${sessionScope.session_user.username}</span>,欢迎登录！</p>
					</div>
				</c:otherwise>
			</c:choose>
			<div id="sb-search" class="sb-search">
				<form>
					<input class="sb-search-input" placeholder="search your content" type="text" value="" name="search" id="search">
					<input class="sb-search-submit" type="submit" value="">
					<span class="sb-icon-search"></span>
				</form>
			</div>
		</div>
		<!--内容层-->
		<div class="head">
			<div class="wrap">
				<img src="images/logo.png"  alt="cqupt">
				<p class="context">网络与信息安全技术市级工程实验室</p>
			</div>
		</div>

		<div id="menuList" class="navList">
			<div class="yinzhang">
				<img src="images/yin1.png" />
			</div>
			<div id="menuList-wrap">
				<a href="<c:url value='/index.jsp'/>" class="connection" style="color:yellow">首页</a>
				<a href="<c:url value='/jsp/newsList.jsp'/>" class="connection">通知公告</a>
				<a href="<c:url value='/jsp/team_intruoduce.html'/>" class="connection">团队介绍</a>
				<a href="<c:url value='/jsp/teamPhoto.html'/>" class="connection">团队文化</a>
				<a href="<c:url value='/jsp/aboutUs.html'/>" class="connection">关于我们</a>
			</div>
			<div id="navbottomtip"></div>
		</div>
		
		<!-- 大屏轮播 start -->
		<div id="jnImageroll">
			
			<a href="#nogo" id="JS_imgWrap">
				<img src="images/bc1.gif" alt="" />
				<img src="images/bc2.gif" alt="" />
				<img src="images/bc3.gif" alt="" />
				<img src="images/bc4.gif" alt="" />
				<img src="images/bc5.gif" alt="" />
			</a>
			<div>
				<a href="###1"></a>
				<a href="###2"></a>
				<a href="###3"></a>
				<a href="###4"></a>
				<a href="###5" class="last"></a>
			</div>
		</div>
		<!-- 大屏轮播 end -->
		
		<div class="textAbout">
			<h1><span>●</span>信安团队</h1>
			<p>网络与信息安全技术市级工程实验室是依据重庆邮电大学计算机学院、通信与信息工程学院和软件学院等联合建立的跨学科、跨领域的工程研究实验室。
			   实验室长期致力于社交网络、移动互联网、无线网络导控、策略控制与优化、网络安全、云计算、复杂网络等领域中的项目研究与研发。实验室积极推动
			   重庆邮电大学信息安全学科建设、加强科研团队建设，积极策划并承担国家级、省部级等重大重点科研项目。
			</p>
		</div>
		
		<div class="box_wrap">
			<div class="box">
				<div class="link link-miss">
					<span class="icon"></span>
					<a href="<c:url value='/jsp/newsList.jsp'/>" class="button" data="Notice Announcement">
						<span class="line line-top"></span>
						<span class="line line-right"></span>
						<span class="line line-bottom"></span>
						<span class="line line-left"></span>通知公告</a>
				</div>

				<div class="link link-play">
					<span class="icon"></span>
					<a href="<c:url value='/jsp/team_intruoduce.html'/>" class="button" data="Team Introduction">
						<span class="line line-top"></span>
						<span class="line line-right"></span>
						<span class="line line-bottom"></span>
						<span class="line line-left"></span>团队介绍
					</a>
				</div>

				<div class="link link-touch">
					<span class="icon"></span>
					<a href="<c:url value='/jsp/teamPhoto.html'/>" class="button" data="Team Culture">
						<span class="line line-top"></span>
						<span class="line line-right"></span>
						<span class="line line-bottom"></span>
						<span class="line line-left"></span>团队文化</a>
				</div>
				<div class="tip"><em></em><span></span>
				</div>
			</div>
		</div>
		
		<div class="footer">
			<p><span>联系我们 (∩_∩)</span> | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065 | 渝ICP：10005091-2</p>
		</div>
		<a href="javascript:;" id="btn" title="回到顶部"> </a>
	</body>
	<script src="js/script.js" type="text/javascript"></script>
	<script src="js/login.js"></script>
	
	<script>
		new UISearch(document.getElementById('sb-search'));
	</script>
</html>
