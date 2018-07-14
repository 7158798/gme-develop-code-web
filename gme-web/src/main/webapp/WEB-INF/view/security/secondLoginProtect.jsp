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
				<div class="L_84">
					您尚未实名认证！为保障您的资金安全，在完成实名认证之前，您将不能进行C2C交易，提币等操作。
					<a href="#" style="display: inline-block;background: #fb9a00;color: #FFFFFF;">立即认证</a>
				</div>
				<div class="L_39" style="border-bottom: 2px solid #fafbfc;">
					两步登录保护设置
				</div>
				<div class="L_85_3" style="display: block;">
					<p>目前两步登录保护状态为：<span id="currentStatus" style="color: #4984d2;"></span></p>
					<p style="margin-top: 18px;">两步登录保护提供更为安全的用户登陆保护。启用这一功能前，您需要首先开启手机验证码功能和密码双重验证功能。启用这一功能后，在您每次登陆前都必须输入手机短信验证码或双重验证码，保障您的登陆安全。</p>
					<p class="L_85_31">短信验证码
						<input type="text" id="identCode"/>
						<input type="button" value="获取短信验证码" onclick="getIdentCode(1);"/>
						<input type="button" value="获取电话语音验证码" onclick="getIdentCode(2);"/>
					</p>
					<p class="L_85_32"><input type="button" onclick="openCloseTwoStep();" id="button" /></p>
				</div>
			</div>
		<script type="text/javascript" src="js/style.js"></script>
		
		
		
		
		<script type="text/javascript">
			// 判断当前状态
			var status = '$(secondLogin)';
			if (status == "true") {
				$("#currentStatus").text("开启");
				$("#button").val("关闭两步登陆保护");
			} else {
				$("#currentStatus").text("关闭");
				$("#button").val("开启两步登陆保护");
			}
		</script>
		
		
		<script type="text/javascript">
			// 发送验证码
			function getIdentCode(type) {
				//1短信
				if (type == 1) {
					$.ajax({
						type: "POST",
						url: "http://192.168.0.148:8080/gme-web/api/v1/sendPhoneCheckCode.json",
						dataType: "json",
						data: "type=8",
						success: function(data){
							alert(data.message);
						}
					})
				}
				// 2语音
				if (type == 2) {
					$.ajax({
						type: "POST",
						url: "http://192.168.0.148:8080/gme-web/api/v1/sendPhoneCheckCode.json",
						dataType: "json",
						data: "type=8" + "&sendByVoice=2",
						success: function(data){
							alert(data.message);
						}
					})
				}
			}
		</script>
		
		
		<script type="text/javascript">
			// 关闭开启二步登录保护
			function openCloseTwoStep() {
				var status = $("#currentStatus").val();
				var checkCode = $("#identCode").val();
				var type;
				if (status == "开启") {
					type = 2;
				}
				if (status == "关闭") {
					type = 1;
				}
				$.ajax({
					type: "POST",
					url: "http://192.168.0.148:8080/gme-web/api/v1/security/openCloseTwoStep.json",
					dataType: "json",
					data: "type=" + type + "&checkCode=" + checkCode,
					success: function(data){
						alert(data.message);
						if (data.code == 200) {
							// 刷新页面
							window.location.reload();
						}
					}	
				});
			}
		</script>
		
		
	</body>

</html>