$(function(){
		$("#submit").click(function(){
			var username = $("#username").val();
			var password = $("#password").val();
			var repassword = $("#repassword").val();
			var gender = $("input[name=gender]").val();
			var name = $("#name").val();
			var cardid = $("#cardid").val();
			var tel = $("#tel").val();
			if(username == ""){
				alert("用户名不能为空");
				return false;
			}
			if(password == ""){
				alert("密码不能为空");
				return false;
			}
			if(repassword == ""){
				alert("确认密码不能为空");
				return false;
			}
			if(password != repassword){
				alert("两次密码不一致");
				return false;
			}
			if(name == ""){
				alert("姓名不能为空");
				return false;
			}
			if(cardid == ""){
				alert("证件号不能为空");
				return false;
			}
			if(tel == ""){
				alert("电话不能为空");
				return false;
			}
			$("#registerForm").submit();
		});
	})