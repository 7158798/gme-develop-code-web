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
						<li><a href="#">首页</a></li>
						<li><a href="#">C2C交易</a></li>
						<li><a href="#">币币交易</a></li>
						<li><a href="#">我的财务</a></li>
						<li><a href="#">安全设置</a></li>
						<li><a href="#">公告</a></li>
						<li><a href="#">提交工单</a></li>
					</ul>
				</div>
			</div>
			<div class="header_2">
				<div class="header_denglu">
					<ul>
						<li><a href="#" class="whate">登录</a></li>
						<li>|</li>
						<li><a href="#" class="whate">注册</a></li>
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
		<div class="L_1" style="height: 650px;">
			<div class="L_2">
				<div class="L_3" style="width: 700px;">
					<p class="L_5">登录二步验证</p>
						<p class="L_9" style="margin-top: 60px;margin-bottom: 34px;">用户登录第二步验证，是通过短信验证码进一步保证账号的安全的高级安全机制，请输入以下信息：</p>
						<p class="L_9">短信验证码</p>
						<div class="L_10" style="border: 0px;">
							<input id="identCodeId" name="identCode" class="L_13" style="width: 206px;" type="text" maxlength="6" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" />
							<input class="L_14_2" style="" type="button" value="获取短信验证码" />
							<input class="L_14_2" style="" type="button" value="获取电话语音验证码" />
						</div>
					<input type="button" id="zczhan" value="提交" class="L_20" style="margin-top: 40px;" onclick="onSubmit();" />
				</div>
				<div class="L_4" style="width: 500px;">

				</div>
			</div>
		</div>

		<script type="text/javascript">
		function onSubmit (){
			var identCode = $("#identCodeId").val();
			var redirectUrl = "${redirect}";
			$.ajax({
				type: 'POST',
				url: "http://192.168.0.148:8080/gme-web/api/v1/user/checkIdentCode.json",
				data: "identCode=" + identCode + "&type=" + "3",
				dataType: "json",
				success: function(data) {
					if (data.code == "200") {
						if (redirectUrl == "") {
							window.location.href="http://192.168.0.148:8080/gme-web/loginIndex.html";
							return;
						}else{
							window.location.href = redirectUrl;
							return;
						}
					}else {
						alert(data.message);
						window.location.reload();
						return;
					}
					
				}
			});
		}
		</script>

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