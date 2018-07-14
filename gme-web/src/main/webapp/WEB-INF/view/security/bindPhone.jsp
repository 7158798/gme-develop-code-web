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
					手机绑定
				</div>
				<div class="L_85" id="L_85">
					<p>您尚未绑定手机，<span>绑定手机</span></p><br />
					<input type="button" value="立即绑定" onclick="$('#L_85').css('display','none');$('#L_85_2').css('display','block');" />
				</div>
				<div class="L_85_2" id="L_85_2">
					<p><span>手机号码：</span>
						<select id="L_85_qh" id="countryCode">
								<option value="86">+86</option>
								<option value="64">+64</option>
								<option value="32">+32</option>
								<option value="16">+16</option>
						</select>
						<input id="phone" onblur="checkPhone(this.value);" type="tel" style="position: relative;left:-89px;width: 524px;padding-left: 90px;height: 50px;line-height: 50px;border-radius: 3px;border: 1px solid #F2F5F7;" /></p>
					<p style="margin-top: 20px;margin-bottom: 20px;"><span>验证码：</span><input id="phoneCode" type="text"  style="width: 426px;padding-left: 10px;height: 50px;line-height: 50px;border-radius: 3px;border: 1px solid #F2F5F7;" /><input id="phoneCodeButton" onclick="sendPhoneCode();" type="button" value="获取验证码"  style="width: 164px;margin-left: 14px;height: 50px;line-height: 50px;border-radius: 3px;border: 1px solid #7495b4;background: #FFFFFF;color: #7495b4;"/></p>
					<p><input type="button" onclick="bindPhone();" value="确定" style="margin-left: 160px;width: 614px;height: 50px;line-height: 50px;border: 0px;border-radius: 3px;background: #347ddd;color: #FFFFFF;" /></p>
				</div>
				<div class="L_85_3" id="L_85_3">
					<p>您的手机短信验证功能已经启用，手机尾号为<span id="phoneNumber"></span>。登录，提现等操作时使用。</p>
					<p>注意：启用后不能再修改手机号码。</p>
				</div>
			</div>
		<script type="text/javascript" src="js/style.js"></script>
		
		
		<script type="text/javascript">
			var bindPhone = '${bindPhone}';
			if (bindPhone == "false") {
				// 绑定了手机
				var phoneNum = '${phone}';
				$('#L_85').css('display','none');
				$('#L_85_2').css('display','none');
				$('#L_85_3').css('display','block');
				$("#phoneNumber").text(phoneNum);
			} else {
				
			}
		</script>
		
		
		
		<script type="text/javascript">
			// 检查手机号格式是否正确
		 	function checkPhone (phoneNumber) { 
				var pattern = /^1[34578]\d{9}$/;    
				if (pattern.test(phoneNumber)) {     
				    return true;    
				}
				alert("手机号码格式不正确");
				return false;
			};
			
			
			// 发送验证码
			function sendPhoneCode(){
				var phoneNumber = $("#phone").val();
				var countryCode = $("#countryCode option:selected");
				// 如果手机号码格式正确
				if (checkPhone(phoneNumber)) {
					$.ajax({
						type: "POST",
						url: "http://192.168.0.148:8080/gme-web/api/v1/user/sendPhoneCheckCode.json",
						dataType: "json",
						data: "phoneCoe=" + phoneNumber + "&type=7" + "&countryCode=" + countryCode,
						success: function (data){
							alert(data.message);
						}
					});
				}
			}
		</script>
		
		<script type="text/javascript">
			// 绑定手机号
			function bindPhone(){
				var phoneCode = $("#phone").val();
				var identCode = $("#phoneCode").val();
				var countryCode = $("#countryCode option:selected");
				if (checkPhone(phoneCode)) {
					$.ajax({
						type: "POST",
						url: "http://192.168.0.148:8080/gme-web/api/v1/security/bindPhone.json",
						dataType: "json",
						data: "phoneCode=" + phoneCode + "&countryCode=" + countryCode + "&identCode=123456" + "&tradeAuth=1" ,
						success: function (data){
							alert(data.message);
							if (data.code == 200) {
								var phoneNum = data.data;
								$('#L_85').css('display','none');
								$('#L_85_2').css('display','none');
								$('#L_85_3').css('display','block');
								$("#phoneNumber").text(phoneNum);
							}
						}
					});
				}
			}
		</script>		
		

	</body>

</html>