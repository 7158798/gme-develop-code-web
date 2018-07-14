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
		<script src="js/echarts.js"></script>
		
	</head>

	<body class="">
		<!--
        	作者：李德芳
        	时间：2018-06-28
        	描述：
        -->
		<!--
        	右
        -->
        <input id="pairId" type="hidden" value="57977135-7877-11e8-b07b-4ccc6ad6addc"/>
        <input id="mainSymbol" type="hidden" value="btc"/>
		<div class="L_92">
			<div class="L_89">
				<div class="L_89_1">
					<p>总资产折合</p>
					<p>0.00000000 BTC</p>
					<p>≈<span>0.131415</span>CNY</p>
				</div>
				<div class="L_89_2">
					<div class="L_89_11">
						<div class="L_89_12">
							<a class="L_89_12a action_L_89_12">自选</a>
							<a class="L_89_12a">USDT</a>
							<a class="L_89_12a">ETH</a>
							<a class="L_89_12a">BTC</a>
						</div>
						<input type="text" />
						<img src="img/L_6.png" />
					</div>
					<p class="L_89_13">
						<span style="width: 40%;display: inline-block;">币种</span>
						<span style="width: 33%;display: inline-block;">最新价</span>
						<span style="width: 22%;display: inline-block;">涨跌幅</span>
					</p>
					<div class="L_89_2_2">
						<table class="L_89_22">
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>USDT/USDT</td>
								<td>17.00</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
							<tr>
								<td>BTC/USDT</td>
								<td>4086.08</td>
								<td>-0.84%</td>
							</tr>
						</table>
					</div>
					<div style="height: 20px;width: 100%;"></div>
				</div>
				<div class="L_89_3">
					<p class="L_89_31">成交记录</p>
					<p class="L_89_13">
						<span style="width: 40%;display: inline-block;">成交价(BTC)</span>
						<span style="width: 33%;display: inline-block;">成交量</span>
						<span style="width: 22%;display: inline-block;">时间</span>
					</p>
					<div class="L_89_2_2" style="max-height: 940px;">
						<table id="platformTransRecord" class="L_89_22">
							<tr>
								<td>1.56</td>
								<td>4086.08</td>
								<td>23:32:03</td>
							</tr>
						</table>
					</div>
					<div style="height: 80px;width: 100%;"></div>
				</div>
			</div>
			<!--
	        	左
	        -->
			<div class="L_90">
				<div class="L_90_1">
					<img class="L_90_13" src="img/L_42.png" />
					<ul class="L_90_11">
						<li>ONT/BTC</li>
						<li>0.00087787</li>
						<li class="zhang">+0.04%</li>
						<li class="zhang">0.00089898</li>
						<li class="die">0.00089298</li>
						<li>361609 ONT</li>
						<li>303.74BTC</li>
					</ul>
					<ul class="L_90_12">
						<li>本体</li>
						<li class="zhang">≈40.12123</li>
						<li class="zhang">0.00000040</li>
						<li>24H最高价</li>
						<li>24H最低价</li>
						<li>24H成交量</li>
						<li>24H成交额</li>
					</ul>
				</div>
				<div class="L_90_2">
					<p id="klineStyle">
						<a class="action_90_2" style="color: #41b2ce;" onclick="sf(1)">1分钟</a>
						<a onclick="sf(5)">5分钟</a>
						<a onclick="sf(15)">15分钟</a>
						<a onclick="sf(30)">30分钟</a>
						<a onclick="xs(1)">1小时</a>
						<a onclick="xs(4)">4小时</a>
						<a onclick="day(1)">日线</a>
						<a onclick="week(1)">周线</a>
						<a onclick="month(1)">月线</a>
					</p>
					<div id="main" style="width: 100%;height:501px;"></div>
				</div>
				<div class="L_90_3">
					<div class="L_90_31">
						<div class="L_90_311">
							<div class="L_90_3111">
								<p><span>买入ONT</span><span>可用BTC:0.0000000</span></p>
								<div class="L_90_31111">
									<input id="buyPrice" type="text" value="1" onkeyup="return checkBuyCalcAmount(this.value)?this.value:this.value='' "/>
									<span>BTC</span>
									<span class="L_90_31112">
										<a style="border-bottom: 1px solid #B4B6B8;border-left: 1px solid #B4B6B8;"><img src="img/L_46.png" /></a>
										<a style="border-left: 1px solid #B4B6B8;"><img class="L_90_31113" src="img/L_46.png" /></a>
									</span>
								</div>
								<span class="L_90_31114">&emsp;≈<span id="buyChangeCNY"></span>&nbsp;CNY</span>
								<p class="L_90_31115">
									<input id="buyCount" type="text" placeholder="请输入买入数量" onkeyup="return checkBuyCalcAmount(this.value)?this.value:this.value='' "/>
									<span>ONT</span>
								</p>
								<ul class="line2">
									<li style="background: rgba(240,243,245);">
										<span class="line2-left">0%</span>
									</li>
									<li style="background: rgba(240,243,245);"><span class="line2-left">25%</span></li>
									<li style="background: rgba(240,243,245);"><span class="line2-left">50%</span></li>
									<li style="background: rgba(240,243,245);"><span class="line2-left">75%</span></li>
									<li> <span class="line2-right">100%</span></li>
									<input class="line2input1" id="buyline" type="range" value="0" min="0" max="100" step="0.01" style="background-size: 0% 100%;">
								</ul>
								<p class="L_90_31114" style="margin-top: 40px;">&emsp;总计≈<span id="buyAmountSymbol"></span>&nbsp;BTC （≈<span id="buyAmountCNY"></span>&nbsp;CNY）</p>
								<input id="buyPayPassword" class="L_90_31116" type="password" placeholder="请输入交易密码">
								<input id="buyButton" class="L_90_31117" type="button" value="买入ONT">
							</div>
							<div class="L_90_3112">
								<p><span>卖出ONT</span><span>可用ONT:0.0000000</span></p>
								<div class="L_90_31111">
									<input id="sellPrice" type="text" value="1" onkeyup="return checkSellCalcAmount(this.value)?this.value:this.value='' "/>
									<span>BTC</span>
									<span class="L_90_31112">
										<a style="border-bottom: 1px solid #B4B6B8;border-left: 1px solid #B4B6B8;"><img src="img/L_46.png" /></a>
										<a style="border-left: 1px solid #B4B6B8;"><img class="L_90_31113" src="img/L_46.png" /></a>
									</span>
								</div>
								<span class="L_90_31114">&emsp;≈<span id="sellChangeCNY"></span>&nbsp;CNY</span>
								<p class="L_90_31115">
									<input id="sellCount" type="text" placeholder="请输入卖出数量" onkeyup="return checkSellCalcAmount(this.value)?this.value:this.value='' "/>
									<span>ONT</span>
								</p>
								<ul class="line21">
									<li style="background: rgba(240,243,245);">
										<span class="line21-left">0%</span>
									</li>
									<li style="background: rgba(240,243,245);"><span class="line21-left">25%</span></li>
									<li style="background: rgba(240,243,245);"><span class="line21-left">50%</span></li>
									<li style="background: rgba(240,243,245);"><span class="line21-left">75%</span></li>
									<li> <span class="line21-right">100%</span></li>
									<input class="line2input2" id="sellline" type="range" value="0" min="0" max="100" step="0.01" style="background-size: 0% 100%;">
								</ul>
								<p class="L_90_31114" style="margin-top: 40px;">&emsp;总计≈<span id="sellAmountSymbol"></span>&nbsp;BTC（<span id="sellAmountCNY"></span>&nbsp;CNY）</p>
								<input id="sellPayPassword" class="L_90_31116" type="text" placeholder="请输入交易密码">
								<input id="sellButton" class="L_90_31117" style="background: #03c087;" type="button" value="卖出ONT">
							</div>
						</div>
						<div class="L_90_312">
							<p>深度图</p>
							<div id="container" style="height: 450px"></div>
						</div>
					</div>
					<div class="L_90_32">
						<p>
							<a><img src="img/L_43.png" title="全部" /></a>
							<a><img src="img/L_44.png" title="买" /></a>
							<a><img src="img/L_45.png" title="卖" /></a>
						</p>
						<table id="selling" class="L_90_32_1">
							<tr>
								<th>价格(BTC)</th>
								<th>数量(ONT)</th>
								<th>累计(ONT)</th>
							</tr>
							<tr>
								<td>0.003005</td>
								<td>46.2645</td>
								<td>1524.1314</td>
							</tr>
						</table>
						<p class="L_90_32_2">
							<span></span>
							<span>卖盘</span>
							<span>0.00094652BTC</span>
						</p>
						<p class="L_90_32_3">
							<span></span>
							<span>买盘</span>
							<span>≈42.13145CNY</span>
						</p>
						<table id="buying" class="L_90_32_4">
							<tr>
								<th>价格(BTC)</th>
								<th>数量(ONT)</th>
								<th>累计(ONT)</th>
							</tr>
							<tr>
								<td>0.003005</td>
								<td>46.2645</td>
								<td>1524.1314</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="L_91">
				<div class="L_91_1">
					<span>我的ONT当前委托</span>
					<a class="L_91_2 action_91_2">全部</a>
					<a class="L_91_2" onclick="entrustRecord(2)">卖出</a>
					<a class="L_91_2" onclick="entrustRecord(1)">买入</a>
				</div>
				<table id="myEntrustRecordTable">
					<tr>
						<th style="width: 14%;">时间</th>
						<th>买/卖</th>
						<th>价格(BTC)</th>
						<th>数量</th>
						<th>已成交</th>
						<th>未成交</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
					<tr>
						<td>2018-08-08 13:14:15</td>
						<td>买入</td>
						<td>40000.9000</td>
						<td>1314.9000</td>
						<td>1314.9000</td>
						<td>1314.9000</td>
						<td>已成交</td>
						<td>
							<a onclick="if($('#L_91_3').css('display')=='block'){$('#L_91_3').css('display','none')}else{$('#L_91_3').css('display','block')}">详情<img src="img/L_41.png" /></a>
						</td>
					</tr> 
					<tr>
						<td colspan="8" style="height: 0px;">
							<div class="L_91_3" id="L_91_3">
								<ul>
									<li>时间</li>
									<li>价格</li>
									<li>数量</li>
									<li>成交数量</li>
									<li>未成交数量</li>
									<li>成交额</li>
									<li>手续费</li>
								</ul>
								<ul>
									<li>2018-08-08 13:14:15</li>
									<li>40000.0902</li>
									<li>40000.0902</li>
									<li>40000.0902</li>
									<li>40000.0902</li>
									<li>40000.0902</li>
									<li>40000.0902</li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<td>2018-08-08 13:14:15</td>
						<td>买入</td>
						<td>40000.9000</td>
						<td>1314.9000</td>
						<td>1314.9000</td>
						<td>1314.9000</td>
						<td>部分成交</td>
						<td>
							<a>撤销</a>
							<a onclick="if($('#L_91_4').css('display')=='block'){$('#L_91_4').css('display','none')}else{$('#L_91_4').css('display','block')}">详情<img src="img/L_41.png" /></a>
						</td>
					</tr>
					<tr>
						<td colspan="8" style="height: 0px;">
							<div class="L_91_3" id="L_91_4">
								<ul>
									<li>时间</li>
									<li>价格</li>
									<li>数量</li>
									<li>成交数量</li>
									<li>未成交数量</li>
									<li>成交额</li>
									<li>手续费</li>
								</ul>
								<ul>
									<li>2018-08-08 13:14:15</li>
									<li>40000.0902</li>
									<li>40000.0902</li>
									<li>40000.0902</li>
									<li>40000.0902</li>
									<li>40000.0902</li>
									<li>40000.0902</li>
								</ul>
							</div>
						</td>
					</tr>
				</table>
				<div class="L_41">
					<span>1</span>
					<span style="background: #2B6FC9;color: #FFFFFF;">2</span>
					<span>...</span>
					<span><a id="prePage1">上一页</a></span>
					<span><a id="nextPage1">下一页</a></span>
				</div>
			</div>
			<div class="L_91">
				<div class="L_91_1">
					<span>我的成交记录</span>
					<a class="L_91_2 action_91_2">全部</a>
					<a class="L_91_2" onclick="currencyTransRecord(2)">卖出</a>
					<a class="L_91_2" onclick="currencyTransRecord(1)">买入</a>
				</div>
				<table id="myTransRecordTable">
					<tr>
						<th style="width: 14%;">时间</th>
						<th>买/卖</th>
						<th>交易对</th>
						<th>价格</th>
						<th>数量</th>
						<th>成交额</th>
						<th>手续费</th>
					</tr>
					<tr>
						<td>2018-08-08 13:14:15</td>
						<td>卖出</td>
						<td>USDT/BTC</td>
						<td>1314.9000</td>
						<td>1314.9000</td>
						<td>1314.9000</td>
						<td>1314.9000</td>
					</tr>
				</table>
				<div class="L_41">
					<span>1</span>
					<span style="background: #2B6FC9;color: #FFFFFF;">2</span>
					<span>...</span>
					<span><a id="prePage">上一页</a></span>
					<span><a id="nextPage">下一页</a></span>
				</div>
			</div>
		</div>
		
		
		<script src="js/bbjy.js"></script>
		<script type="text/javascript" src="js/bbTrans.js"></script>
		<script type="text/javascript" src="js/style.js"></script>
		<script type="text/javascript" src="js/after.js"></script>
		<script type="text/javascript" src="js/calc.js"></script>
	</body>

</html>