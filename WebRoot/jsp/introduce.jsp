<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'introduce.jsp' starting page</title>
    
   
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link href="css/jquery.fullPage.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.fullPage.min.js"></script>
	<script type="text/javascript" src="js/jquery.easing.min.js" ></script>
	<script>
	$(function(){
		$('#dowebok').fullpage({
			sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE', '#f90'],
			'navigation': true,
			afterLoad: function(anchorLink, index){
				
				if(index == 2){
					$('.section2').find('p').delay(400).animate({
						left: '0'
					}, 1500, 'easeOutExpo');
				}
				if(index == 3){
					$('.section3').find('p').delay(400).animate({
						bottom: '0'
					}, 1500, 'easeOutExpo');
				}
				if(index == 4){
					$('.section4').delay(400).find('p').fadeIn(2000);
					$("#hadoop").animate({
						left:"0"
					},1500,'easeOutExpo');
				}
			},
			onLeave: function(index, direction){
				
				if(index == '2'){
					$('.section2').find('p').delay(400).animate({
						left: '-120%'
					}, 1500, 'easeOutExpo');
				}
				if(index == '3'){
					$('.section3').find('p').delay(400).animate({
						bottom: '-120%'
					}, 1500, 'easeOutExpo');
				}
				if(index == '4'){
					$('.section4').find('p').delay(400).fadeOut(2000);
					$("#hadoop").animate({
					left:"-120%"
					},1500,'easeOutExpo');
				}
			}
		});
	});
</script>
	
	
	<style>
	
		.section { text-align: center; font: lighter 50px "Microsoft Yahei"; color: #fff;}
		.section2 p { position: relative;left: -120%; text-align: left; margin: 0 15px; font-size: 36px;}
		.section3 p {position: relative; bottom: -120%;}
		.section4 p { display: none;}
		#hadoop{position: relative;left: -120%;top:10%;}
	</style>
  </head>
  
 	<body>
		<div id="dowebok">
			<div class="section section1">
				<h3>重邮信安</h3>
				<p>勇于创新，敢于实践</p>
			</div>
			<div class="section section2">
				<h3>信安团队</h3>
				<p>签约（2011级）：腾讯 1人，奇虎360 1人，华为1人，美团网 1人，神州绿盟科技 1人</br>
				 实习（2012级）：阿里巴巴 4人，百度 1人，腾讯 1人，美团网 1人， 去哪儿网 1人
				</p>
			</div>
			<div class="section section3">
				<h3>信安团队</h3>
				<p>成为一个技术牛人并非难事但决非易事，只要不懈努力</p>
			</div>
			<div class="section section4">
				<h3>我们的信念</h3>
				<p>以经验为马，以汗为泉，携手并进。</p>
				<img id="hadoop" src="images/hadoop2.png">
				
			</div>
		</div>
		
		
		
	</body>

</html>
