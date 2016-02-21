// function openNew(){
//    //获取页面的高度和宽度
//    var sWidth=document.body.scrollWidth;
//    var sHeight=document.body.scrollHeight;
//
//    //获取页面的可视区域高度和宽度
//    var wHeight=document.documentElement.clientHeight;
//
//    var oMask=document.createElement("div");
//        oMask.id="omask";
//        oMask.style.height=sHeight+"px";
//        oMask.style.width=sWidth+"px";
//        document.body.appendChild(oMask);
//   var oLogin=document.createElement("div");
//        oLogin.id="login";
//        oLogin.innerHTML="<div class='loginCon'><div id='close'></div></div>";
//        document.body.appendChild(oLogin);
//
//    //获取登陆框的宽和高
//    var dHeight=oLogin.offsetHeight;
//    var dWidth=oLogin.offsetWidth;
//        //设置登陆框的left和top
//        oLogin.style.left=sWidth/2-dWidth/2+"px";
//        oLogin.style.top=wHeight/2-dHeight/2+"px";
//    //点击关闭按钮
//    var oClose=document.getElementById("close");
//     
//
//        //点击登陆框以外的区域也可以关闭登陆框
//        oClose.onclick=oMask.onclick=function(){
//                    document.body.removeChild(oLogin);
//                    document.body.removeChild(oMask);
//                    };
//       };


$(document).ready(function() {
	
	var obtn2 = document.getElementById("btn2");
	var obtn3 = document.getElementById("assign");
	obtn3.onclick=registLoad;
	
	/*轮播*/
	var $imgrolls = $("#jnImageroll div a"); //获取鼠标滑过的文字块
	$imgrolls.css("opacity", "0.7");
	var len = $imgrolls.length; //文字块的个数
	var index = 0; //保存计数
	var adTimer = null;
	$imgrolls.mouseover(function() {
		index = $imgrolls.index(this); //获取当前文字块的下标
		showImg(index);
	}).eq(0).mouseover(); //获取第一个文字块并模拟鼠标

	$('#jnImageroll').hover(function() {
		if (adTimer) {
			clearInterval(adTimer); //鼠标移入停止动画
		}
	}, function() {
		adTimer = setInterval(function() { //鼠标移出开始计时
			showImg(index);
			index++;
			if (index == len) {
				index = 0;
			}
		}, 5000); //每5秒调用showImg(),index+1，直到index==5
	}).trigger("mouseleave"); //模拟触发鼠标移出

	/*图标*/
	$('.link .button').hover(function() {
		var title = $(this).attr('data');
		$('.tip em').text(title); //给文字块赋内容
		var pos = $(this).position().left + 10;
		var dis = ($('.tip').outerWidth() - $(this).outerWidth()) / 2;
		var l = pos - dis;
		$('.tip').css({
			"left": l + 'px'
		}).stop(true, true).animate({
			'top': 110,
			'opacity': 1
		}, 500);
	}, function() {
		//		 if(!$('.tip').is(':animated')){
		$('.tip').animate({
			'top': 100,
			'opacity': 0
		}, 500);
		//	 }
	});

	/*回到顶部*/
	var obtn = document.getElementById('btn');
	var timer = null;
	var isTop = true;
	window.onscroll = function() {
		if (!isTop) {
			clearInterval(timer);
		}
		isTop = false;
	}
	obtn.onclick = function() {
		timer = setInterval(function() {

			var osTop = document.documentElement.scrollTop || document.body.scrollTop;
			var ispeed = Math.floor(-osTop / 6); //取最近的整数
			document.documentElement.scrollTop = document.body.scrollTop = osTop + ispeed;

			isTop = true;
			console.log(osTop - ispeed);
			if (osTop == 0) {
				clearInterval(timer);
			}
		}, 30);
	}
});

function showImg(index) {
	var $rollobj = $("#jnImageroll"); //获取整个div
	var $rolllist = $rollobj.find("div a"); //获取每个文字块
	var newhref = $rolllist.eq(index).attr("href"); //读取前文字块上的属性href
	$("#JS_imgWrap").attr("href", newhref) //给图片块加上当前连接属性
		.find("img").eq(index).stop(true, true).fadeIn().siblings().fadeOut(); //依据index找到对应的图片让它滑入，其他的划出
	$rolllist.removeClass("chos").css("opacity", "0.7")
		.eq(index).addClass("chos").css("opacity", "1"); //给当前文字块添加属性chos,高亮文字，设置不透明度
}


$("#btn2").click(function(){
	registLoad();
});
function onclickLoad() {
	var sWidth = document.body.scrollWidth;
	var sHeight = document.body.scrollHeight;

	var omask = document.getElementById("loginmask");
	var ologinface = document.getElementById("loginface");
	omask.style.height = sHeight + "px";
	omask.style.width = sWidth + "px";

	//设置登陆框的left和top
	ologinface.style.left = (sWidth / 2) - 200 + "px";
	ologinface.style.top = 20 + "px";
	var $omask = $(omask);
	var $ologinface = $(ologinface);
	$omask.fadeIn();
	$ologinface.slideDown();

	omask.onclick = function() {
		$omask.fadeOut();
		$ologinface.slideUp();
	};
}
function registLoad() {
	var sWidth = document.body.scrollWidth;
	var sHeight = document.body.scrollHeight;
	var oinstantreg = document.getElementById("instant-reg");
	var obackto = document.getElementById("backto");
	oinstantreg.style.height = sHeight + "px";
	oinstantreg.style.width = sWidth + "px";
	var $oinstantreg = $(oinstantreg);
	$oinstantreg.fadeIn();
	obackto.onclick = function() {
		$oinstantreg.fadeOut();
	}
}