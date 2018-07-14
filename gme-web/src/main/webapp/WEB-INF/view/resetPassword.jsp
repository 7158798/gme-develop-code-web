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
		<div class="L_1" style="height: 880px;">
			<div class="L_2">
				<div class="L_3">
					<p class="L_5">重置登录密码</p>
					<a class="L_6 action_6" id="sjzczh">手机找回</a>
					<a class="L_6" id="yxzczh">邮箱找回</a>
					<script>
						$("#yxzczh").click(function() {
							$("#sjzczh").removeClass("action_6");
							$("#yxzczh").addClass("action_6");
							$("#sjzclbzh").slideUp(300, function() {
								$("#sjzclbzh").css("display", "none");
							});
							$("#yxzclbzh").slideDown(300, function() {
								$("#yxzclbzh").css("display", "block");
							});
						});
						$("#sjzczh").click(function() {
							$("#yxzczh").removeClass("action_6");
							$("#sjzczh").addClass("action_6");
							$("#yxzclbzh").slideUp(300, function() {
								$("#yxzclbzh").css("display", "none");
							});
							$("#sjzclbzh").slideDown(300, function() {
								$("#sjzclbzh").css("display", "block");
							});
						});
					</script>
					<div id="sjzclbzh">
						<p class="L_9">手机号码</p>
						<div class="L_10">
							<select class="L_11">
								<option value="volvo">+86</option>
								<option value="saab">+86</option>
								<option value="opel">+86</option>
								<option value="audi">+86</option>
							</select>
							<input id="sjhm" class="L_12" type="tel" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')" />
						</div>
						<script>
							function telpanduan() {
								var sMobile = document.getElementById("sjhm").value;
								if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile))) {
									alert("不是完整的11位手机号或者正确的手机号前七位");
									return false;
								} else {
									// 验证码发送事件
								}
							}
						</script>
						<p class="L_9">验证码</p>
						<div class="L_10" style="border: 0px;">
							<input class="L_13" id="sjczyzm" type="text" maxlength="6" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" />
							<input class="L_14" onclick="telpanduan()" type="button" value="发送验证码" />
						</div>
					</div>
					<div id="yxzclbzh" style="display: none;">
						<p class="L_9">邮箱号码</p>
						<div class="L_10">
							<input id="youxianghaoma" class="L_22" type="email" />
						</div>
						<p class="L_9">验证码</p>
						<div class="L_10" style="border: 0px;">
							<input class="L_13" id="yxczyzm" type="text" maxlength="6" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" />
							<input class="L_14" onclick="emailpanduan()" type="button" value="发送验证码" />
						</div>
						<script>
							function emailpanduan() {
								var temp = document.getElementById("youxianghaoma"); //对电子邮件的验证            
								var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
								if(!myreg.test(temp.value)) {
									alert('提示\n\n请输入有效的E_mail！');
									myreg.focus();
									return false;
								} else {
									// 邮箱验证码发送
								}
							}
						</script>
					</div>
					<div id="sjczmmtc" style="display: none;">
						<p class="L_9">重置密码</p>
						<input type="password" id="denglimima" class="L_15" />
						<p class="L_9">确认密码</p>
						<input type="password" class="L_15" />
					</div>
					<input type="button" id="zczhan" value="确认" onclick="czmmym()" class="L_20" style="margin-top: 40px;" />
				</div>
				<div class="L_4">

				</div>
				<script>
					function czmmym() {
						var teb = $("#sjhm").val(),
							em = $("#youxianghaoma").val(),
							sjczyzm = $("#sjczyzm").val(),
							yxczyzm = $("#yxczyzm").val(),
							quhao = $("#quhao").change(function() {}),
							quhaoxuanz = $("#quhao").find("option:selected").text(),
							mima = $("#denglimima").val(),
							tuijianid = "";
						if($("#sjczmmtc").css("display") != "none") {
							if(teb == "") {
								$.ajax({
									type: 'POST',
									url: "http://192.168.0.148:8080/gme-web/api/v1/user/checkIdentCode.json",
									data: "phoneCode=" + teb + "&identCode=" + sjczyzm,
									dataType: "json",
									success: function(data) {
										/* if (data.code == 200) {
											alert("验证短信验证码成功");
											$.ajax({
												type: 'POST',
												url: "http://192.168.0.148:8080/gme-web/api/v1/user/resetPassword.json",
												data: "password=" + "1212122",
												success: function(data){
													if (data.code == 200) {
														window.location.href="http://192.168.0.148:8080/gme-web/firstLogin.html";
														return;
													}else {
														alert(data.msg);
														return;
													}
												}
											});
											return;
										}else {
											alert(data.msg);
											return;
										} */
									}
								});
							} else {
								$.ajax({
									type: 'POST',
									url: "http://192.168.0.148:8080/gme-web/api/v1/user/resetPassword.json",
									data: "loginId=" + em + "&password=" + mima,
									dataType: "json",
									success: function(data) {
										alert(console.log(data));
									}
								});
							}
						} else { // 验证手机号验证码
							if(teb == "") {
								$.ajax({
									type: 'POST',
									url: "http://192.168.0.148:8080/gme-web/api/v1/user/checkIdentCode.json",
									data: "phone=" + em + "&identCode=" + yxczyzm,
									dataType: "json",
									success: function(data) {
										if (data.code == 200) {
											$.ajax({
												type: 'POST',
												url: "http://192.168.0.148:8080/gme-web/api/v1/user/resetPassword.json",
												data: "password=" + "1212122",
												success: function(data){
													if (data.code == 200) {
														window.location.href="http://192.168.0.148:8080/gme-web/firstLogin.html";
														return;
													}else {
														alert(data.message);
														return;
													}
												}
											});
											return;
										}
									}
								});
							} else {
								$.ajax({
									type: 'POST',
									url: "http://192.168.0.148:8080/gme-web/api/v1/user/checkIdentCode.json",
									data: "phone=" + teb + "&identCode=" + sjczyzm + "&type=3",
									dataType: "json",
									success: function(data) {
										/* alert(6);
										var jsonData = JSON.parse(data);
										if(jsonData.message == "成功") {
											alert(3)
										} else {
											alert(4)
										} */
										if (data.code == 200) {
											alert("验证短信验证码成功");
											$.ajax({
												type: 'POST',
												url: "http://192.168.0.148:8080/gme-web/api/v1/user/resetPassword.json",
												data: "password=" + "1212122",
												success: function(data){
													if (data.code == 200) {
														window.location.href="http://192.168.0.148:8080/gme-web/firstLogin.html";
														return;
													}else {
														alert(data.msg);
														return;
													}
												}
											});
											return;
									}
									}
								});
							}
						}
					}
				</script>
			</div>
		</div>

		<script type="text/javascript" src="js/style.js"></script>
	</body>

</html>