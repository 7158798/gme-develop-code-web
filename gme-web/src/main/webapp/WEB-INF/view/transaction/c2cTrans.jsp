<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<span id="realTime" style="font-size: 14px;color: #5c5c66;font-weight: 600;"></span>&nbsp;&nbsp;
						<span>日涨跌:</span>
						<span id="highsAndLows" style="font-size: 14px;color: #f05d5d;font-weight: 600;"></span>&nbsp;&nbsp;
						<span>最高价:</span>
						<span id="highest" style="font-size: 14px;color: #5c5c66;font-weight: 600;"></span>&nbsp;&nbsp;
						<span>最低价:</span>
						<span id="lowest" style="font-size: 14px;color: #5c5c66;font-weight: 600;"></span>
					</p>
				</div>
				<div class="L_76">
					<div class="L_81">
						<p>买入USDT</p>
						<p style="margin-bottom: 16px;">
							<a href="#">如何买入？</a>
						</p>
						<p style="margin-bottom: 10px;">
							<!-- <span>买入价格CNY</span> -->
							<input id="buyPrice" type="text" placeholder="请输入金额" onkeyup="return checkBuyCalcAmount(this.value)?this.value:this.value='' "/>
						</p>
						<div class="L_81_1">
							<span>买入量USDT</span>
							<input id="buyCount" type="text" onkeyup="return checkBuyCalcAmount(this.value)?this.value:this.value='' " />
						</div>
						<div class="L_81_2">
							<span>金额</span>
							<input id="buyAmount" type="text" onkeyup="return checkBuyAmount(this.value)?this.value:this.value='' "/>
						</div>
						<div class="L_81_3">
							<div class="L_81_4">
								<span>最小限额</span>
								<input id="bMinLimit" type="text" onkeyup="return checkReg(this.value)?this.value:this.value='' "/>
							</div>
							<div class="L_81_5">
								<span>最大限额</span>
								<input id="bMaxLimit" type="text" onkeyup="return checkReg(this.value)?this.value:this.value='' "/>
							</div>
						</div>
						<p style="font-size: 14px;color: #5c5c66;margin-bottom: 20px;">
							<span style="margin-right: 6px;">支付方式</span><img src="img/L_19.png" style="margin-right: 10px;" />
							<span style="margin-right: 6px;">支付宝</span><input id="bAliPay" name="payMethod" type="checkbox" value="01"/>
							<span style="margin-right: 6px;">微信</span><input id="bWechatPay" name="payMethod" type="checkbox" value="01"/>
							<span style="margin-right: 6px;">银行转账</span><input id="bBankCard" name="payMethod" type="checkbox" value="01"/>
							<span>(必须本人支付)</span>
							<a href="#">《交易须知》</a>
						</p>
						<input type="button" id="buyButton" value="买入(CNY-USDT)" style="border-radius: 3px;color: #FFFFFF;height: 40px;width: 90%;border: 0px;background: #f05d5d;" />
						
					</div>
					<div class="L_82">
						<p>卖出USDT&nbsp;&nbsp;&nbsp;(USDT余额<span>0.00000</span>)</p>
						<p style="display: inline-block;width: 90%;margin-bottom: 16px;">
							<a href="#" style="float: left;">如何卖出？</a>
							<a href="USDTWithdraw.html" style="float: right;color: #5c5c66;">USDT提现</a>
							<a href="" style="float: right;margin-right: 30px;color: #5c5c66;">USDT充值</a>
						</p>
						<p style="margin-bottom: 10px;">
							<span>卖出价格CNY</span>
							<input id="sellPrice" type="text" placeholder="请输入金额" onkeyup="return checkSellCalcAmount(this.value)?this.value:this.value='' "/>
						</p>
						<div class="L_82_1">
							<span>卖出量USDT</span>
							<input id="sellCount" type="text" onkeyup="return checkSellCalcAmount(this.value)?this.value:this.value='' "/>
						</div>
						<div class="L_82_2">
							<span>金额</span>
							<input id="sellAmount" type="text" onkeyup="return checkSellAmount(this.value)?this.value:this.value='' " />
						</div>
						<div class="L_81_3" style="width: 90%;">
							<div class="L_81_4">
								<span>最小限额</span>
								<input id="sMinLimit" type="text" onkeyup="return checkReg(this.value)?this.value:this.value='' "/>
							</div>
							<div class="L_81_5">
								<span>最大限额</span>
								<input id="sMaxLimit" type="text" onkeyup="return checkReg(this.value)?this.value:this.value='' "/>
							</div>
						</div>
						<p style="font-size: 14px;color: #5c5c66;margin-bottom: 20px;">
							<span style="margin-right: 6px;">支付方式</span><img src="img/L_19.png" style="margin-right: 10px;" />
							<span style="margin-right: 6px;">支付宝</span><input id="sAliPay" type="checkbox" />
							<span style="margin-right: 6px;">微信</span><input id="sWechatPay" type="checkbox" />
							<span style="margin-right: 6px;">银行转账</span><input id="sBankCard" type="checkbox" />
							<span>(必须本人支付)</span>
							<a href="#">《交易须知》</a>
						</p>
						<input type="button" id="sellButton" value="卖出(CNY-USDT)" style="border-radius: 3px;color: #FFFFFF;height: 40px;width: 90%;border: 0px;background: #03c087;" />
						
						
					</div>
					<div class="L_76_1">
						<div class="L_76_11">
							<p><img src="img/L_47.png" /></p>
							<p>只有商家才可以交易</p>
							<p><a href="">申请为商家</a></p>
						</div>
					</div>
				</div>
				<div class="L_77">
					<p style="display: inline-block;width: 100%;"><span style="float: left;">市场挂单(只显示在线商家)</span>
					</p>
					<p>
						<a id="buy" onclick="changeStyle(this);" style="margin-right: 40px;margin-left: 10px;color: #41b2ce;">购买</a>
						<a id="sell" onclick="changeStyle(this);" style="color: #152137;">出售</a>
					</p>
					
					
					<div class="L_77_1">
						<table id="deityTable" class="L_40" style="width: 100%;">
							<tr>
								<th style="width: 0%;">类型</th>
								<th>价格(CNY)</th>
								<th>数量(USDT)</th>
								<th>总计(CNY)</th>
								<th>交易限额(CNY)</th>
								<th>商家在线</th>
								<th>成交单数</th>
								<th>平均用时</th>
								<th>付款方式</th>
								<th></th>
							</tr>
						</table>
					</div>
				</div>
				<div class="L_78">
					<p style="margin-bottom: 20px;" id="orderStatus">
						<a onclick="changeOrderStatus(1)" style="margin-right: 20px;color: #41b2ce;">我的当前订单</a>
						<a onclick="changeOrderStatus(3)" style="margin-right: 20px;">已完成订单</a>
						<a onclick="changeOrderStatus(4)" style="margin-right: 20px;">已取消订单</a>
						<a onclick="changeOrderStatus(7)" style="margin-right: 20px;">已申诉订单</a>
						<a href="c2cTransRecord.html" style="float: right;">更多</a>
					</p>
					<table id="userOrderQuery" class="L_40" style="width: 100%;position: relative;">
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
								<a onclick="if($('#L_78_3').css('display')!='none'){$('#L_78_3').css('display','none')}else{$('#L_78_3').css('display','block')}">撤销</a>
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
							<span style="font-size: 15px;color: #152137;float: left;">我的商家订单(支付设置)</span>
							<span style="font-size: 15px;color: #152137;float: right;"><a href="transRecord.html">更多</a></span>
						</div>
						<div class="L_51">
							<table id="busDeityTable" class="L_40" style="width: 100%;">
								<tr>
									<th style="width: 0%;">单号</th>
									<th>时间</th>
									<th>类型</th>
									<th>价格(CNY)</th>
									<th>数量(USDT)</th>
									<th>金额(CNY)</th>
									<th>交易限额(USDT)</th>
									<th>已完成数量(USDT)</th>
									<th>状态</th>
									<th>付款方式</th>
									<th>操作</th>
								</tr>
							</table>
						</div>
					</div>
					<div class="L_49" style="width: 100%;margin-bottom: 60px;">
						<div class="L_50" style="margin-top: 30px;">
							<span style="font-size: 15px;color: #152137;float: left;">我的商家接单(支付设置)</span>
							<span style="font-size: 15px;color: #152137;float: right;"><a href="transRecord.html">更多</a></span>
						</div>
						<p style="margin-bottom: 20px;">
							<a style="margin-right: 20px;">我的当前订单</a>
						</p>
						<table id="busOrderQuery" class="L_40" style="width: 100%;position: relative;">
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
								<a onclick="if($('#L_78_3').css('display')!='none'){$('#L_78_3').css('display','none')}else{$('#L_78_3').css('display','block')}">撤销</a>
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
					</table>
					</div>
					<a onclick="userPayFinish();">用户已付款</a>
					<a onclick="busCheckFinish();">商家放行</a>
				</div>
			</div>
		</div>
		<div class="L_78_1311" id="L_78_1311">
			<div class="L_78_1312">
				<p><img src="img/L_17.png"/><span>微信</span><a onclick="$('#L_78_1311').css('display','none')"><img src="img/L_48.png" style="position: relative;top: 0px;left: 170px;" /></a></p>
				<p><img src="img/L_49.png" /></p>
				<p>请使用|<span>微信</span>|扫描二维码支付</p>
			</div>
		</div>
		<div class="L_78_1311" id="L_78_1312">
			<div class="L_78_1312">
				<p style="background: #44b6ff;"><img src="img/L_23.png"/><span>支付宝</span><a onclick="$('#L_78_1312').css('display','none')"><img src="img/L_48.png" style="position: relative;top: 0px;left: 160px;" /></a></p>
				<p><img src="img/L_49.png" /></p>
				<p>请使用|<span>支付宝</span>|扫描二维码支付</p>
			</div>
		</div>
		
		<script type="text/javascript" src="js/style.js"></script>
		<script type="text/javascript" src="js/calc.js"></script>
		
		<script type="text/javascript" src="js/c2cTrans.js"></script>
		
		
	</body>

</html>