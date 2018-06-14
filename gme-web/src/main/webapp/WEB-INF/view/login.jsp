<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }${fns:getAdminPath()}/user"/>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>用户登录/注册 - Gate.io - The Gate of Blockchain Assets Exchange</title>
		<meta name="description" content="网址是 Gate.io， 是一个区块链数字资产交易平台，支持比特币Bitcoin, 以太坊, Ethereum,莱特币, Litecoin，Qtum 等币种交易，其特点是快捷，安全。 ">
		<meta name="keywords" content="比特币, bitcoin, BTC, Ethereum, 以太坊, litecoin, LTC, ETC, Qtum, 代币, ICO, 交易平台，交易网站，比特币交易，比特币兑换，比特币市场 ">
		<meta name="format-detection" content="telephone=no">
		<!--[if lte IE 9]><script type="text/javascript">location.href = '/update.html';</script><![endif]-->
		<link href="/css/style.css?v=1526375818" rel="stylesheet" type="text/css">
		<style>
			.icon-48,
			.icon-32,
			.icon-16 {
				background-image: url("/images/coins48.png?v=1526551416")
			}
		</style>
		<link href="/css/coins_16.css?v=1526551416" rel="stylesheet" type="text/css">
		<link href="/css/coins_32.css?v=1526551416" rel="stylesheet" type="text/css">
		<link href="/css/coins_48.css?v=1526551416" rel="stylesheet" type="text/css">

		<link href="/css/theme_dark.css?0517" rel="stylesheet" type="text/css" id="darkStyle" disabled="disabled">

		<link href="/favicon.ico" rel="shortcut icon">
		<link rel="apple-touch-icon" sizes="120x120" href="/images/apple-touch-icon-120x120.png" />
		<script>
			var g_lang = 'cn';
		</script>
		<script src="/js/jquery-1.8.2.min.js"></script>
		<script src="/js/jquery.common.tools.js?v=0207"></script>
	</head>

	<body class="">

		<!--<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">-->
		<style>
			html,
			body {
				height: 100%
			}
			
			*:before,
			*:after,
			.form-control {
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				box-sizing: border-box;
			}
			
			.glyphicon-ok:before {
				content: "\221A";
			}
			
			.leftregi form,
			.rightlogin form {
				width: 100%;
				text-align: left
			}
			
			.rightlogin {
				display: flex;
				align-items: center;
			}
			
			label {
				float: left;
				width: 30%;
				font-weight: bold;
				text-align: right;
				padding: 15px 15px 0 0;
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				box-sizing: border-box;
			}
			
			.btn-block.sub-btn {
				width: 40%;
				margin: 10px auto
			}
			
			.btn-block.sub-btn:focus {
				background: #f60 !important;
			}
			
			p.red {
				margin: 20px 0;
				text-align: center
			}
			
			.form-group .red,
			p.red {
				font-size: 13px
			}
			
			.r-tip {
				font-size: 13px;
				font-weight: normal;
				vertical-align: middle;
				height: 48px;
				display: table-cell;
				padding-left: 5px;
			}
			
			.code-box {
				position: relative;
				width: 70%;
				float: left;
			}
			
			.code-box .help-block {
				margin-left: 0;
				padding-top: 5px;
			}
			
			#code,
			#codeReg {
				position: absolute;
				left: 160px;
				top: -5px;
			}
			
			.checkbox {
				clear: both;
				margin-left: 30%;
			}
			
			.checkbox a {
				margin-bottom: 15px
			}
			
			#agrCheckLabel {
				width: auto;
				user-select: none;
				padding-top: 0
			}
			
			.m_title h4 {
				text-align: center;
				font-weight: normal;
				font-size: 24px
			}
			/*auto email*/
			
			.auto-tip {
				background: #fff;
				color: #2c3e50;
				border: 2px solid #dce4ec;
				border-top: none;
				border-radius: 4px;
				z-index: 10000;
				text-align: left
			}
			
			.auto-tip li {
				width: 100%;
				height: 28px;
				line-height: 28px;
				padding: 0 15px;
				font-size: 14px;
			}
			
			.auto-tip li.hoverBg {
				background: #ecf0f1;
				cursor: pointer;
			}
			
			.auto-tip em {
				font-style: normal
			}
			
			#signupForm .auto-tip {
				top: 71px !important
			}
			
			.completer-container,
			.pla {
				position: absolute;
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				box-sizing: border-box;
				padding: 0;
				margin: 0;
				font-family: inherit;
				font-size: 14px;
				line-height: normal;
				list-style: none;
				background-color: #fff;
				border: 1px solid #eee;
				border-radius: 3px;
			}
			
			.completer-container li,
			.pla li {
				padding: .5em .8em;
				margin: 0;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
				cursor: pointer;
				background-color: #fff;
				border-bottom: 1px solid #eee;
			}
			
			.completer-container .completer-selected,
			.completer-container li:hover,
			.pla .completer-selected {
				margin-left: -1px;
				background-color: #eee;
				border-left: 1px solid #ff5e23;
			}
			/*bootstrap*/
			
			.has-feedback {
				position: relative;
				clear: both
			}
			
			.has-feedback .form-control {
				float: left;
				width: 40%;
				padding-right: 42.5px;
				font-size: 15px;
				margin-bottom: 0;
			}
			
			.form-control-feedback {
				position: absolute;
				top: 0;
				right: 30%;
				z-index: 2;
				display: block;
				width: 34px;
				height: 34px;
				line-height: 34px;
				text-align: center;
				pointer-events: none
			}
			
			.has-success .help-block,
			.has-success .control-label,
			.has-success .radio,
			.has-success .checkbox,
			.has-success .radio-inline,
			.has-success .checkbox-inline,
			.has-success.radio label,
			.has-success.checkbox label,
			.has-success.radio-inline label,
			.has-success.checkbox-inline label {
				color: #3c763d
			}
			
			.has-success .form-control {
				border-color: #3c763d !important;
			}
			
			.has-success .form-control:focus {
				border-color: #2b542c;
			}
			
			.has-success .input-group-addon {
				color: #3c763d;
				border-color: #3c763d;
				background-color: #dff0d8
			}
			
			.has-success .form-control-feedback {
				color: #0da77d;
				font-size: 18px;
				font-weight: bold;
			}
			
			.has-error .help-block,
			.has-error .control-label,
			.has-error .radio,
			.has-error .checkbox,
			.has-error .radio-inline,
			.has-error .checkbox-inline,
			.has-error.radio label,
			.has-error.checkbox label,
			.has-error.radio-inline label,
			.has-error.checkbox-inline label {
				color: #a94442
			}
			
			.has-error .form-control {
				border-color: #a94442 !important;
			}
			
			.has-error .form-control:focus {
				border-color: #843534;
			}
			
			.has-error .input-group-addon {
				color: #a94442;
				border-color: #a94442;
				background-color: #f2dede
			}
			
			.has-error .form-control-feedback {
				color: #a94442
			}
			
			.has-feedback label~.form-control-feedback {
				top: 8px
			}
			
			.has-feedback label.sr-only~.form-control-feedback {
				top: 0
			}
			
			.help-block {
				display: block;
				clear: both;
				width: 40%;
				margin-left: 30%;
				margin-top: 5px;
				margin-bottom: 10px;
				color: #737373
			}
			
			.has-feedback .form-control.code-input {
				width: 152px
			}
			
			#codeGroup .form-control-feedback {
				left: 114px;
				top: 8px
			}
			/*loading*/
			
			.spinner {
				display: none;
				margin: 0 auto;
				width: 50px;
				text-align: center;
			}
			
			.spinner>div {
				width: 10px;
				height: 10px;
				background-color: #ffad69;
				border-radius: 100%;
				display: inline-block;
				-webkit-animation: bouncedelay 1.4s infinite ease-in-out;
				animation: bouncedelay 1.4s infinite ease-in-out;
				-webkit-animation-fill-mode: both;
				animation-fill-mode: both;
			}
			
			.spinner .bounce1 {
				-webkit-animation-delay: -0.32s;
				animation-delay: -0.32s;
			}
			
			.spinner .bounce2 {
				-webkit-animation-delay: -0.16s;
				animation-delay: -0.16s;
			}
			
			@-webkit-keyframes bouncedelay {
				0%,
				80%,
				100% {
					-webkit-transform: scale(0.0)
				}
				40% {
					-webkit-transform: scale(1.0)
				}
			}
			
			@keyframes bouncedelay {
				0%,
				80%,
				100% {
					transform: scale(0.0);
					-webkit-transform: scale(0.0);
				}
				40% {
					transform: scale(1.0);
					-webkit-transform: scale(1.0);
				}
			}
			
			.form-control-feedback {
				margin-right: 0;
				display: none
			}
			
			.has-success .form-control-feedback {
				display: block
			}
			
			.has-feedback #captcha_code {
				padding-right: 40px;
			}
			
			#loginSub:focus {
				background-color: #18bc9c;
				border-color: #18bc9c;
			}
			
			legend {
				text-align: center;
				color: #fff
			}
			/*注册*/
			
			.password-level {
				clear: both;
				width: 40%;
				margin: 0 auto;
			}
			
			.password-level .col-md-11 {
				padding-left: 0
			}
			
			.password-level .col-md-4 {
				width: 33.33%;
				float: left;
			}
			
			.password-level span {
				display: block;
				width: 100%;
				height: 3px;
				text-align: center;
				line-height: 0;
				font-size: 14px;
				font-weight: bold
			}
			
			#signPswLevel.password-level span,
			#fundPswLevel.password-level span {
				height: 16px;
				line-height: 16px;
				font-size: 12px;
				font-weight: bold
			}
			
			.discount {
				color: #ff5e23;
				margin: 10px 0 18px;
				font-weight: bold;
			}
			
			#signupSub {
				margin: 0 auto
			}
			
			.input-item-info {
				width: 30%;
				float: left
			}
			
			.code-box .form-control-feedback {
				right: auto;
				left: 114px;
				top: 8px;
			}
		</style>
		<script src="js/autoemail.js"></script>
		

		<div class="left_con_login">
			<div class="login_incontent login-con">

				<div class="right_mcontent clearfix">
					<div class="maichu">
						<div class="m_title">
							<h4>登录</h4></div>
						<div class="m_con rightlogin">
							<form role="form" id="loginForm" name="login" method="post" action="${ctx}/login">

								<div class="form-group parentCls has-feedback" id="emailGroup">
									<label for="email">用户名/邮箱</label>
									<div class="automail-list"></div>
									<input type="text" class="form-control inputElem" name="loginId" id="email" value="">
									<span class="glyphicon glyphicon-ok form-control-feedback"></span>
									<span class="help-block"></span>
								</div>

								<div class="form-group has-feedback" id="pswGroup">
									<label for="password">登录密码</label>
									<input type="password" class="form-control" name="password" id="password" autocomplete="new-password">
									<div class="input-item-info">
										<a href="/resetpw" style="line-height: 48px;margin-left: 5px;">忘记密码？</a>
									</div>
									<span class="help-block"></span>
								</div>
								<div class="form-group has-feedback clearfix" id="codeGroup">
									<label for="captcha_code">图片验证码</label>
									<div class="clearfix code-box">
										<input type="text" class="form-control code-input" name="captcha" id="captcha_code" maxlength="8" autocomplete="off">
										<div id="code"><img class="cap-img" id="loginCaptcha" src="${ctx}/imgCode" alt="Captcha" title="看不清？换一张" onclick="document.getElementById('loginCaptcha').src = '${ctx}/imgCode?' + Math.random(); return false" /></div>
										<span class="help-block"></span>
									</div>
								</div>

								<div class="form-group" id="ipGroup">
									<label for="iprestriction" style="user-select: none;">安全选项</label>
									<div class="pull-left" style="margin-top: 0px">
										<label class="haschecked pull-left" style="width: auto;user-select: none;">
							<input  class="form-control" type="checkbox" name="iprestriction" id="iprestriction" value='1' checked> 绑定到IP地址 <span class=red>（为保证账号安全如非动态IP切勿去选！）</span>
						</label>
									</div>
									<span class="help-block"></span>
								</div>

								<button type="submit" class="btn btn-error btn-block sub-btn" id="loginSub"><span>登录</span>
						<div class="spinner">
							<div class="bounce1"></div>
							<div class="bounce2"></div>
							<div class="bounce3"></div>
						</div>
					</button>
								<p class="red"><i id="dpIcon">!</i>提醒：谨防骗子，切勿泄露密码给任何人，官方从不会向用户询问密码。</p>
								<span class="errmsg" id='errmsg'></span>
							</form>
						</div>
						<!-- login -->
					</div>

					<div class="mairu">
						<div class="m_title">
							<h4>注册</h4></div>
						<div class="m_con_buy leftregi">
							<form role="form" id="signupForm" name="signup" method="post" action="${pageContext.request.contextPath}/api/v1/user/userPhoneRegister.html">
								<input type="hidden" name="ref_uid" id="ref_uid" value="" />
								<input type="hidden" name="language" id="language" value="cn" />
								<div>
									<div class="form-group parentCls has-feedback" id="signup_userNameGroup">
										<label for="sig_email">用户名</label>
										<input type="text" class="form-control" name="nickname" id="sig_userName" value="" autocomplete="off">
										<div class="input-item-info"><span class="r-tip">(字母或字母与数字组合)</span></div>
										</span><span class="glyphicon glyphicon-ok form-control-feedback"></span> <span class="help-block"></span>
									</div>
								</div>
								<div>
									<div class="form-group has-feedback" id="signup_pswGroup">
										<label for="sig_password">登录密码</label>
										<input type="password" name="password" class="form-control" id="sig_password" autocomplete="new-password">
										<div class="input-item-info"><span class="r-tip">(至少6位字符，非纯数字)</span></div><span class="glyphicon glyphicon-ok form-control-feedback"></span>
										<div class="password-level hide clearfix" id="signPswLevel">
											<div class="col-md-4"><span id="loWeak">弱</span></div>
											<div class="col-md-4"><span id="loNormal">中</span></div>
											<div class="col-md-4"><span id="loStrong">强</span></div>
										</div>
										<span class="help-block"></span>
									</div>
								</div>
								<div>
									<div class="form-group has-feedback" id="signup_repswGroup">
										<label for="sig_password">确认登录密码</label>
										<input type="password" name="repassword" class="form-control" id="sig_repassword" autocomplete="new-password">
										<span class="glyphicon glyphicon-ok form-control-feedback"></span>
										<span class="help-block"></span>
									</div>
								</div>
								<div>
									<div class="form-group parentCls has-feedback" id="signup_emailGroup">
										<label for="sig_email">邮箱</label>
										<input type="eamil" class="form-control" name="email" id="sig_email" value="" autocomplete="off">
										<div class="input-item-info"><span class="r-tip">(邮箱用于验证，请填写您的常用邮箱)</span></div>
										</span><span class="glyphicon glyphicon-ok form-control-feedback"></span> <span class="help-block"></span>
									</div>
								</div>
								<div>
									<div class="form-group has-feedback" id="fund_pswGroup">
										<label for="fund_password">资金密码</label>
										<input type="password" name="fundpass" class="form-control" id="fund_password" autocomplete="new-password">
										<div class="input-item-info"><span class="r-tip">(用于提现，请牢记。不可与登录密码相同)</span></div><span class="glyphicon glyphicon-ok form-control-feedback"></span>
										<span class="help-block"></span>
									</div>
								</div>
								<div>
									<div class="form-group has-feedback" id="fund_repswGroup">
										<label for="fund_password">确认资金密码</label>
										<input type="password" name="refundpass" class="form-control" id="fund_repassword" autocomplete="new-password">
										<span class="glyphicon glyphicon-ok form-control-feedback"></span>
										<span class="help-block"></span>
									</div>
								</div>
								<div class="form-group has-feedback" id="signup_codeGroup">
									<label for="captcha_code">图片验证码</label>
									<div class="clearfix code-box">
										<input type="text" class="form-control code-input" name="captcha" id="captcha_reg" maxlength="8" autocomplete="off">
										<div id="codeReg"><img class="cap-img" id="regCaptcha" src="/captcha_reg" alt="Captcha" title="看不清？换一张" onclick="resetCode();document.getElementById('regCaptcha').src = '/captcha_reg?' + Math.random(); return false" /></div>
										<div class="input-item-info"></div>
										<span class="help-block"></span>
									</div>
								</div>
								<div class="checkbox clearfix">
									<label id="agrCheckLabel" class="haschecked pull-left">
							<input  class="form-control pull-left" type="checkbox" name="agreeCheck" id="agreeCheck" value='1' checked>
							<span id="agrTxt" class="pull-left">我已阅读并同意</span>
						</label>
									<a class="pull-left" target=_blank href='/docs/agreement.pdf'>《用户使用协议》</a>
								</div>
								<button type="button" class="btn btn-error btn-block sub-btn" id="signupSub"><span>立即注册</span>
						<div class="spinner">
							<div class="bounce1"></div>
							<div class="bounce2"></div>
							<div class="bounce3"></div>
						</div>
					</button>
								<div class="login-tip">
									<p></p>
								</div>
							</form>
							<div style="clear:both"></div>
						</div>
						<!-- signup -->
					</div>

				</div>
			</div>

		</div>

		<script>
			function boxLayout() {
				var leftH = $(".leftregi").height();
				$(".rightlogin").css("height", leftH);
			}
			boxLayout();
			$(window).resize(function() {
				boxLayout()
			});

			//重置图片验证码
			function resetCode() {
				$("#captcha_code").val("");
				$("#codeGroup").removeClass("has-error").removeClass("has-success");
				$("#codeGroup").find(".help-block").text("");
			}

			function loadshow(targetDom) {
				targetDom.find("span").hide();
				targetDom.find(".spinner").show();
			}

			function loadhide(targetDom) {
				targetDom.find("span").show();
				targetDom.find(".spinner").hide();
			}
			//重置表单
			function resetForm(formID) {
				document.getElementById(formID).reset();
			}

			//自动邮箱
			var mailAddr = ["", "@qq.com", "@163.com", "@126.com", "@sina.com", "@gmail.com", "@hotmail.com", "@aliyun.com", "@sohu.com"],
				mailAddr1 = ["@qq.com", "@163.com", "@126.com", "@sina.com", "@gmail.com", "@hotmail.com", "@aliyun.com", "@sohu.com"];
			var mailTarget;

			function mailinput(mailTarget, mAddr) {
				mailTarget.on('input propertychange', function() {
					mailTarget.completer({
						separator: '',
						source: mAddr,
						zIndex: 1051
					}); //渲染启动自动邮箱
				});
				mailTarget.on("keyup", function(e) { //email input回车填第一个数据
					var theEvent = e || window.event;
					var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
					if(code == 13) {
						setTimeout(function() {
							mailTarget.parent().removeClass("has-error").addClass("has-success");
							mailTarget.parent().find(".help-block").text('');
						}, 100);
						mailTarget.parent().parent().next().find("input").focus()
					}
				});

				mailTarget.on("keydown", function(e) { //email input tab键
					var theEvent = e || window.event;
					var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
					if(code == 9) {
						$(".completer-container").hide();
					}
				});
			}

			function addErr(target) { //添加错误样式
				$(target).addClass("has-error").removeClass("has-success");
			}

			function addSucc(target) { //添加成功样式
				$(target).removeClass("has-error").addClass("has-success");
			}

			function printTip(target, tipText) { //输出表单提示
				$(target).find(".help-block").text(tipText);
				boxLayout();
			}

			$(function() {

				var mailVal = $("#sig_email").val(),
					mail_test = /^([a-zA-Z0-9\._-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
				if(!mail_test.test(mailVal)) {
					$("#sig_email").val("")
				}

				//login form focus
				$('#loginForm,#signupForm').find("input").focus(function() {
					$(this).next(".input-icon").addClass("focus-ico");
					$("#errmsg").text("");
					loadhide($("#loginSub"))
				}).blur(function() {
					$(this).next(".input-icon").removeClass("focus-ico");
				});

				//登录验证
				function emailcheck() {
					var eVal = $("#email").val();
					if(eVal == '') {
						addErr("#emailGroup");
						printTip("#emailGroup", "请输入您的用户名或邮箱！");
						loadhide($("#loginSub"))
					} else {
						addSucc("#emailGroup");
						printTip("#emailGroup", "");
						loadhide($("#loginSub"));
						return true;
					}
				}

				function pswcheck() {
					//return true;
					var eVal = $("#password").val(),
						eVlength = eVal.length;

					if(eVlength == 0) { //密码为空
						addErr("#pswGroup");
						printTip("#pswGroup", "请输入您的登录密码！");
						loadhide($("#loginSub"));
						$("#loginPswLevel").addClass("hide");
					} else {
						if(eVlength > 0 && eVlength < 6) { //大于0小于6位
							addErr("#pswGroup");
							printTip("#pswGroup", "登录密码不正确，请重新输入！");
						} else { //大于6位
							addSucc("#pswGroup");
							printTip("#pswGroup", "");
							return true;
						}
					}

				}

				function codecheck() {
					var eVal = $("#captcha_code").val(),
						vNum = eVal.length;
					if(eVal == '') {
						var codeShow = $("#codeGroup").is(":visible");
						if(codeShow) {
							addErr("#codeGroup");
							printTip("#codeGroup", "请输入图片验证码！");
						} else {
							$("#captcha_code").val("deflt")
						}
						loadhide($("#loginSub"))
					} else {
						if(vNum == 5) {
							addSucc("#codeGroup");
							printTip("#codeGroup", "");
							return true;
						} else {
							addErr("#codeGroup");
							printTip("#codeGroup", "图片验证码不正确，请重新输入！");
							loadhide($("#loginSub"))
						}

					}
				}

				$("#email").blur(emailcheck).focus(function() {
					//var mailTarget=$(this),mAddr=mailAddr;
					if(!(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE8.0")) {
						//mailinput(mailTarget,mAddr);
					}
				});

				$("#password").blur(pswcheck).focus(function() {
					var mailVal = $("#email").val();
					if(mailVal != '') {
						emailcheck()
					}
				});

				$("#captcha_code").blur(codecheck);

				//登录
				$("#loginSub").click(function() { //点击提交按钮开始
					$(this).blur();
					loadshow($(this));
					if(emailcheck()) { //只填邮箱
						pswcheck();
						codecheck()
					}
					if(pswcheck()) { //只填密码
						emailcheck();
						codecheck()
					}
					if(codecheck()) { //只填验证码
						emailcheck();
						pswcheck()
					}
					if(pswcheck() && codecheck()) { //未填邮箱
						emailcheck()
					}
					if(emailcheck() && codecheck()) { //未填密码
						pswcheck()
					}
					if(emailcheck() && pswcheck()) { //未填验证码
						codecheck()
					}
					if(emailcheck() && pswcheck() && codecheck()) { //表单验证成功

						$("#loginForm").submit()
					} else { //表单验证失败
						emailcheck();
						pswcheck();
						codecheck();
					}
				}); //点击提交按钮结束

				$("#password,#captcha_code").on('focus', function() { //激活enter键
					eDom = $(this), tDom = $("#loginSub");
					pressEnter(eDom, tDom);
				});
				$("#checkRem").on('click', function() { //激活enter键
					eDom = $(this), tDom = $("#loginSub");
					pressEnter(eDom, tDom);
				});

			});

			function pressEnter(eDom, tDom) { //监听回车
				eDom.on('keyup', function(e) {
					var theEvent = e || window.event;
					var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
					if(code == 13) {
						tDom.click();
					}
				});
			}

			function passwordLevel(password) {
				var Modes = 0;
				for(i = 0; i < password.length; i++) {
					Modes |= CharMode(password.charCodeAt(i));
				}
				return bitTotal(Modes);
				//CharMode函数
				function CharMode(iN) {
					if(iN >= 48 && iN <= 57) //数字
					{
						return 1;
					}
					if(iN >= 65 && iN <= 90) //大写字母
					{
						return 2;
					}
					if((iN >= 97 && iN <= 122) || (iN >= 65 && iN <= 90)) //大小写
					{
						return 4;
					} else {
						return 8;
					} //特殊字符
				}

				//bitTotal函数
				function bitTotal(num) {
					modes = 0;
					for(i = 0; i < 4; i++) {
						if(num & 1) modes++;
						num >>>= 1;
					}
					return modes;
				}
			}

			$("#sig_password").focus(function() {
				$("#signPswLevel").removeClass("hide")
			});
			$("#fund_password").focus(function() {
				$("#fundPswLevel").removeClass("hide")
			});

			//注册表单验证
			function signUserNameCheck() { //用户名验证
				//return true;
				var nameVal = $("#sig_userName").val();
				if(nameVal == '') {
					addErr("#signup_userNameGroup");
					printTip("#signup_userNameGroup", "请创建一个用户名！");
					loadhide($("#signupSub"));
				} else if(nameVal.length < 3) {
					addErr("#signup_userNameGroup");
					printTip("#signup_userNameGroup", "用户名太短！");
					loadhide($("#loginSub"))
				} else if(nameVal.length > 24) {
					addErr("#signup_userNameGroup");
					printTip("#signup_userNameGroup", "用户名太长，请勿超过24字符！");
					loadhide($("#loginSub"))
				} else {
					if(isNaN(nameVal)) {
						addSucc("#signup_userNameGroup");
						printTip("#signup_userNameGroup", "");
						loadhide($("#loginSub"));
						return true;
					} else {
						addErr("#signup_userNameGroup");
						printTip("#signup_userNameGroup", "用户名不能使用纯数字！");
						loadhide($("#loginSub"))
					}

				}
			}

			function signEmailCheck() { //账邮箱验证
				//return true;
				var eVal = $("#sig_email").val();
				if(eVal == '') {
					addErr("#signup_emailGroup");
					printTip("#signup_emailGroup", "请输入您的常用邮箱！");
					loadhide($("#signupSub"));
				} else {
					var reg_mail = /^([a-zA-Z0-9\._-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
					if(reg_mail.test(eVal)) {
						addSucc("#signup_emailGroup");
						printTip("#signup_emailGroup", "");
						return true;
					} else {
						addErr("#signup_emailGroup");
						printTip("#signup_emailGroup", "邮箱格式不正确，请检查后重新输入！");
						loadhide($("#signupSub"))
					}
				}
			}
			//重置注册图片验证码
			function resetCode() {
				$("#captcha_reg").val("");
				$("#signup_codeGroup").removeClass("has-error").removeClass("has-success");
				printTip("#signup_codeGroup", "");
			}

			function signPswCheck() { //登录密码验证
				//return true;
				var sVal = $("#sig_password").val(),
					sVlength = sVal.length,
					signLvl = passwordLevel(sVal);

				if(sVlength == 0) { //登录密码为空
					addErr("#signup_pswGroup");
					printTip("#signup_pswGroup", "请输入一个登录密码！");
					loadhide($("#signupSub"));
					$("#signPswLevel").addClass("hide");
				} else {
					var tipWords = $("#signup_pswGroup").find(".help-block").text().length,
						checkOk = $("#signup_pswGroup").hasClass("has-success");
					if(sVlength > 0 && sVlength < 6) { //大于0小于6位
						printTip("#signup_pswGroup", "登录密码太简单！");
						addErr("#signup_pswGroup");
						if(tipWords == 26 || checkOk) {
							printTip("#signup_pswGroup", "登录密码需至少6位！");
						}
						$("#signPswLevel").removeClass("hide");
						$("#loWeak").css("background-color", "#ff4c50");
						$("#loNormal,#loStrong").css("background", "none");
					} else { //大于6位
						if(signLvl == 2) { //中
							addSucc("#signup_pswGroup");
							printTip("#signup_pswGroup", "");
							$("#loWeak,#loNormal").css("background-color", "#f90");
							$("#loStrong").css("background", "none");
							return true
						} else if(signLvl >= 3) {
							if(sVlength > 8) { //强
								addSucc("#signup_pswGroup");
								printTip("#signup_pswGroup", "");
								$("#loWeak,#loNormal,#loStrong").css("background-color", "#00c100");
								return true
							} else { //中
								addSucc("#signup_pswGroup");
								printTip("#signup_pswGroup", "");
								$("#loWeak,#loNormal").css("background-color", "#f90");
								$("#loStrong").css("background", "none");
								return true
							}
						} else {
							if(tipWords > 1 || checkOk) {
								addErr("#signup_pswGroup");
								printTip("#signup_pswGroup", "至少6位，且为数字、字母、符号的任意2种或以上组合！");
							}
							$("#loWeak").css("background-color", "#ff4c50");
							$("#loNormal,#loStrong").css("background", "none");
						}
					}
				}
			}

			function signRePswCheck() {
				if($("#sig_repassword").val() != $("#sig_password").val()) {
					addErr("#signup_repswGroup");
					printTip("#signup_repswGroup", "输入密码不一致！");
					return false;
				}
				addSucc("#signup_repswGroup");
				printTip("#signup_repswGroup", "");
				return true;
			}
			$("#sig_repassword").blur(function() {
				signRePswCheck();
			});

			function fundPswCheck() { //资金密码验证
				//return true;
				var sVal = $("#fund_password").val(),
					sVlength = sVal.length;
				if(sVlength == 0) { //密码为空
					addErr("#fund_pswGroup");
					printTip("#fund_pswGroup", "请输入一个资金密码！");
					loadhide($("#signupSub"));
				} else {
					//var tipWords=$("#fund_pswGroup").find(".help-block").text().length,
					var checkOk = $("#fund_pswGroup").hasClass("has-success");
					if(sVlength > 0 && sVlength < 6) { //大于0小于6位
						//if (tipWords==26 || checkOk){
						addErr("#fund_pswGroup");
						printTip("#fund_pswGroup", "资金密码需至少6位！");
						//}
					} else { //大于6位
						addSucc("#fund_pswGroup");
						printTip("#fund_pswGroup", "");
						return true
					}
				}
			}

			function fundRePswCheck() {
				if($("#fund_repassword").val() != $("#fund_password").val()) {
					addErr("#fund_repswGroup");
					printTip("#fund_repswGroup", "输入密码不一致！");
					return false;
				}
				addSucc("#fund_repswGroup");
				printTip("#fund_repswGroup", "");
				return true;
			}
			$("#fund_repassword").blur(function() {
				fundRePswCheck();
			});

			function signCodeCheck() { //图片验证码验证
				var eVal = $("#captcha_reg").val(),
					vNum = eVal.length;
				if(eVal == '') {
					addErr("#signup_codeGroup");
					printTip("#signup_codeGroup", "请输入图片验证码！");
					loadhide($("#signupSub"));
				} else {
					if(vNum == 5) {
						addSucc("#signup_codeGroup");
						printTip("#signup_codeGroup", "");
						return true;
					} else {
						addErr("#signup_codeGroup");
						printTip("#signup_codeGroup", "图片验证码错误！");
						loadhide($("#signupSub"));
					}

				}
			}

			function clearPsw(elm) {
				var psws = $(elm),
					sigPswLen = psws.val().length;
				if(sigPswLen == 32) {
					psws.val('');
					psws.parents("div").removeClass("has-success")
				}
			}
			$("#sig_email").blur(signEmailCheck).focus(function() {
				var mailTarget = $(this),
					mAddr = mailAddr1;
				if(!(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE8.0")) {
					mailinput(mailTarget, mAddr);
				}
			});
			$("#sig_userName").blur(signUserNameCheck);

			$("#sig_password").blur(function() {
				signPswCheck();
			}).on('input propertychange', function() {
				signPswCheck()
			}).focus(function() {
				clearPsw("#sig_password")
			});
			$("#fund_password").blur(function() {
				fundPswCheck();
			}).on('input propertychange', function() {
				fundPswCheck()
			}).focus(function() {
				clearPsw("#fund_password")
			});
			$("#captcha_reg").blur(signCodeCheck);

			var agr = $("#agrCheckLabel"),
				signSub = $("#signupSub");
			agr.click(function() { //同意用户协议按钮
				if($("#agreeCheck").prop("checked")) {
					signSub.attr("disabled", false);
				} else {
					signSub.attr("disabled", true);
				}
			});

			$("#signupSub").click(function() {
				loadshow($(this));
				if(signUserNameCheck() && signPswCheck() && signRePswCheck() && signEmailCheck() &&
					fundPswCheck() && fundRePswCheck() && signCodeCheck()) { //验证成功提交
					$('#signupForm').submit();
				} else { //表单验证失败
					loadhide($(this));
				}
			});
		</script>

		<script>
			//force user to use https
			// if ('https:' != document.location.protocol) { window.location = 'https://' + window.location.hostname + window.location.pathname; }

			//for footer
			var tier_next_progress = '';

			$("#usdtAll").text(toThousands(0));
			$("#btcAll").text(toThousands(0));
			$("#ltcAll").text(toThousands(0));
			$("#ethAll").text(toThousands(0));
			is_login = '' != '';
		</script>
		<script src="/js/footer.js?v=0420"></script>

	</body>

</html>