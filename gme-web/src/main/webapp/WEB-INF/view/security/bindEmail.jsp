<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/CZ.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/style-hei.css" />
		<link rel="stylesheet" href="css/1200.css" />
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	</head>

	<body class="">

		<!--
        	作者：李德芳
        	时间：2018-06-28
        	描述：
        -->
			<div class="L_36" style="height: 594px;">
				<div class="L_39" style="border-bottom: 2px solid #fafbfc;">
					邮箱绑定
				</div>
				<div class="L_85" id="L_85">
					<p>您尚未绑定邮箱，<span>绑定邮箱</span></p><br />
					<input type="button" value="立即绑定" onclick="$('#L_85').css('display','none');$('#L_85_2').css('display','block');" />
				</div>
				<div class="L_85_2" id="L_85_2">
					<p><span>邮箱：</span><input id="email" onblur="checkEmail(this.value);" type="tel" style="width: 604px;padding-left: 10px;height: 50px;line-height: 50px;border-radius: 3px;border: 1px solid #F2F5F7;" /></p>
					<p style="margin-top: 20px;margin-bottom: 20px;"><span>验证码：</span><input id="emailCode" type="text" style="width: 426px;padding-left: 10px;height: 50px;line-height: 50px;border-radius: 3px;border: 1px solid #F2F5F7;" /><input type="button" id="sendEmailCode" value="获取验证码"  style="width: 164px;margin-left: 14px;height: 50px;line-height: 50px;border-radius: 3px;border: 1px solid #7495b4;background: #FFFFFF;color: #7495b4;"/></p>
					<p><input type="button" onclick="bindEmail();" value="确定" style="margin-left: 160px;width: 614px;height: 50px;line-height: 50px;border: 0px;border-radius: 3px;background: #347ddd;color: #FFFFFF;" /></p>
				</div>
				<div class="L_85_3" id="L_85_3">
					<p>已绑定邮箱：<span id="emailNum"></span>。用于安全通知，登陆，安全设置时输入。</p>
				</div>
			</div>
		<script type="text/javascript" src="js/style.js"></script>
		
		
		
		<script type="text/javascript">
			var bindEmail = '${bindEmail}';
			if (bindEmail == "false") {
				// 绑定了邮箱
				var email = '${email}';
				$('#L_85').css('display','none');
				$('#L_85_2').css('display','none');
				$('#L_85_3').css('display','block');
				$("#email").text(email);
			} else {
				
			}
		</script>
		
		
		
		
		
		<script type="text/javascript">
		
			// 检查邮箱格式
			function checkEmail(email){
				var myReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
				if (myReg.test(email)) {
					return true;
				}
				alert("邮箱格式不正确");
				return false;
			};
		
			// 发送验证码
			function sendEmailCode(){
				var email = $("#email").val();
				if (checkEmail(email)){
					$.ajax({
						type: "POST",
						url: "http://192.168.0.148:8080/gme-web/api/v1/security/sendEmail.json",
						dataType: "json",
						data: "email=" + email + "&type=6",
						success: function (data){
							alert(data.message);
						}
					});
				}				
			};
		</script>
		
		
		
		<script type="text/javascript">
			// 绑定邮箱
			function bindEmail(){
				var email = $("#email").val();
				var emailCode = $("#emailCode").val();
				if (checkEmail(email)){
					$.ajax({
						type: "POST",
						url: "http://192.168.0.148:8080/gme-web/api/v1/security/bindEmail.json",
						dataType: "json",
						data: "email=" + email + "&emailCode=" + emailCode + "&tradeAuth=123",
						success: function (data){
							alert(data.message);
							if (data.code == 200) {
								var emailNum = data.data;
								$('#L_85').css('display','none');
								$('#L_85_2').css('display','none');
								$('#L_85_3').css('display','block');
								$("#emailNum").text(emailNum);
							}
						}
					});
				}
			}
		
		</script>
		
		
		
	</body>

</html>