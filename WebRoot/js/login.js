  /*简单验证*/
$(function(){
	$(".input1").blur(function(){
		if($(this).val()==""){
			$(".maillogin").html("用户名不能为空").css("color","red");
		}
	$(".input1").focus(function(){
		$(".maillogin").html("邮箱登陆");
	})
	});
	$(".input2").blur(function(){
		if($(this).val()==""){
			$(".maillogin").html("密码不能为空");
		}
		$(".input2").focus(function(){
		$(".maillogin").html("邮箱登陆");
	})
	})
	
	
	/*ajax提交数据*/
	$(".loginform").submit(function(){
		if($(this).attr('dis')=='1'){
				return false;
		};
		if($(".input1").val()==""||$(".input2").val()==""){
			$(".maillogin").html("请输入用户名密码").css("color","red");
			return false;
		}
		$(this).attr("dis","1");
		
		$.ajax({
			type:"get",
			url:"UserServlet?method=login",
			data: $(".loginform").serialize(),
			success:function(data){
				if(data=="true"){
					$("#loginmask").fadeOut();
					$("#loginface").slideUp();
					//$(".topbar-wrap").hide();
					//$('.loginbar-wrap').show();
				};	
				if(data!=true){
					$(".maillogin").html(data);
				};
				
			},beforeSend:function(){
					$('.input3').val("登录中..");
				},
			complete:function(){
				$(".loginform").attr("dis","0");
				$('.input3').val("登录");
			},
			async:true,
		});
	
	})
})
