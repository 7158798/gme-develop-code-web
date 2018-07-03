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
		<div class="header">
			<div class="header_1">
				<div class="logo">
					<a>
						<img src="img/dblg.png" />
					</a>
				</div>
				<div class="header_daohang">
					<ul>
						<li>
							<a href="#">首页</a>
						</li>
						<li>
							<a href="#">C2C交易</a>
						</li>
						<li>
							<a href="#">币币交易</a>
						</li>
						<li>
							<a href="#">我的财务</a>
						</li>
						<li>
							<a href="#">安全设置</a>
						</li>
						<li>
							<a href="#">公告</a>
						</li>
						<li>
							<a href="#">提交工单</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="header_2">
				<div class="header_denglu">
					<ul>
						<li>
							<a href="#" class="whate">登录</a>
						</li>
						<li>|</li>
						<li>
							<a href="#" class="whate">注册</a>
						</li>
						<li>
							<span class="zyw">中文版</span>
							<div class="yybb">
								<a href="#">ENGLISH</a>
								<a href="#">한국어</a>
							</div>
						</li>
					</ul>
				</div>
				<div class="header_zhuti">
					<ul>
						<span>主题</span>
						<li id="bai"></li>
						<li id="hei"></li>
					</ul>
				</div>
			</div>
		</div>
		
		
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
		<!-- content -->

		<div class="footer">
			<div class="aqgxfw_30">
				<div class="aqgxfw_31">
					<div class="aqgxfw_32">
						<img src="img/dblg.png" />
						<img src="img/QQ@@2x.png" style="margin:28px 6px 5px 0px;" />
						<img src="img/微信@@2x.png" style="margin:28px 0px 5px 0px; " />
						<img src="img/新浪@@2x.png" style="margin:28px 10px 5px 6px; " />
						<img src="img/1111@@2x.png" style="margin:6px 0px 5px 0px; " />
						<img src="img/2222@@2x.png" style="margin:6px 10px 5px 6px; " />
					</div>
					<div class="aqgxfw_33">
						<p class="aqgxfw_34">关于我们</p>
						<p class="aqgxfw_36">上币申请</p>
						<p class="aqgxfw_36">平台简介</p>
						<p class="aqgxfw_36">公共API</p>
					</div>
					<div class="aqgxfw_35">
						<p class="aqgxfw_34">充币提币</p>
						<p class="aqgxfw_36">充币地址为何相同</p>
						<p class="aqgxfw_36">充币说明</p>
						<p class="aqgxfw_36">提币说明</p>
						<p class="aqgxfw_36">限币限额和手续费</p>
					</div>
					<div class="aqgxfw_33">
						<p class="aqgxfw_34">常见问题</p>
						<p class="aqgxfw_36">法币交易</p>
						<p class="aqgxfw_36">实名认证</p>
						<p class="aqgxfw_36">账户访问</p>
						<p class="aqgxfw_36">账户注册</p>
					</div>
					<div class="aqgxfw_33">
						<p class="aqgxfw_34">币币交易</p>
						<p class="aqgxfw_36">法币交易</p>
						<p class="aqgxfw_36">拉新返</p>
						<p class="aqgxfw_36">绑定银行卡</p>
					</div>
				</div>
				<div class="aqgxfw_37">
					Copyright © 2017-GMEBTC All Rights Resrved
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/style.js"></script>
	</body>

</html>