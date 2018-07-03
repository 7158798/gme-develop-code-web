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
		<div class="L_72">
			<div class="L_73">
				<ul>
					<li style="background: none;"></li>
					<li>
						<img src="img/L_11.png" />USDT/CNY&nbsp;&nbsp;<span>USDT/人民币</span>
						<img src="img/L_19.png" />
					</li>
				</ul>
			</div>
			<div class="L_74">
				<div class="L_75">
					<p><img src="img/L_12.png" />&nbsp;&nbsp;<span>USDT/CNY</span></p>
					<p>
						<span>实时价:</span>
						<span style="font-size: 14px;color: #5c5c66;font-weight: 600;">¥6.63</span>&nbsp;&nbsp;
						<span>日涨跌:</span>
						<span style="font-size: 14px;color: #f05d5d;font-weight: 600;">+1.99%↑</span>&nbsp;&nbsp;
						<span>最高价:</span>
						<span style="font-size: 14px;color: #5c5c66;font-weight: 600;">¥6.88</span>&nbsp;&nbsp;
						<span>最低价:</span>
						<span style="font-size: 14px;color: #5c5c66;font-weight: 600;">¥6.50</span>
					</p>
				</div>
				<div class="L_76">
					<div class="L_81">
						<p>买入USDT</p>
						<p style="margin-bottom: 16px;">
							<a href="#">如何买入？</a>
						</p>
						<p style="margin-bottom: 10px;">
							<span>买入价格CNY</span>
							<span>6.64</span>
						</p>
						<div class="L_81_1">
							<span>买入量USDT</span>
							<input type="text" />
						</div>
						<div class="L_81_2">
							<span>金额</span>
							<input type="text" />
						</div>
						<div class="L_81_3">
							<div class="L_81_4">
								<span>最小限额</span>
								<input type="text" />
							</div>
							<div class="L_81_5">
								<span>最大限额</span>
								<input type="text" />
							</div>
						</div>
						<p style="font-size: 14px;color: #5c5c66;margin-bottom: 20px;">
							<span style="margin-right: 6px;">支付方式</span><img src="img/L_19.png" style="margin-right: 10px;" />
							<span style="margin-right: 6px;">支付宝</span><input type="Checkbox" />
							<span style="margin-right: 6px;">微信</span><input type="Checkbox" />
							<span style="margin-right: 6px;">银行转账</span><input type="Checkbox" />
							<span>(必须本人支付)</span>
							<a href="#">《交易须知》</a>
						</p>
						<input type="button" value="买入(CNY-USDT)" style="border-radius: 3px;color: #FFFFFF;height: 40px;width: 90%;border: 0px;background: #f05d5d;" />
					</div>
					<div class="L_82">
						<p>卖出USDT&nbsp;&nbsp;&nbsp;(USDT余额<span>0.00000</span>)</p>
						<p style="display: inline-block;width: 90%;margin-bottom: 16px;">
							<a href="#" style="float: left;">如何卖出？</a>
							<a href="#" style="float: right;color: #5c5c66;">USDT提现</a>
							<a href="#" style="float: right;margin-right: 30px;color: #5c5c66;">USDT充值</a>
						</p>
						<p style="margin-bottom: 10px;">
							<span>卖出价格CNY</span>
							<span>6.64</span>
						</p>
						<div class="L_82_1">
							<span>卖出量USDT</span>
							<input type="text" />
						</div>
						<div class="L_82_2">
							<span>金额</span>
							<input type="text" />
						</div>
						<div class="L_81_3" style="width: 90%;">
							<div class="L_81_4">
								<span>最小限额</span>
								<input type="text" />
							</div>
							<div class="L_81_5">
								<span>最大限额</span>
								<input type="text" />
							</div>
						</div>
						<p style="font-size: 14px;color: #5c5c66;margin-bottom: 20px;">
							<span style="margin-right: 6px;">支付方式</span><img src="img/L_19.png" style="margin-right: 10px;" />
							<span style="margin-right: 6px;">支付宝</span><input type="Checkbox" />
							<span style="margin-right: 6px;">微信</span><input type="Checkbox" />
							<span style="margin-right: 6px;">银行转账</span><input type="Checkbox" />
							<span>(必须本人支付)</span>
							<a href="#">《交易须知》</a>
						</p>
						<input type="button" value="卖出(CNY-USDT)" style="border-radius: 3px;color: #FFFFFF;height: 40px;width: 90%;border: 0px;background: #03c087;" />
					</div>
				</div>
				<div class="L_77">
					<p style="display: inline-block;width: 100%;"><span style="float: left;">市场挂单(只显示在线商家)</span>
					</p>
					<p>
						<a href="#" style="margin-right: 40px;margin-left: 10px;color: #41b2ce;">购买</a>
						<a href="#" style="color: #152137;">出售</a>
					</p>
					<div class="L_77_1">
						<table class="L_40" style="width: 100%;">
							<tr>
								<th style="width: 0%;">类型</th>
								<th>价格(CNY)</th>
								<th>数量(USDT)</th>
								<th>总计(CNY)</th>
								<th>交易限额(USDT)</th>
								<th>商家在线</th>
								<th>成交单数</th>
								<th>平均用时</th>
								<th>付款方式</th>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
							<tr>
								<td>买入</td>
								<td>6.65</td>
								<td>3000.0000</td>
								<td>1314.0</td>
								<td>250.00-25000.00</td>
								<td>王** 11分钟</td>
								<td>250</td>
								<td>6分钟</td>
								<td>
									<img src="img/L_22.png" />
									<img src="img/L_16.png" />
									<img src="img/L_20.png" />
									<a href="#" style="display: inline-block;margin-left: 40px;">买入</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="L_78">
					<p style="margin-bottom: 20px;">
						<a style="margin-right: 20px;">我的当前订单</a>
						<a style="margin-right: 20px;">已完成订单</a>
						<a style="margin-right: 20px;">已取消订单</a>
						<a style="margin-right: 20px;">已申诉订单</a>
						<a style="float: right;">更多</a>
					</p>
					<table class="L_40" style="width: 100%;position: relative;">
						<tr>
							<th style="width: 12%;">单号</th>
							<th>类型</th>
							<th>价格(CNY)</th>
							<th>数量(USDT)</th>
							<th>金额(CNY)</th>
							<th>状态</th>
							<th>对方姓名</th>
							<th>建立时间</th>
							<th>操作</th>
						</tr>
						<tr>
							<td>20180603<img src="img/L_30.png" style="margin-left: 10px;" /></td>
							<td>买入</td>
							<td>6.65</td>
							<td>1314.0000</td>
							<td>1890.10</td>
							<td>成功</td>
							<td>周**</td>
							<td>2018-08-21</td>
							<td>
								<a>撤销</a>
							</td>
						</tr>
						<tr>
							<td>20180603<img src="img/L_30.png" style="margin-left: 10px;" /></td>
							<td>买入</td>
							<td>6.65</td>
							<td>1314.0000</td>
							<td>1890.10</td>
							<td>成功</td>
							<td>周**</td>
							<td>2018-08-21</td>
							<td>
								<a>撤销</a>
							</td>
						</tr>
						<tr>
							<td>20180603<img src="img/L_30.png" style="margin-left: 10px;" /></td>
							<td>买入</td>
							<td>6.65</td>
							<td>1314.0000</td>
							<td>1890.10</td>
							<td>成功</td>
							<td>周**</td>
							<td>2018-08-21</td>
							<td>
								<a>撤销</a>
							</td>
						</tr>
						<tr>
							<td>20180603<img src="img/L_30.png" style="margin-left: 10px;" /></td>
							<td>买入</td>
							<td>6.65</td>
							<td>1314.0000</td>
							<td>1890.10</td>
							<td>成功</td>
							<td>周**</td>
							<td>2018-08-21</td>
							<td>
								<a>撤销</a>
							</td>
						</tr>
						<table>
							<tr>
								<div class="L_78_3">
									<div class="L_78_1">
										<fieldset style="border: 1px solid #D9DADB;border-radius: 4px;">
											<legend>请选择以下某种方式向卖家付款</legend>
											<div class="fl L_78_11">
												<p><img src="img/L_21.png" />银行转账</p>
												<p>实际姓名：<span>周大生&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p>银行名：<span>招商银行&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p>支行：<span>******&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p>银行卡号：<span>***3696&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p>付款金额：<span>58888.08&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p>付款时请备注：<span>62596&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
											</div>
											<div class="fl L_78_12">
												<p><img src="img/L_23.png" />支付宝</p>
												<p>卖家姓名：<span>周大生&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p>支付宝账号：<span>【扫码***】&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p>付款金额：<span>58888.08&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p><span>切勿备注&nbsp;比特币&nbsp;虚拟币&nbsp;等信息</span></p>
												<p><span>请留意与卖家姓名是否一致</span></p>
												<p>支付宝收款码：<img src="img/L_19.png" /></p>
												<div class="L_78_121">
													<span>支付宝</span><br />
													<img src="img/L_24.png" />
													<span>收款码</span><br />
													<span>立即查看</span>
												</div>
											</div>
											<div class="fl L_78_13">
												<p><img src="img/L_17.png" />微信</p>
												<p>卖家姓名：<span>周大生&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p>支付宝账号：<span>【扫码***】&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p>付款金额：<span>58888.08&nbsp;&nbsp;&nbsp;</span><a>复制</a></p>
												<p><span>切勿备注&nbsp;比特币&nbsp;虚拟币&nbsp;等信息</span></p>
												<p><span>请留意与卖家姓名是否一致</span></p>
												<p>支付宝收款码：<img src="img/L_19.png" /></p>
												<div class="L_78_131">
													<span>微信</span><br />
													<img src="img/L_24.png" />
													<span>收款码</span><br />
													<span>立即查看</span>
												</div>
											</div>
										</fieldset>
									</div>
									<div class="L_78_2">
										<p style="display: inline-block;width: 100%;height: 103px;line-height: 103px;">已完成<span style="margin-left: 20px;"><img src="img/L_15.png"style="position: relative;top: 3px;" />还剩下30分50秒</span></p>
										<p style="display: inline-block;width: 100%;height: 103px;line-height: 103px;color: #5c5c66;"><span><img src="img/L_14.png" style="position: relative;top: 3px;" />  联系对方  </span><span><img src="img/L_18.png"  style="position: relative;top: 3px;" />  我要申诉</span></p>
									</div>
								</div>
							</tr>
						</table>
					</table>
				</div>
				<div class="L_79">
					<p style="font-size: 13px;color: #152137;font-weight: 600;margin-bottom: 10px;">交易须知：</p>
					<ul style="font-size: 13px;color: #152137;">
						<li>1. <span> 超过<b style="color: #6b99d6;">3笔取消订单将禁止2天C2C交易</b></span></li>
						<li>2. <span> 有<b style="color: #6b99d6;">2个</b>买单未完成，<b style="color: #6b99d6;">暂停</b>继续下单，完成后恢复</span></li>
						<li>3. <span> 下单买入后<b style="color: #6b99d6;">冒充已付款</b>，卖方可申诉举报，一经查实将<b style="color: #6b99d6;">禁封</b>交易</span></li>
						<li>4. <span> <b style="color: #6b99d6;">17:00</b>以后及<b>非工作日</b>时间，每笔请拆分<b style="color: #6b99d6;">5万</b>以内进行转账，否则将延迟到账</span></li>
						<li>5. <span><b style="color: #6b99d6;">卖方</b>收到的资金<b>非买方</b>本人转账,请卖方<b style="color: #6b99d6;">原路退回</b></span></li>
						<li>6. <span style="color: #6b99d6;"> 已取消订单，如已付款，请及时申诉，上传付款证明等资料，说明情况</span></li>
						<li>7. <span style="color: #6b99d6;"> 转账时请勿备注“比特币”、“虚拟币”等信息，否则禁止C2C交易</span></li>
					</ul>
				</div>
				<div class="L_80">
					<div class="L_49" style="width: 100%;margin-bottom: 60px;">
						<div class="L_50" style="margin-top: 30px;">
							<span style="font-size: 15px;color: #152137;float: left;">我的商家接单(支付设置)</span>
							<span style="font-size: 15px;color: #152137;float: right;"><a>更多</a></span>
						</div>
						<div class="L_51">
							<table class="L_40" style="width: 100%;">
								<tr>
									<th style="width: 0%;">单号</th>
									<th>时间</th>
									<th>类型</th>
									<th>价格(CNY)</th>
									<th>数量(USDT)</th>
									<th>金额(CNY)</th>
									<th>交易限额(USDT)</th>
									<th>已锁定(USDT)</th>
									<th>付款方式</th>
									<th>操作</th>
								</tr>
								<tr>
									<td>20180603</td>
									<td>2018-08-01 16:15:14</td>
									<td>买入</td>
									<td>6.68</td>
									<td>1890.10</td>
									<td>1200.00</td>
									<td>3000.00-30000.00</td>
									<td>3000.00</td>
									<td><img src="img/L_16.png" /></td>
									<td>
										<a>撤销</a>
									</td>
								</tr>
								<tr>
									<td>20180603</td>
									<td>2018-08-01 16:15:14</td>
									<td>买入</td>
									<td>6.68</td>
									<td>1890.10</td>
									<td>1200.00</td>
									<td>3000.00-30000.00</td>
									<td>3000.00</td>
									<td><img src="img/L_16.png" /></td>
									<td>
										<a>撤销</a>
									</td>
								</tr>
								<tr>
									<td>20180603</td>
									<td>2018-08-01 16:15:14</td>
									<td>买入</td>
									<td>6.68</td>
									<td>1890.10</td>
									<td>1200.00</td>
									<td>3000.00-30000.00</td>
									<td>3000.00</td>
									<td><img src="img/L_16.png" /></td>
									<td>
										<a>撤销</a>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
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