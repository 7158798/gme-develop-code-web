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
				<div class="header_dengluhou">
					<ul>
						<li>
							<a href="#" class="whate">19019382@qq.com<i></i></a>
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
		<div class="L_34">
			<div class="L_35">
				<ul>
					<li class="L_37">
						<img src="img/L_5.png" /> 我的资金
					</li>
					<li class="L_38 action_38">
						<a>账户资金</a>
					</li>
					<li class="L_38">
						<a>推广佣金</a>
					</li>
					<li class="L_38">
						<a>账单明细</a>
					</li>
					<li class=" L_37 ">
						<img src="img/L_4.png" /> 交易挂单
					</li>
					<li class="L_38 ">
						<a>我的挂单</a>
					</li>
					<li class="L_38 ">
						<a>成交记录</a>
					</li>
					<li class="L_38">
						<a>C2C成交记录</a>
					</li>
					<li class="L_37">
						<img src="img/L_3.png" /> 充值提现
					</li>
					<li class="L_38">
						<a>购买USDT(C2C)</a>
					</li>
					<li class="L_38">
						<a>充值记录</a>
					</li>
					<li class="L_38">
						<a>提现记录</a>
					</li>
					<li class="L_38">
						<a>钱包管理地址</a>
					</li>
				</ul>
			</div>
			<div class="L_36">
				<div class="L_39" style="border-bottom: 1px solid #E6EAF0;">
					USDT充值
				</div>
				<div class="L_49">
					<div class="L_57">
						<p style="margin-bottom: 14px;margin-top: 10px;font-size: 15px;color: #152137;">提现到钱包地址</p>
						<p style="margin-bottom: 8px;font-size: 15px;color: #152137;">提币地址：</p>
						<div class="L_58">
							<input type="text" placeholder="请输入地址" onchange="$('#L_63').css('display', 'none');" oninput="$('#L_63').css('display', 'block');" />
							<input type="button" value="现有地址" onclick="if($('#L_62').css('display')=='block'){$('#L_62').css('display', 'none');}else{ $('#L_62').css('display', 'block');}" /><i></i>
							<div class="L_63" id="L_63">
								<a style="position: relative;top: 0px;"><img src="img/L_9.png" />添加新地址</a>
							</div>
							<div class="L_62" id="L_62">
								<table class="L_64">
									<tbody>
										<tr>
											<td>sdfasdfdasfasdfasdfdfadasfasasdfasdf</td>
											<td>火币地址</td>
										</tr>
										<tr>
											<td>sdfasdfdasfasdfasdfdfadasfasasdfasdf</td>
											<td>火币地址</td>
										</tr>
										<tr>
											<td>sdfasdfdasfasdfasdfdfadasfasasdfasdf</td>
											<td>火币地址</td>
										</tr>
										<tr>
											<td>sdfasdfdasfasdfasdfdfadasfasasdfasdf</td>
											<td>火币地址</td>
										</tr>
										<tr>
											<td>sdfasdfdasfasdfasdfdfadasfasasdfasdf</td>
											<td>火币地址</td>
										</tr>
									</tbody>
								</table>
								<p>
									<a style="color: #347ddd;font-size: 15px;"><img src="img/L_9.png" />添加新地址</a>
								</p>
							</div>
						</div>
						<p style="margin-bottom: 12px;">提币数量：</p>
						<div class="L_58">
							<input type="text" />
							<span style="float: right;display: inline-block;margin-right: 10px;">USDT</span>
						</div>
						<div class="L_59">
							<div class="L_60">
								<p>手续费：</p>
								<input type="text" maxlength="20" />
								<span style="position: relative;top: -40px;left: 390px;	">USDT</span>
								<p>资金密码：</p>
								<input type="text" maxlength="30" placeholder="请输入资金密码"  />
							</div>
							<div class="L_61">
								<p>手续费：</p>
								<input type="text" style="width: 425px;" />
								<span style="position: relative;top: -40px;left: 386px;	">USDT</span>
								<input style="margin-top: 36px;background: #347ddd;color: #FFFFFF;font-size: 15px;" type="button" value="提币" onclick="$('#L_65').css('display','block')"  />
							</div>
						</div>
						<p style="margin-bottom: 20px;margin-top: 34px;">温馨提示</p>
						<p style="font-size: 14px;color: #5c5c66;">最小提币数量为200 USDT</p>
						<p style="font-size: 14px;color: #5c5c66;">为保障资金安全，当您账户安全策略变更，密码修改，使用新地址提币，我们会对提币进行人工审核，请耐心等待。</p>
					</div>
					<div class="L_49" style="width: 100%;">
						<div class="L_50" style="margin-top: 30px;">
							<span style="font-size: 15px;color: #152137;float: left;">最近充值记录</span>
							<span style="font-size: 15px;color: #152137;float: right;"><a>更多</a></span>
						</div>
						<div class="L_51">
							<table class="L_40" style="width: 100%;">
								<tr>
									<th>时间</th>
									<th>数量</th>
									<th>TX ID</th>
									<th>状态</th>
									<th>交易ID</th>
								</tr>
								<tr>
									<td>2018-06-29 16:13:00</td>
									<td>1314.00000000</td>
									<td>dfasdsfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasd</td>
									<td>
										成功
									</td>
									<td>
										20180702
									</td>
								</tr>
								<tr>
									<td>2018-06-29 16:13:00</td>
									<td>1314.00000000</td>
									<td>dfasdsfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasd</td>
									<td>
										成功
									</td>
									<td>
										20180702
									</td>
								</tr>
								<tr>
									<td>2018-06-29 16:13:00</td>
									<td>1314.00000000</td>
									<td>dfasdsfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasd</td>
									<td>
										成功
									</td>
									<td>
										20180702
									</td>
								</tr>
							</table>
						</div>
						<p style="margin-top: 56px;margin-bottom: 56px;color: #152137;font-size: 13px;">当前服务器时间：2018-07-02 09:42:42</p>
					</div>
				</div>
			</div>
		</div>
		<!--
        	弹窗
        -->
		<div class="L_65" id="L_65">
			<div class="L_66">
				<div class="L_67">
					提币验证
					<img src="img/L_10.png" style="position: relative;top: -22px;right: -300px;cursor:pointer;" onclick="$('#L_65').css('display','none')" />
				</div>
				<div class="L_68">
					<span style="margin-top: 50px;display: inline-block;">短信验证码：</span>
					<input type="text" style="padding-left: 10px;border-radius: 3px;border: 1px solid #E6EAF0;width: 298PX;height: 50px;line-height: 50px;" />
					<input type="button" value="获取短信验证" style="margin-left: 16px;width: 128px;height: 50px;line-height: 50px;font-size: 15px;color: #5b88b2;border: 1px solid #8FA8c8;background: #FFFFFF;border-radius: 3px;" />
					<br  />
					<span style="margin-top: 50px;display: inline-block;">邮箱验证码：</span>
					<input type="text" style="padding-left: 10px;border-radius: 3px;border: 1px solid #E6EAF0;width: 298PX;height: 50px;line-height: 50px;" />
					<input type="button" value="获取邮箱验证"  style="margin-left: 16px;width: 128px;height: 50px;line-height: 50px;font-size: 15px;color: #5b88b2;border: 1px solid #8FA8c8;background: #FFFFFF;border-radius: 3px;" />
					<br />
					<input type="button" value="确认" style="position: relative;right: -42px;border: 0px;border-radius: 3px;color: #FFFFFF;font-size: 15px;margin-top: 26px;width: 460px;height: 50px;line-height: 50px;background: #347ddd;" />
				</div>
			</div>
		</div>
		<!-- footer -->
		<script>
			function xdz() {
				$("#L_63").css("display", "block");
			}
		</script>
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