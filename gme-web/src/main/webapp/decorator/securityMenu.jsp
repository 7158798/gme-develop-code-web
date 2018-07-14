<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
<title><sitemesh:write property='title' /></title>
<sitemesh:write property='head' />
</head>
<body>

	<div class="header">
		<div class="header_1">
			<div class="logo">
				<a> <img src="img/dblg.png" />
				</a>
			</div>
			<div class="header_daohang">
				<ul>
					<li><a href="index.html">首页</a></li>
					<li><a href="c2cTrans.html">C2C交易</a></li>
					<li><a href="bbTrans.html">币币交易</a></li>
					<li><a href="accounts.html">我的财务</a></li>
					<li><a href="securityLog.html">安全设置</a></li>
					<li><a href="notice.html">公告</a></li>
					<li><a href="myWorkList.html">提交工单</a></li>
				</ul>
			</div>
		</div>
		<div class="header_2">
			<div class="header_dengluhou">
				<ul>
					<li><a href="#" class="whate">19019382@qq.com<i></i></a></li>
					<li><span class="zyw">中文版</span>
						<div class="yybb">
							<a href="#">ENGLISH</a> <a href="#">한국어</a>
						</div></li>
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
        <div class="L_34">
			<div class="L_35">
				<ul>
					<li class="L_37">
						<img src="img/L_31.png" /> 安全设置
					</li>
					<li class="L_38">
						<a href="realNameAuth.html">身份认证</a>
					</li>
					<li class="L_38">
						<a href="bindPhone.html">手机绑定</a>
					</li>
					<li class="L_38">
						<a href="secondLoginProtect.html">两步登录保护</a>
					</li>
					<!-- <li class="L_38 ">
						<a href="api.html">API Keys</a>
					</li> -->
					<li class="L_38 ">
						<a href="resetPassword.html">修改登录密码</a>
					</li>
					<li class="L_38">
						<a href="bindEmail.html">邮箱绑定</a>
					</li>
					<li class="L_38">
						<a href="withdrawDoubleValida.html">提币双重验证</a>
					</li>
					<li class="L_38">
						<a href="paySetting.html">支付设置</a>
					</li>
					<li class="L_38">
						<a href="securityLog.html">安全日志</a>
					</li>
				</ul>
			</div>
			
			<sitemesh:write property='body' />
		</div>
		<div class="footer">
			<div class="aqgxfw_30">
				<div class="aqgxfw_31">
					<div class="aqgxfw_32">
						<img src="img/dblg.png" /> <img src="img/QQ@@2x.png"
							style="margin: 28px 6px 5px 0px;" /> <img src="img/微信@@2x.png"
							style="margin: 28px 0px 5px 0px;" /> <img src="img/新浪@@2x.png"
							style="margin: 28px 10px 5px 6px;" /> <img
							src="img/1111@@2x.png" style="margin: 6px 0px 5px 0px;" /> <img
							src="img/2222@@2x.png" style="margin: 6px 10px 5px 6px;" />
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
				<div class="aqgxfw_37">Copyright © 2017-GMEBTC All Rights
					Resrved</div>
			</div>
		</div>
</body>
</html>
