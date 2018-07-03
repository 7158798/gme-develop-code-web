<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath }${fns:getAdminPath()}/user"/>
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
							<span class="zyw" >中文版</span>
							<%-- <a href="javascript:changeLang('en_US');" ><fmt:message key="lange.msg1"></fmt:message></a> --%>
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
		<div class="L_1" style="height: 840px;">
			<div class="L_2">
				<div class="L_3">
					<p class="L_5">欢迎登录</p>
					<p class="L_9" style="margin-top: 60px;">账号</p>
						<div class="L_10">
							<input id="dlzhanghao" class="L_22" type="text" />
						</div>
					<p class="L_9">密码</p>
					<input type="password" id="password" class="L_15" />
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
					<input type="button" id="" onclick="dlsc()" value="登陆" class="L_20" style="margin-top: 40px;" />
					<a href="zhucheyemian.html" class="L_23">免费注册</a>
					<a href="chongzhimimayemian.html" class="L_23" style="float: right;">忘记密码</a>
				</div>
				<div class="L_4" style="margin-top: 160px;">
					<p class="L_21" style="margin-bottom: 6px;">还不是GME的用户？</p>
					<p class="L_21"><a href="zhucheyemian.html">立即注册</a>，在全球领先的数字资产交易平台开始交易。</p>
				</div>
				<script>
					function dlsc() {
						var redirectUrl = "${redirect}";
						var teb = $("#dlzhanghao").val(),
							em = $("#password").val();
							$.ajax({
								type: 'POST',
								url: "http://192.168.0.148:8080/gme-web/api/v1/user/login.json",
								data: "loginId=" + teb + "&password=" + em,
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
									}
									if (data.code == 205){
										window.location.href="http://192.168.0.148:8080/gme-web/secondLogin.html?redirect=" + redirectUrl;
										return;
									}if (data.code == 444) {
										alert(data.message);
										return;
									}
									else {
										alert(data.message);
										window.location.reload();
										return;
									}
									
								}
							});
						
					}
				</script>
				<script type="text/javascript">
					function changeLang(lang){
						var url = "http://192.168.0.148:8080/gme-web/changeLang.html?lang="+lang;
						$.getJSON(url, function(data) {
				    		location.reload();
						},'json');
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