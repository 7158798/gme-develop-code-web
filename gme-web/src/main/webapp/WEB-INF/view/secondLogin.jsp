<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>฿0.0844 以太币 ETH 对 比特币 BTC - Gate.io - The Gate of Blockchain Assets Exchange</title>
		<meta name="description" content="ETH and BTC 兑换, 网址是 Gate.io， 是一个区块链数字资产交易平台，支持比特币Bitcoin, 以太坊, Ethereum,莱特币, Litecoin，Qtum 等币种交易，其特点是快捷，安全。 ">
		<meta name="keywords" content="比特币, bitcoin, BTC, Ethereum, 以太坊, litecoin, LTC, ETC, Qtum, 代币, ICO, 交易平台，交易网站，比特币交易，比特币兑换，比特币市场 ">
		<meta name="format-detection" content="telephone=no">
		<!--[if lte IE 9]><script type="text/javascript">location.href = '/update.html';</script><![endif]-->
		<link href="css/style.css?v=1526375818" rel="stylesheet" type="text/css">
		<style>
			.icon-48,
			.icon-32,
			.icon-16 {
				background-image: url("images/coins48.png?v=1526551416")
			}
		</style>
		<link href="css/coins_16.css?v=1526551416" rel="stylesheet" type="text/css">
		<link href="css/coins_32.css?v=1526551416" rel="stylesheet" type="text/css">
		<link href="css/coins_48.css?v=1526551416" rel="stylesheet" type="text/css">
		<link href="css/trade.css?v=1521624193" rel="stylesheet" type="text/css">
		<link href="css/theme_dark.css?0517" rel="stylesheet" type="text/css" id="darkStyle" disabled="disabled">

		<link href="favicon.ico" rel="shortcut icon">
		<link rel="apple-touch-icon" sizes="120x120" href="images/apple-touch-icon-120x120.png" />
		<script>
			var g_lang = 'cn';
		</script>
		<script src="js/jquery-1.8.2.min.js"></script>
		<script src="js/jquery.common.tools.js?v=0207"></script>
	</head>

	<body class="">

		<div class="header clearfix">
			<div class="top-up" style="margin-top: 16px;">
				<div class="top-con">
					<ul class="topprice">
						<li> BTC/CNY : ￥ <span class="topnum">55362.06</span><i class="icon-arrow-up">&uarr;</i> </li>
						<li> ETH/CNY : ￥ <span class="topnum">4654.00</span><i class="icon-arrow-up">&uarr;</i> </li>
						<li> LTC/CNY : ￥ <span class="topnum">904.22</span><i class="icon-arrow-up">&uarr;</i> </li>
						<li> QTUM/CNY : ￥ <span class="topnum">108.62</span><i class="icon-arrow-up">&uarr;</i> </li>
					</ul>
					<ul class="login_lan">

						<li class="toplogin">
							<a href="#">注册&nbsp;</a>|&nbsp; </li>
						<li class="toplogin" id="toplogin">
							<a href="login.html">登录</a>
						</li>

						<li class="lang-option">
							<span>中文版</span><i class="caret"></i>
							<div class="more-lan">
								<a href="https://gateio.io/lang/en">English</a>
								<a href="https://gateio.io/lang/kr">한국어</a>
							</div>
						</li>

					</ul>
					<ul id="theme">
						<span>主题:</span>
						<li id="dark" title="深色">深色</li>
						<li id="light" title="浅色">浅色</li>
					</ul>
				</div>
			</div>
			<div class="top-dn" style="height: 66px;">
				<div class="logo">
					<a href="https://gate.io" target="_top">
						<!--[if !IE]]--><img src="images/logo@@2x.png" alt="gate.io LOGO" style="margin: 12px 60px 0 0;" />
						<!--[endif]]-->
						<!--[if IE]><img src="/images/logo.png" alt="LOGO"/><![endif]-->
					</a>
				</div>

				<ul class="gateio-nav" style="margin-top: 16px;">
					<li class="nav-active">
						<a href="gateio_default.html">首页</a>
					</li>
					<li class="">
						<a href="c2c.html" class="tooltip" title="法币交易">C2C交易</a>
					</li>

					<li class="nav-trade-item ">
						<a href="bbjy.html">币币交易</a>
					</li>

					<li class="">
						<a href="caiwubaogao.html">我的财务</a>

					</li>

					<li class="">
						<a href="shenfenrenzheng.html">安全设置</a>

					</li>
					<li class="">
						<a href="gonggao.html">公告</a>

					</li>
					<li class="">
						<a href="wodegongdan.html">提交工单</a>
					</li>
				</ul>

				<div id="top_last_rate" style="display: none"></div>

			</div>
		</div>

		<div class="L_1" style="height: 612px;">
			<div class="L_2">
				<div class="L_3" style="width: 700px;">
					<p class="L_5">登录二步验证</p>
					<p class="L_9" style="margin-top: 60px;margin-bottom: 34px;">用户登录第二步验证，是通过短信验证码进一步保证账号的安全的高级安全机制，请输入以下信息：</p>
					<p class="L_9">短信验证码</p>
					<div class="L_10" style="border: 0px;">
						<input class="L_13" id="dxyzm" style="width: 206px;" type="text" maxlength="6" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" />
						<input class="L_14" style="float: left;margin-left: 10px;width: 128px;font-size: 13px;background: #FFFFFF;color: #86A8C8;border: 1px solid #86A8C8;" type="button" value="获取短信验证码" />
						<input class="L_14" style="float: left;margin-left: 10px;width: 150px;font-size: 13px;background: #FFFFFF;color: #86A8C8;border: 1px solid #86A8C8;" type="button" value="获取电话语音验证码" />
					</div>
					<input type="button" id="zczhan" value="提交" class="L_20" style="margin-top: 40px;" />
				</div>
				<script>
					$.ajax({
						type: 'POST',
						url: "http://192.168.0.148:8082/gme-web/api/v1/user/sendPhoneCheckCode.do",
						data: "phoneCode=" + $("#dxyzm").val() + "&type=1" + "&countryCode=" + quhaoxuanz,
						dataType: "json",
						success: function(msg) {
							alert(msg.code);
						}
					});
				</script>
				<div class="L_4" style="width: 500px;">

				</div>
			</div>
		</div>

		<div class="footer" style="background-color: #152137; ">
			<div class="aqgxfw_30">
				<div class="aqgxfw_31">
					<div class="aqgxfw_32">
						<img src="images/dblg.png" />
						<img src="images/QQ@@2x.png" style="margin:28px 6px 5px 0px;" />
						<img src="images/微信@@2x.png" style="margin:28px 0px 5px 0px; " />
						<img src="images/新浪@@2x.png" style="margin:28px 10px 5px 6px; " />
						<img src="images/1111@@2x.png" style="margin:6px 0px 5px 0px; " />
						<img src="images/2222@@2x.png" style="margin:6px 10px 5px 6px; " />
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
		<script>
			//force user to use https
			//  if ('https:' != document.location.protocol) { window.location = 'https://' + window.location.hostname + window.location.pathname; }

			//for footer
			var tier_next_progress = '0.0';

			$("#usdtAll ").text(toThousands(124632754));
			$("#btcAll ").text(toThousands(655));
			$("#ltcAll ").text(toThousands(2721));
			$("#ethAll ").text(toThousands(30297));
			is_login = 'zuoyehengudan' != '';
		</script>

		<script src="js/socket/socket.io.slim.js "></script>
		<script src="js/chat_room/webim.min.js "></script>
		<script src="js/footer.js?v=0420 "></script>
	</body>

</html>