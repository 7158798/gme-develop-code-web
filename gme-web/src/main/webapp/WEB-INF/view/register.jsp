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
		<div class="L_1">
			<div class="L_2">
				<div class="L_3">
					<p class="L_5">欢迎注册</p>
					<a class="L_6 action_6" id="sjzc">手机注册</a>
					<a class="L_6" id="yxzc">邮箱注册</a>
					<script>
						$("#yxzc").click(function() {
							$("#sjzc").removeClass("action_6");
							$("#yxzc").addClass("action_6");
							$("#sjzclb").slideUp(0, function() {
								$("#sjzclb").css("display", "none");
							});
							$("#yxzclb").slideDown(0, function() {
								$("#yxzclb").css("display", "block");
							});
						});
						$("#sjzc").click(function() {
							$("#yxzc").removeClass("action_6");
							$("#sjzc").addClass("action_6");
							$("#yxzclb").slideUp(0, function() {
								$("#yxzclb").css("display", "none");
							});
							$("#sjzclb").slideDown(0, function() {
								$("#sjzclb").css("display", "block");
							});
						});
					</script>

					<div id="sjzclb">
						<p class="L_7">国籍</p>
						<select class="L_8">
							<option value="volvo">china</option>
							<option value="saab">Saab</option>
							<option value="opel">Opel</option>
							<option value="audi">Audi</option>
						</select>
						<p class="L_9">手机号码</p>
						<div class="L_10">
							<select class="L_11" id="quhao">
								<option value="volvo">+86</option>
								<option value="saab">+64</option>
								<option value="opel">+32</option>
								<option value="audi">+16</option>
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
							<input class="L_13" id="sjyzm" type="text" maxlength="6" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" />
							<input class="L_14" onclick="telpanduan()" type="button" value="发送验证码" />
						</div>
					</div>
					<div id="yxzclb">
						<p class="L_9">邮箱账号</p>
						<div class="L_10">
							<input id="youxianghaoma" class="L_22" type="email" />
						</div>
					</div>
					<p class="L_9">登陆密码</p>
					<input type="password" id="denglimima" class="L_15" />
					<p class="L_9">确认密码</p>
					<input type="password" class="L_15" />
					<p class="L_9">资金密码</p>
					<input type="password" id="zijinmima" class="L_15" />
					<p class="L_9">确认资金密码</p>
					<input type="password" class="L_15" />
					<p class="L_9">图片验证码</p>
					<div class="L_16">
						<input class="L_17" type="text" maxlength="6" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" />
						<div class="L_18">
							<span onclick=" ">看不清？换一张</span>
							<div id="tupianyanzhengma ">
								<img src="https://gateio.io/captcha " />
							</div>
						</div>
					</div>
					<p class="L_19"><input id="yhxy" type="checkbox" checked="checked" />我已阅读并同意
						<a href="# ">《用户使用协议》</a>
					</p>
					<input type="button" id="zczhan" value="注册" onclick="zczh()" class="L_20" />
					<script>
						$(document).click(function() {
							if($("#yhxy").is(":checked") != true) {
								$("#zczhan").attr("disabled", true);
							} else {
								$("#zczhan").removeAttr("disabled");
							}
						})
					</script>
				</div>
				<div class="L_4">
					<p class="L_21">验证邮件可能会被误判为垃圾邮件，请注意查收。</p>
					<p class="L_21">请妥善保存您的GME账号及登录密码。</p>
					<p class="L_21">请勿和其他网站使用相同的登录密码。</p>
				</div>
				<script>
					function zczh() {
						var teb = $("#sjhm").val(),
							em = $("#youxianghaoma").val(),
							quhao = $("#quhao").change(function() {}),
							quhaoxuanz = $("#quhao").find("option:selected").text(),
							tebyzm = $("#sjyzm").val(),
							mima = $("#denglimima").val(),
							zijinmima = $("#zijinmima").val(),
							tuijianid = "";
						if($("#sjzclb").css("display") != "none") {
							$.ajax({
								type: 'POST',
								url: "http://192.168.0.148:8080/gme-web/api/v1/user/phoneRegister.json",
								data: "phoneCode=" + teb + "&countryCode=" + quhaoxuanz + "&identCode=" + tebyzm + "&password=" + mima + "&tradeAuth=" + zijinmima + "&refereeId=" + tuijianid,	
								dataType: "json",
								success: function(data) {
									if (data.code == 200) {
										window.location.href="http://192.168.0.148:8080/gme-web/firstLogin.html";			
										return;
									}else {
										alert(data.message);
										window.location.reload();
										return;
									}
								}
							});
						} else {
							$.ajax({
								type: 'POST',
								url: "http://192.168.0.148:8080/gme-web/api/v1/user/emailRegister.json",
								data: "email=" + em + "&password=" + mima + "&tradeAuth=" + zijinmima + "&refereeId=" + tuijianid,
								dataType: "json",
								success: function(data) {
									if (data.code == 200) {
										// 如果注册成功，提醒用户去邮箱激活
										alert(data.message);
										return;
									}else {
										alert(data.message);
										window.location.reload();
										return;
									}
								}
							});
						}
					}
				</script>
			</div>
		</div>
		<!-- footer -->

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