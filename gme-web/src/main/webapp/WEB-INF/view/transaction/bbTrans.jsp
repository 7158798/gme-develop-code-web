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

		<link href="/favicon.ico" rel="shortcut icon">
		<link rel="apple-touch-icon" sizes="120x120" href="images/apple-touch-icon-120x120.png" />
		<script>
			var g_lang = 'cn';
		</script>
		<script src="js/jquery-1.8.2.min.js"></script>
		<script src="js/jquery.common.tools.js?v=0207"></script>
		<script type="text/javascript" src="js/echarts.js"></script>
	</head>

	<body class="">
		<div class="header clearfix">
			<div class="top-up">
				<div class="top-con">
					<ul class="topprice">
						<li> BTC/CNY : ￥ <span class="topnum">55362.06</span><i class="icon-arrow-up">&uarr;</i> </li>
						<li> ETH/CNY : ￥ <span class="topnum">4654.00</span><i class="icon-arrow-up">&uarr;</i> </li>
						<li> LTC/CNY : ￥ <span class="topnum">904.22</span><i class="icon-arrow-up">&uarr;</i> </li>
						<li> QTUM/CNY : ￥ <span class="topnum">108.62</span><i class="icon-arrow-up">&uarr;</i> </li>
					</ul>
					<ul class="login_lan">

						<li class="toplogin">
							<a href="login.html">注册&nbsp;</a>|&nbsp; </li>
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
			<div class="top-dn">
				<div class="logo">
					<a href="https://gate.io" target="_top">
						<![if !IE]><img src="images/logo@@2x.png" alt="gate.io LOGO" />
						<![endif]>
						<!--[if IE]><img src="/images/logo.png" alt="LOGO"/><![endif]-->
					</a>
				</div>

				<ul class="gateio-nav">
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

		<div class="content index-content clearfix">
			<div class="leftbar ">
				<table class="marketlist dataTable" id="tradelist">
					<tbody>
						<tr>
							<td class="alignRight" style="border-bottom:0">
								<div id='market_controller' class="clearfix">
									<button value="USDT" class="tline_btn left_btn " title="对USDT交易">USDT</button>
									<button value="BTC" class="tline_btn left_btn tn_selected" title="对BTC交易">BTC</button>
									<button value="ETH" class="tline_btn left_btn " title="对ETH交易">ETH</button>
									<button value="QTUM" class="tline_btn left_btn " title="对QTUM交易">QTUM</button>
									<button value="LIMITED" class="tline_btn left_btn " title="限时交易区">限时</button>
									<button value="CUSTOM" class="tline_btn left_btn " title="我的自选区">自选</button>
								</div>
								<input type="text" class="search" id="marketSearch" placeholder="搜索..." />
							</td>
						</tr>
						<tr id="marketlistTabCon">
							<td id='marketlist_container_usdt' class="alignRight" style="">
								<div class="market_wrapper">
									<table id="marketlist_usdt">
										<thead>
											<tr style="height:40px">
												<th class="sortable sorting"><b>币种</b></th>
												<th class="sortable sorting">价格<span class="left-price-type">(USDT)</span></th>
												<th class="sortable sorting">日涨跌</th>
												<th class="sorting_disabled sorting">自选</th>
											</tr>
										</thead>
										<tbody id="usdtTbody"></tbody>
									</table>
								</div>
							</td>
							<td id='marketlist_container_btc' class="alignRight" style="display:block">
								<div class="market_wrapper">
									<table id="marketlist_btc">
										<thead>
											<tr style="height:40px">
												<th class="sortable sorting"><b>币种</b></th>
												<th class="sortable sorting">价格<span class="left-price-type">(BTC)</span></th>
												<th class="sortable sorting">日涨跌</th>
												<th class="sorting_disabled sorting">自选</th>
											</tr>
										</thead>
										<tbody id="btcTbody"></tbody>
									</table>
								</div>
							</td>
							<td id='marketlist_container_eth' class="alignRight" style="">
								<div class="market_wrapper">
									<table id="marketlist_eth">
										<thead>
											<tr style="height:40px">
												<th class="sortable sorting"><b>币种</b></th>
												<th class="sortable sorting">价格<span class="left-price-type">(ETH)</span></th>
												<th class="sortable sorting">日涨跌</th>
												<th class="sorting_disabled sorting">自选</th>
											</tr>
										</thead>
										<tbody id="ethTbody"></tbody>
									</table>
								</div>
							</td>
							<td id='marketlist_container_qtum' class="alignRight" style="">
								<div class="market_wrapper">
									<table id="marketlist_qtum">
										<thead>
											<tr style="height:40px">
												<th class="sortable sorting"><b>币种</b></th>
												<th class="sortable sorting">价格<span class="left-price-type">(QTUM)</span></th>
												<th class="sortable sorting">日涨跌</th>
												<th class="sorting_disabled sorting">自选</th>
											</tr>
										</thead>
										<tbody id="qtumTbody"></tbody>
									</table>
								</div>
							</td>
							<td id='marketlist_container_limited' class="alignRight" style="">
								<div class="market_wrapper">
									<table id="marketlist_limited">
										<thead>
											<tr style="height:40px">
												<th class="sortable sorting"><b>币种</b></th>
												<th class="sortable sorting">价格<span class="left-price-type">(ETH)</span></th>
												<th class="sortable sorting">日涨跌</th>
												<th class="sorting_disabled sorting">自选</th>
											</tr>
										</thead>
										<tbody id="limitedTbody"></tbody>
									</table>
								</div>
							</td>
							<td id='marketlist_container_custom' class="alignRight" style="">
								<div class="market_wrapper">
									<table id="marketlist_custom">
										<thead>
											<tr style="height:40px">
												<th class="sortable sorting"><b>币种</b></th>
												<th class="sortable sorting">价格</th>
												<th class="sortable sorting">日涨跌</th>
												<th class="sorting_disabled sorting">自选</th>
											</tr>
										</thead>
										<tbody id="customTbody"></tbody>
									</table>
								</div>
							</td>
							<td id="leftTipPan"></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div id="main_content" class="main_content">
				<div class="main_title ">
					<h1> 
				<span id="mianTlist" class="clearfix">
					<span class="coin-title"><a href="/coininfo/ETH" target="_blank"><span class="icon-32 icon-32-eth"></span></a><a href="/coininfo/ETH" target="_blank">以太币 ETH</a> 对<strong style="margin-right: 20px"> 比特币 BTC </strong></span>
					<span class="top_last_li">
						<span style='display:none;' id='market_unit_symbol'>฿</span>
						<span id="top_last_rate_change">
							<span class="price-dl">
								<em>฿</em><i id="currPrice" title="实时价格">0.0844</i><small> 或 </small><em>￥</em><i id="currFiat" title="实时价格">4642.74</i>
							</span>
							<em title="日涨跌"><span class='green'><strong id='currRateNum'>-1.13</strong>%</span></em>
						</span>
						<span class=arr-con><i class="caret" id="upArrow"></i><i class="caret" id="dnArrow"></i></span>
						<i id="currVol" title="24h 成交量"><small>量：</small>฿<span id="ticker_vol_b">43</span></i>
					</span>

				</span>
				</h1>
				</div>

				<div class="right_mcontent clearfix ">
					<div id="topSection">
						<!--<div class="kline-title">ETH / BTC K线图</div>
						<div class="k-line-container box-padding clearfix">
							<ul class="top_botton">
								<li>
									<span class="button k-tools" title="工具"><svg xmlns="http://www.w3.org/2000/svg" viewBox="-2.4 120.9 600 600" width="17" height="17"><path d="M594 473.5V368.8h-76c-5.7-23.8-15.2-46.4-27.5-66.4l53.8-53.8-73.9-73.9-53.8 53.4c-20.6-12.8-42.7-21.8-66.4-27.5v-75.9H245.5v75.9c-23.8 5.7-46.4 15.2-66.4 27.5l-53.8-53.8-73.9 73.9 53.4 53.8C92 322.6 83 344.7 77.3 368.4h-76V473h75.9c5.7 23.8 15.2 46.4 27.5 66.4L51 593.3l73.9 73.9 53.8-53.4c20.6 12.8 42.7 21.8 66.4 27.5v75.9h104.6v-75.9c23.8-5.7 46.4-15.2 66.4-27.5l53.8 53.8 73.9-73.9-53.4-53.8c12.8-20.6 21.8-42.7 27.5-66.4H594zm-296.4 69.7c-67.3 0-122.3-54.6-122.3-122.3 0-67.3 54.6-122.3 122.3-122.3 67.3 0 122.3 54.6 122.3 122.3-.4 67.4-54.9 122.3-122.3 122.3z"/></svg></span>
								</li>
								<li>
									<span class="button fullscreen" title="全屏"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path d="M4.712 10.043L2.045 12.71 0 10.667V16h5.334L3.29 13.955l2.667-2.667M5.334 0H0v5.334L2.045 3.29l2.667 2.667 1.245-1.245L3.29 2.045M10.666 0l2.045 2.045-2.666 2.667 1.245 1.245 2.666-2.667L16 5.334V0m-4.712 10.043l-1.245 1.245 2.668 2.667L10.668 16H16v-5.334l-2.045 2.045"/></svg></span>
								</li>
								<li>
									<span class="button kline-on-off" title="隐藏"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path d="M0 0v5.333h16V0H0zm15 4.167H1v-3h14v3zM0 16v-5.333h7.12v-1.5H4.23L8 5.393l3.77 3.772H8.88v1.5H16V16H0z"/></svg></span>
								</li>
							</ul>
							<div id="kline" class="box-container clearfix">
								<div class="load8" id="klineLoader">
									<div class="loader">Loading</div>
									<p>拼命加载中...</p>
								</div>
							</div>
						</div>-->
						<div class="tb">
							<a class="action" onclick="fzm()">分钟</a>
							<a onclick="sf()">5分钟</a>
							<a onclick="sfz()">10分钟</a>
							<a onclick="">30分钟</a>
							<a onclick="">60分钟</a>
							<a onclick="">日线</a>
						</div>
						<div id="main" style="width: 100%;height:460px;"></div>
					</div>
					
					<!--<div class="right-kline">
					<div id="chartContainer"></div>
                </div>-->
					<div class="trade-main clearfix">
						<div class="maichu maichu-form">
							<div class="m_title">
								<span>买入ETH</span>
							</div>
							<div class="m_con_buy">

								<table class="dealbox" cellspacing="0">
									<tr class="tableOrderTr" t="static" style="display: none">
										<td width="16%" align="right">最佳买价</td>
										<td width="61%"><span id="rate_best_ask" style="font-weight:600"></span><span class="coin-unit">BTC/ETH</span></td>
										<td width="23%"></td>
									</tr>
									<tr class="tableOrderTr" t="static">
										<td align="right" colspan="3">
											<span class="red">我的余额</span>
											<span id="buyYuE" class="red"><span id="balance_ask_able" style="font-weight:bold">0.0000</span><span class="coin-unit" style="color:#de5959">BTC</span>
											<a class="dp-link" href="/myaccount/deposit/BTC">充值</a>
											<a class="dp-link" href="/myaccount/withdraw/BTC">提现</a>
											</span>
										</td>
									</tr>
									<tr class="tableOrderTr" t="static">
										<td align="right" colspan="3">可买入量
											<span id="amount_ask_able" style="font-weight:bold">0.0000</span><span class="coin-unit">ETH</span>
										</td>
									</tr>

									<tr>
										<!--<td align="right">买入价</td>-->
										<td colspan="3" class="input-td">
											<span class="b-unit ask-bid-price input-title">买入价 <span>BTC/ETH</span></span>
											<input id="ask_rate" class="inputRate" maxlength="14" onkeyup="_page.obj.on_input_ask_rate();_page.obj.recalc_fee('ask');" value="" />
										</td>
										<!--<td class="b-unit ask-bid-price">BTC/ETH</td>-->
									</tr>
									<tr>
										<!--<td align="right">买入量</td>-->
										<td colspan="3" class="input-td">
											<span class="b-unit input-title">买入量 ETH</span>
											<input id="ask_vol" class="inputRate" maxlength="14" onkeyup="_page.obj.on_input_ask_vol();_page.obj.recalc_fee('ask');" value="0" />
										</td>

									</tr>
									<tr>
										<!--<td align="right">兑换额</td>-->
										<td colspan="3" class="input-td">
											<span class="b-unit input-title" id='bid_total_label'>兑换额 <span class="currb-unit">BTC</span></span>
											<input id="ask_amount" class="inputRate" maxlength="14" onkeyup="_page.obj.on_input_ask_amount();_page.obj.recalc_fee('ask');" value="0" />
										</td>

									</tr>
									<tr>
										<td align="right" colspan="3">手续费
											<span id="ask_fee">0</span><span class="coin-unit">BTC</span>
											<i>(<span class="red">0.2%</span> 成交才收，撤单退回)</i>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="input-td" style="border:0">
											<input type="button" class="btnAskBid jiaoyi_btn  button button-flat-action" t="ask" onclick="_page.obj.on_request_ask_bid( 'ask',  get_element('ask_rate').value, get_element('ask_vol').value );" value="买入 (BTC→ETH)" />
										</td>
									</tr>
								</table>

							</div>
						</div>
						<div class="mairu mairu-form">
							<div class="m_title">
								<span>卖出ETH</span>

								<div class="b-s-t-right" id="showFiatRate">
									<label for="hideprice" class="fiat-hide-show" title="实际成交价以币币交易价格为准，CNY计价只提供估值参考">
									<input type="checkbox" id="hideprice"  name='hideprice' style="width: 20px;" />
									<label for="hideprice" class="vr-btn"></label>
									<span class="hidefiat-span">CNY计价</span>
									</label>
								</div>
							</div>
							<div class="m_con">

								<table class="dealbox" cellspacing="0">

									<tr class="tableOrderTr" t="static" style="display: none">
										<td width="16%" align="right">最佳卖价</td>
										<td width="61%"><span id="rate_best_bid" style="font-weight:bold"></span><span class="coin-unit">BTC/ETH</span></td>
										<td width="23%"></td>
									</tr>
									<tr class="tableOrderTr" t="static">
										<td align="right" colspan="3">
											<span class="green">我的余额</span>
											<span id="sellYuE" class="green"><span id="balance_bid_able" style="font-weight:bold">0.0000</span><span class="coin-unit" style="color:#36a792">ETH</span>
											<a class="dp-link" href="/myaccount/deposit/ETH">充值</a>
											<a class="dp-link" href="/myaccount/withdraw/ETH">提现</a>
											</span>
										</td>
									</tr>
									<tr class="tableOrderTr" t="static">
										<td align="right" colspan="3">可兑换额
											<span id="amount_bid_able" style="font-weight:bold">0.0000</span><span class="coin-unit">BTC</span>
										</td>
									</tr>

									<tr>
										<td colspan="3" class="input-td">
											<span class="b-unit ask-bid-price input-title">卖出价 <span>BTC/ETH</span></span>
											<input id="bid_rate" class="inputRate" maxlength="14" onkeyup="_page.obj.on_input_bid_rate();_page.obj.recalc_fee('bid');" value="" />
										</td>

									</tr>
									<tr>
										<td colspan="3" class="input-td">
											<span class="b-unit input-title">卖出量 ETH</span>
											<input id="bid_vol" class="inputRate" maxlength="14" onkeyup="_page.obj.on_input_bid_vol();_page.obj.recalc_fee('bid');" value="0" />
										</td>
									</tr>
									<tr>
										<td colspan="3" class="input-td">
											<span class="b-unit input-title" id='ask_total_label'>兑换额 <span class="currb-unit">BTC</span></span>
											<input id="bid_amount" class="inputRate" maxlength="14" onkeyup="_page.obj.on_input_bid_amount();_page.obj.recalc_fee('bid');" value="0" />
										</td>
									</tr>
									<tr>
										<td align="right" colspan="3">手续费
											<span id="bid_fee">0</span><span class="coin-unit">ETH</span>
											<i>(<span class="green">0.2%</span> 成交才收，撤单退回)</i>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="input-td" style="border:0">
											<input type="button" class="btnAskBid jiaoyi_btn  button button-flat-action" t="bid" onclick="_page.obj.on_request_ask_bid( 'bid',  get_element('bid_rate').value, get_element('bid_vol').value );" value="卖出 (ETH→BTC)" />
										</td>
									</tr>
								</table>

							</div>
						</div>

						<div id='divMyOrderSection'>
							<!--style='display:none'-->
							<div class="mairu my-order-box">

								<div id="myOrderTab" class="m_title">
									<span class="order-tab order-t-active">当前委托</span>
									<span id="hisTab" class="order-tab">历史委托</span>

									<div class="clear-all">
										<a href="javascript:void(0)" onclick="
						noty({
							text: '<span style=\'padding-bottom:15px;display: inline-block\'>确定取消全部委托？</span>',type: 'confirm',layout: 'center',theme: 'gateioNotyTheme',modal: true,
							animation: {open: {height: 'toggle'},close: {height: 'toggle'},easing: 'swing',speed: 50},
							buttons: [
								{addClass: 'btn btn-primary', text: '确定', onClick: function($noty) {
									_page.obj.cancel_order('eth_btc', '-2', 1); $noty.close();return false;
								}},
								{addClass: 'btn btn-danger', text: '取消', onClick: function($noty) {$noty.close();return false;}}
							]
						});
						">全部撤单</a>
									</div>

								</div>

								<div id="currOrder" class="m_con cjbox" style="height: 272px;border: 1px solid #ddd;background: #fff;">
									<div id="order-info-box" class="box">
										<div class="list-wrapper">
											<ul class="trade-list_re">
												<li class="number sorting dealtop">
													<span class='right-align' id="tlist-date">日期</span>
													<span class='right-align my-type'>类型</span>
													<span class='right-align'>
								<em id="odPriceCol">价格(BTC)
																			
										<i id="p_od_tip" class="order-tip-icon">i</i>
										<div class="tip-modal">
											<div class="tip-m-con">灰色CNY价格仅供参考，会随市场变动，实际价格以前面价格为准。</div>
											<i class="caret"></i>
										</div>
										
																	</em>
							</span>
													<span class='right-align'>挂单量(ETH)</span>
													<span class='right-align'>操作</span>
												</li>
											</ul>
											<ul id="ulMyOrderList" class="trade-list_re" style="height: 231px; overflow-y: scroll; overflow-x: hidden;">
											</ul>
										</div>
									</div>
								</div>
								<div id="historyOrder" class="m_con cjbox" style="height: 272px;border: 1px solid #ddd;background: #fff;display: none">
									<div id="history-info-box" class="box">
										<div class="list-wrapper">
											<ul class="trade-list_re" id="my-tlist-title">
												<li class="number sorting dealtop">
													<span class='right-align' id="tlist-date">日期</span>
													<span class='right-align my-type'>类型</span>
													<span class='right-align'>价格(BTC)</span>
													<span class='right-align'>成交量(ETH)</span>
												</li>
											</ul>
											<ul id="my-trade-list" class="trade-list_re" style="height: 231px; overflow-y: scroll; overflow-x: hidden;">
											</ul>
										</div>
									</div>
								</div>

							</div>
							<div class="maichu my-order-box">

								<div class="m_title" id="myFunds">
									我的资金 <em>(<a href='/myaccount'>查看全部</a>) </em>

									<label for="hidezero" class="fund-hide-show">
					<input type="checkbox" id="hidezero"  name='hidezero' style="width: 20px;" />
					<label for="hidezero" class="vr-btn"></label>
									<span class="hidezero-span">隐藏零资金币种</span>
									</label>

								</div>

								<div id="currFunds" class="m_con cjbox" style="border: 1px solid #ddd;background: #fff;">
									<div id="fund-info-box" class="box">
										<div class="list-wrapper">
											<ul class="trade-list_re" id="my-fund-title">
												<li class="number sorting dealtop">
													<span class='right-align my-type'>币种</span>
													<span class='right-align'>可用余额<span style="float: right;padding-right: 28px;">充值/提现</span></span>
													<span class='right-align'>挂单金额</span>
													<span class='right-align'>总计</span>
												</li>
											</ul>
											<div id="myFundCon" style="height: 231px; overflow-y: auto; overflow-x: hidden; text-align: center;position: relative">
												<ul id="my-fund-list" class="trade-list_re" style="height: 3885px">
													<li data-id="zero"><span class="right-align my-type">ABT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ABT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ABT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ADA</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">AE</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/AE">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/AE">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ARN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ARN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ARN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BAT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BAT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BAT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BCD</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BCD">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BCD">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BCDN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BCDN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BCDN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BCH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BCH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BCH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BCX</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BCX">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BFT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BFT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BFT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BIFI</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BLZ</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BLZ">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BLZ">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BNT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BNT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BNT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BNTY</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BNTY">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BNTY">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BOT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BOT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BOT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BTC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BTC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BTC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BTF</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BTG</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BTG">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BTG">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BTM</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BTM">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BTM">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BTM_ETH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BTM_ETH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BTM_ETH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BTO</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BTO">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BTO">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">BTS</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/BTS">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/BTS">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">CDT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/CDT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/CDT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">CNC</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">COFI</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/COFI">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/COFI">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">CS</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/CS">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/CS">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">CTR</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/CTR">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">CVC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/CVC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/CVC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DADI</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DADI">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DADI">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DAI</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DAI">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DAI">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DASH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DASH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DASH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DATA</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DATA">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DATA">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DBC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DBC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DBC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DDD</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DDD">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DDD">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DGD</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DGD">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DGD">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DNT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DNT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DNT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DOCK</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DOCK">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DOCK">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DOGE</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DOGE">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DOGE">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DPY</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DPY">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DPY">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">DRGN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/DRGN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/DRGN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ELEC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ELEC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ELEC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ELF</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ELF">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ELF">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">EOS</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/EOS">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/EOS">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">EOSDAC</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ETC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ETC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ETC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ETF</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ETH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ETH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ETH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">FIL</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">FUEL</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/FUEL">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/FUEL">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">FUN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/FUN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/FUN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">GALA</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/GALA">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/GALA">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">GAS</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/GAS">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/GAS">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">GEM</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/GEM">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/GEM">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">GNT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/GNT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/GNT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">GNX</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/GNX">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/GNX">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">GOD</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">GTC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/GTC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/GTC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">GXS</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/GXS">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/GXS">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">HAV</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/HAV">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/HAV">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">HSR</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/HSR">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/HSR">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">HUR</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/HUR">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/HUR">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ICX</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ICX">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ICX">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">IHT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/IHT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/IHT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">INK</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/INK">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/INK">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">INK_ETH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/INK_ETH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/INK_ETH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">INSTAR</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/INSTAR">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/INSTAR">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">IOTA</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">JNT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/JNT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/JNT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">KICK</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/KICK">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/KICK">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">KNC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/KNC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/KNC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LEDU</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/LEDU">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/LEDU">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LEND</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/LEND">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/LEND">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LINK</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/LINK">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/LINK">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LLT</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/LLT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LRC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/LRC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/LRC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LRN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/LRN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/LRN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LSK</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LST</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/LST">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/LST">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LTC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/LTC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/LTC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LUN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/LUN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/LUN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">LYM</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/LYM">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/LYM">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MAN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MAN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MAN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MANA</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MANA">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MANA">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MCO</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MCO">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MCO">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MDA</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MDA">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MDA">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MDS</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MDS">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MDS">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MDT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MDT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MDT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MED</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MED">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MED">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MITH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MITH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MITH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MKR</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MKR">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MKR">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MKR_OLD</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MOBI</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MOBI">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MOBI">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">MTN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/MTN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/MTN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">NANO</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">NAS</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/NAS">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/NAS">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">NAS_ETH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/NAS_ETH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/NAS_ETH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">NEO</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/NEO">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/NEO">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">OAX</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/OAX">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/OAX">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">OCN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/OCN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/OCN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">OMG</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/OMG">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/OMG">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ONT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ONT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ONT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ONT_S</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">OST</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/OST">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/OST">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">PAY</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/PAY">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/PAY">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">POWR</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/POWR">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/POWR">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">PST</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/PST">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/PST">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">QASH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/QASH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/QASH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">QBT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/QBT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/QBT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">QLC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/QLC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/QLC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">QSP</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/QSP">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/QSP">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">QTUM</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/QTUM">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/QTUM">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">QTUM_ETH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/QTUM_ETH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/QTUM_ETH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">QUN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/QUN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/QUN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">RCN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/RCN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/RCN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">RDN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/RDN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/RDN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">REM</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/REM">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/REM">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">REP</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/REP">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/REP">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">REQ</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/REQ">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/REQ">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">RFR</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/RFR">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/RFR">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">RLC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/RLC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/RLC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">RUFF</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/RUFF">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/RUFF">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">SALT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/SALT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/SALT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">SBTC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/SBTC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/SBTC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">SENC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/SENC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/SENC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">SHIP</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/SHIP">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/SHIP">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">SKM</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/SKM">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/SKM">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">SMT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/SMT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/SMT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">SNET</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/SNET">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/SNET">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">SNT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/SNT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/SNT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">STORJ</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/STORJ">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/STORJ">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">STX</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/STX">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/STX">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">SWTH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/SWTH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/SWTH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">TFD</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/TFD">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/TFD">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">THETA</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/THETA">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/THETA">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">TIO</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/TIO">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/TIO">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">TIPS</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/TIPS">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/TIPS">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">TIX</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">TKY</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/TKY">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/TKY">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">TNC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/TNC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/TNC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">TNT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/TNT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/TNT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">TOMO</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/TOMO">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/TOMO">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">TRX</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/TRX">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/TRX">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">TSL</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/TSL">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/TSL">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">USDT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/USDT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/USDT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">USDT_ETH</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/USDT_ETH">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/USDT_ETH">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">VEN</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/VEN">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/VEN">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">WAVES</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">WINGS</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/WINGS">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/WINGS">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">XLM</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/XLM">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/XLM">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">XMC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/XMC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/XMC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">XMR</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/XMR">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/XMR">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">XRP</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/XRP">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/XRP">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">XTC</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">XTZ</span><span class="right-align "><i>0.000000</i><em><a class="err-depo fund-deposit" title="充值暂停，钱包维护中" href="javascript:;">充暂停</a><a class="err-depo fund-withdraw" title="提现暂停，钱包维护中" href="javascript:;">提暂停</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">XVG</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/XVG">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/XVG">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ZEC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ZEC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ZEC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ZIL</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ZIL">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ZIL">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ZPT</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ZPT">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ZPT">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ZRX</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ZRX">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ZRX">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
													<li data-id="zero"><span class="right-align my-type">ZSC</span><span class="right-align "><i>0.000000</i><em><a class="normal-depo fund-deposit" title="充值正常" href="/myaccount/deposit/ZSC">充值</a><a class="normal-depo fund-withdraw" title="提现正常" href="/myaccount/withdraw/ZSC">提现</a></em></span><span class="right-align ">0.000000</span><span class="right-align">0.000000</span></li>
												</ul>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>
					<!--end of place order box -->

					<div id='sectioncont' class="buy-sell-order clearfix">
						<div id='tableAskList' data-id="sectioncont">

							<div class="mairu">
								<div class="b-s-title clearfix">
									<div class="b-s-t-left">
										最新价 <span class="unit-symbol" id="orderUnitSymbol">฿</span><span class="unit-symbol hide" id="cnySymbol">￥</span>
										<span class="green" id='orderbook_last_rate'>0.0844</span>
									</div>
									<div class="b-s-t-right" id="moreOrders">
										<span>更多<i class="caret"></i></span>
									</div>
								</div>
								<div class="m_con maidan">
									<div class="right-list list">
										<div class="title-line sorting" style="height:30px; margin-top:15px;border-bottom: 1px solid #e4ebf0">
											<span class="right-align price"><b>价格(<span class="currb-unit">BTC</span>)</b>
											</span>
											<span class="volume right-align"><b>数量(ETH)</b></span>
											<span class="total right-align"><b>总计(<span class="currb-unit">BTC</span>)</b>
											</span>
										</div>
										<div id="ask-list">
											<ul id="ul-ask-list" data-id="ask-list">
												<li title='价格: 4640.040541 CNY， 数量：0.0961  ，总计：445.5706 CNY' onclick='set_price(1,0.084351,0.0961,0.0081)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.084351</span>
													<span data-id="volume" class="volume right-align">0.0961</span>
													<span data-id="total" class="right-align total">0.0081</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 1.3730831650665px;"></span>
												</li>
												<li title='价格: 4644.166195 CNY， 数量：0.6351  ，总计：2948.4674 CNY' onclick='set_price(1,0.084426,0.7312,0.0617)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.084426</span>
													<span data-id="volume" class="volume right-align">0.6351</span>
													<span data-id="total" class="right-align total">0.0536</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 3.787505219129px;"></span>
												</li>
												<li title='价格: 4648.621901 CNY， 数量：10.0000  ，总计：46487.8693 CNY' onclick='set_price(1,0.084507,10.7312,0.9068)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.084507</span>
													<span data-id="volume" class="volume right-align">10.0000</span>
													<span data-id="total" class="right-align total">0.8451</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 14.509728731253px;"></span>
												</li>
												<li title='价格: 4654.397817 CNY， 数量：1.0531  ，总计：4901.2770 CNY' onclick='set_price(1,0.084612,11.7843,0.9959)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.084612</span>
													<span data-id="volume" class="volume right-align">1.0531</span>
													<span data-id="total" class="right-align total">0.0891</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 15.205021677123px;"></span>
												</li>
												<li title='价格: 4659.678654 CNY， 数量：4.0000  ，总计：18636.9543 CNY' onclick='set_price(1,0.084708,15.7843,1.3347)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.084708</span>
													<span data-id="volume" class="volume right-align">4.0000</span>
													<span data-id="total" class="right-align total">0.3388</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 17.597371878483px;"></span>
												</li>
												<li title='价格: 4661.603959 CNY， 数量：1.1661  ，总计：5434.8615 CNY' onclick='set_price(1,0.084743,16.9504,1.4335)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.084743</span>
													<span data-id="volume" class="volume right-align">1.1661</span>
													<span data-id="total" class="right-align total">0.0988</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 18.235812755105px;"></span>
												</li>
												<li title='价格: 4667.489892 CNY， 数量：36.3830  ，总计：169817.4195 CNY' onclick='set_price(1,0.084850,53.3334,4.5206)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.084850</span>
													<span data-id="volume" class="volume right-align">36.3830</span>
													<span data-id="total" class="right-align total">3.0871</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 32.34705775829px;"></span>
												</li>
												<li title='价格: 4675.686191 CNY， 数量：5.0000  ，总计：23378.7060 CNY' onclick='set_price(1,0.084999,58.3334,4.9456)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.084999</span>
													<span data-id="volume" class="volume right-align">5.0000</span>
													<span data-id="total" class="right-align total">0.4250</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 33.829360940652px;"></span>
												</li>
												<li title='价格: 4675.741200 CNY， 数量：0.5351  ，总计：2502.8968 CNY' onclick='set_price(1,0.085000,58.8685,4.9911)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.085000</span>
													<span data-id="volume" class="volume right-align">0.5351</span>
													<span data-id="total" class="right-align total">0.0455</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 33.984167339203px;"></span>
												</li>
												<li title='价格: 4681.737150 CNY， 数量：45.8500  ，总计：214660.5281 CNY' onclick='set_price(1,0.085109,104.7185,8.8934)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.085109</span>
													<span data-id="volume" class="volume right-align">45.8500</span>
													<span data-id="total" class="right-align total">3.9023</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 45.325943694292px;"></span>
												</li>
												<li title='价格: 4681.792159 CNY， 数量：0.2442  ，总计：1144.1814 CNY' onclick='set_price(1,0.085110,104.9627,8.9142)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.085110</span>
													<span data-id="volume" class="volume right-align">0.2442</span>
													<span data-id="total" class="right-align total">0.0208</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 45.378762203274px;"></span>
												</li>
												<li title='价格: 4692.463851 CNY， 数量：3.6930  ，总计：17327.7468 CNY' onclick='set_price(1,0.085304,108.6557,9.2292)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.085304</span>
													<span data-id="volume" class="volume right-align">3.6930</span>
													<span data-id="total" class="right-align total">0.3150</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 46.170162768227px;"></span>
												</li>
												<li title='价格: 4702.145386 CNY， 数量：1.0000  ，总计：4703.2456 CNY' onclick='set_price(1,0.085480,109.6557,9.3147)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.085480</span>
													<span data-id="volume" class="volume right-align">1.0000</span>
													<span data-id="total" class="right-align total">0.0855</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 46.382137006088px;"></span>
												</li>
												<li title='价格: 4703.245560 CNY， 数量：0.0543  ，总计：253.0401 CNY' onclick='set_price(1,0.085500,109.7100,9.3193)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.085500</span>
													<span data-id="volume" class="volume right-align">0.0543</span>
													<span data-id="total" class="right-align total">0.0046</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 46.393619484102px;"></span>
												</li>
												<li title='价格: 4714.247304 CNY， 数量：0.0364  ，总计：170.5270 CNY' onclick='set_price(1,0.085700,109.7464,9.3224)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.085700</span>
													<span data-id="volume" class="volume right-align">0.0364</span>
													<span data-id="total" class="right-align total">0.0031</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 46.401315171366px;"></span>
												</li>
												<li title='价格: 4717.162766 CNY， 数量：0.1613  ，总计：759.1203 CNY' onclick='set_price(1,0.085753,109.9077,9.3362)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.085753</span>
													<span data-id="volume" class="volume right-align">0.1613</span>
													<span data-id="total" class="right-align total">0.0138</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 46.43540186603px;"></span>
												</li>
												<li title='价格: 4718.648002 CNY， 数量：0.0440  ，总计：209.0331 CNY' onclick='set_price(1,0.085780,109.9517,9.3400)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.085780</span>
													<span data-id="volume" class="volume right-align">0.0440</span>
													<span data-id="total" class="right-align total">0.0038</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 46.44469581557px;"></span>
												</li>
												<li title='价格: 4718.923045 CNY， 数量：23.0000  ，总计：108537.7054 CNY' onclick='set_price(1,0.085785,132.9517,11.3131)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.085785</span>
													<span data-id="volume" class="volume right-align">23.0000</span>
													<span data-id="total" class="right-align total">1.9731</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 51.071909531179px;"></span>
												</li>
												<li title='价格: 4719.748176 CNY， 数量：0.7375  ，总计：3482.0520 CNY' onclick='set_price(1,0.085800,133.6892,11.3764)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.085800</span>
													<span data-id="volume" class="volume right-align">0.7375</span>
													<span data-id="total" class="right-align total">0.0633</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 51.213364825756px;"></span>
												</li>
												<li title='价格: 4721.123394 CNY， 数量：0.4271  ，总计：2018.8200 CNY' onclick='set_price(1,0.085825,134.1163,11.4131)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.085825</span>
													<span data-id="volume" class="volume right-align">0.4271</span>
													<span data-id="total" class="right-align total">0.0367</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 51.29510585734px;"></span>
												</li>
												<li title='价格: 4730.749920 CNY， 数量：12.0613  ，总计：57060.5453 CNY' onclick='set_price(1,0.086000,146.1776,12.4504)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.086000</span>
													<span data-id="volume" class="volume right-align">12.0613</span>
													<span data-id="total" class="right-align total">1.0373</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 53.551983622512px;"></span>
												</li>
												<li title='价格: 4731.850094 CNY， 数量：0.0940  ，总计：445.5706 CNY' onclick='set_price(1,0.086020,146.2716,12.4585)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.086020</span>
													<span data-id="volume" class="volume right-align">0.0940</span>
													<span data-id="total" class="right-align total">0.0081</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 53.569199247397px;"></span>
												</li>
												<li title='价格: 4732.455190 CNY， 数量：1.0600  ，总计：5016.7953 CNY' onclick='set_price(1,0.086031,147.3316,12.5497)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.086031</span>
													<span data-id="volume" class="volume right-align">1.0600</span>
													<span data-id="total" class="right-align total">0.0912</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 53.762951308561px;"></span>
												</li>
												<li title='价格: 4738.121088 CNY， 数量：0.5700  ，总计：2700.9282 CNY' onclick='set_price(1,0.086134,147.9016,12.5988)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.086134</span>
													<span data-id="volume" class="volume right-align">0.5700</span>
													<span data-id="total" class="right-align total">0.0491</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 53.866850606237px;"></span>
												</li>
												<li title='价格: 4738.176097 CNY， 数量：0.1000  ，总计：473.0750 CNY' onclick='set_price(1,0.086135,148.0016,12.6074)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.086135</span>
													<span data-id="volume" class="volume right-align">0.1000</span>
													<span data-id="total" class="right-align total">0.0086</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 53.885057896928px;"></span>
												</li>
												<li title='价格: 4738.836202 CNY， 数量：1.0000  ，总计：4736.2508 CNY' onclick='set_price(1,0.086147,149.0016,12.6935)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.086147</span>
													<span data-id="volume" class="volume right-align">1.0000</span>
													<span data-id="total" class="right-align total">0.0861</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 54.066793577595px;"></span>
												</li>
												<li title='价格: 4752.753408 CNY， 数量：0.1001  ，总计：473.0750 CNY' onclick='set_price(1,0.086400,149.1017,12.7021)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.086400</span>
													<span data-id="volume" class="volume right-align">0.1001</span>
													<span data-id="total" class="right-align total">0.0086</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 54.084951695951px;"></span>
												</li>
												<li title='价格: 4769.256024 CNY， 数量：0.0023  ，总计：11.0017 CNY' onclick='set_price(1,0.086700,149.1040,12.7023)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.086700</span>
													<span data-id="volume" class="volume right-align">0.0023</span>
													<span data-id="total" class="right-align total">0.0002</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 54.085368843807px;"></span>
												</li>
												<li title='价格: 4771.951451 CNY， 数量：5.0000  ，总计：23857.2819 CNY' onclick='set_price(1,0.086749,154.1040,13.1360)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.086749</span>
													<span data-id="volume" class="volume right-align">5.0000</span>
													<span data-id="total" class="right-align total">0.4337</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 54.984730962382px;"></span>
												</li>
												<li title='价格: 4773.876756 CNY， 数量：0.0076  ，总计：38.5061 CNY' onclick='set_price(1,0.086784,154.1116,13.1367)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.086784</span>
													<span data-id="volume" class="volume right-align">0.0076</span>
													<span data-id="total" class="right-align total">0.0007</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 54.986086796115px;"></span>
												</li>
												<li title='价格: 4776.352149 CNY， 数量：0.0780  ，总计：374.0593 CNY' onclick='set_price(1,0.086829,154.1896,13.1435)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.086829</span>
													<span data-id="volume" class="volume right-align">0.0780</span>
													<span data-id="total" class="right-align total">0.0068</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 55px;"></span>
												</li>
												<li title='价格: 4788.344050 CNY， 数量：1.0000  ，总计：4785.7586 CNY' onclick='set_price(1,0.087047,155.1896,13.2305)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.087047</span>
													<span data-id="volume" class="volume right-align">1.0000</span>
													<span data-id="total" class="right-align total">0.0870</span>
													<span data-id="rect" class="right-align rect down orange" style="width: 55.178063605086px;"></span>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="maichu">
								<div class="m_con maidan">
									<div class="right-list list">
										<div id="bid-list">
											<ul id="ul-bid-list" data-id="bid-list">
												<li title='价格: 4623.537925 CNY， 数量：20.0000  ，总计：92469.6583 CNY' onclick='set_price(0,0.084051,20.0000,1.6810)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.084051</span>
													<span data-id="volume" class="right-align volume">20.0000</span>
													<span data-id="total" class="right-align total">1.6810</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 19.12253364403px;"></span>
												</li>
												<li title='价格: 4622.987838 CNY， 数量：0.4949  ，总计：2288.3628 CNY' onclick='set_price(0,0.084041,20.4949,1.7226)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.084041</span>
													<span data-id="volume" class="right-align volume">0.4949</span>
													<span data-id="total" class="right-align total">0.0416</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 19.357701934656px;"></span>
												</li>
												<li title='价格: 4606.485222 CNY， 数量：2.8000  ，总计：12899.5448 CNY' onclick='set_price(0,0.083741,23.2949,1.9571)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.083741</span>
													<span data-id="volume" class="right-align volume">2.8000</span>
													<span data-id="total" class="right-align total">0.2345</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 20.63327114943px;"></span>
												</li>
												<li title='价格: 4606.430213 CNY， 数量：36.3830  ，总计：167595.0672 CNY' onclick='set_price(0,0.083740,59.6779,5.0038)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.083740</span>
													<span data-id="volume" class="right-align volume">36.3830</span>
													<span data-id="total" class="right-align total">3.0467</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 32.99222066607px;"></span>
												</li>
												<li title='价格: 4604.449899 CNY， 数量：0.1500  ，总计：693.1099 CNY' onclick='set_price(0,0.083704,59.8279,5.0164)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.083704</span>
													<span data-id="volume" class="right-align volume">0.1500</span>
													<span data-id="total" class="right-align total">0.0126</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 33.03373317816px;"></span>
												</li>
												<li title='价格: 4598.288922 CNY， 数量：0.1006  ，总计：462.0732 CNY' onclick='set_price(0,0.083592,59.9285,5.0248)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.083592</span>
													<span data-id="volume" class="right-align volume">0.1006</span>
													<span data-id="total" class="right-align total">0.0084</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 33.0613792285px;"></span>
												</li>
												<li title='价格: 4595.428469 CNY， 数量：2.2330  ，总计：10259.1263 CNY' onclick='set_price(0,0.083540,62.1615,5.2113)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.083540</span>
													<span data-id="volume" class="right-align volume">2.2330</span>
													<span data-id="total" class="right-align total">0.1865</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 33.66934086967px;"></span>
												</li>
												<li title='价格: 4594.163268 CNY， 数量：0.3315  ，总计：1523.7415 CNY' onclick='set_price(0,0.083517,62.4930,5.2390)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.083517</span>
													<span data-id="volume" class="right-align volume">0.3315</span>
													<span data-id="total" class="right-align total">0.0277</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 33.758704818372px;"></span>
												</li>
												<li title='价格: 4593.778207 CNY， 数量：0.1712  ，总计：786.6247 CNY' onclick='set_price(0,0.083510,62.6642,5.2533)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.083510</span>
													<span data-id="volume" class="right-align volume">0.1712</span>
													<span data-id="total" class="right-align total">0.0143</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 33.804746096106px;"></span>
												</li>
												<li title='价格: 4593.283129 CNY， 数量：0.0500  ，总计：231.0366 CNY' onclick='set_price(0,0.083501,62.7142,5.2575)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.083501</span>
													<span data-id="volume" class="right-align volume">0.0500</span>
													<span data-id="total" class="right-align total">0.0042</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 33.8182568005px;"></span>
												</li>
												<li title='价格: 4593.228120 CNY， 数量：3.1040  ，总计：14258.2602 CNY' onclick='set_price(0,0.083500,65.8182,5.5167)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.083500</span>
													<span data-id="volume" class="right-align volume">3.1040</span>
													<span data-id="total" class="right-align total">0.2592</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 34.641864666523px;"></span>
												</li>
												<li title='价格: 4583.931646 CNY， 数量：5.0000  ，总计：22922.1336 CNY' onclick='set_price(0,0.083331,70.8182,5.9334)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.083331</span>
													<span data-id="volume" class="right-align volume">5.0000</span>
													<span data-id="total" class="right-align total">0.4167</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 35.926374326022px;"></span>
												</li>
												<li title='价格: 4583.876638 CNY， 数量：0.0612  ，总计：280.5445 CNY' onclick='set_price(0,0.083330,70.8794,5.9385)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.083330</span>
													<span data-id="volume" class="right-align volume">0.0612</span>
													<span data-id="total" class="right-align total">0.0051</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 35.941811103732px;"></span>
												</li>
												<li title='价格: 4582.226376 CNY， 数量：0.3000  ，总计：1375.2180 CNY' onclick='set_price(0,0.083300,71.1794,5.9635)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.083300</span>
													<span data-id="volume" class="right-align volume">0.3000</span>
													<span data-id="total" class="right-align total">0.0250</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 36.01738587725px;"></span>
												</li>
												<li title='价格: 4576.780513 CNY， 数量：70.8626  ，总计：324320.4114 CNY' onclick='set_price(0,0.083201,142.0420,11.8593)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.083201</span>
													<span data-id="volume" class="right-align volume">70.8626</span>
													<span data-id="total" class="right-align total">5.8958</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 50.791507699837px;"></span>
												</li>
												<li title='价格: 4576.725504 CNY， 数量：0.0050  ，总计：22.0035 CNY' onclick='set_price(0,0.083200,142.0470,11.8597)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.083200</span>
													<span data-id="volume" class="right-align volume">0.0050</span>
													<span data-id="total" class="right-align total">0.0004</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 50.792364261007px;"></span>
												</li>
												<li title='价格: 4565.833777 CNY， 数量：10.9732  ，总计：50101.9422 CNY' onclick='set_price(0,0.083002,153.0202,12.7705)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.083002</span>
													<span data-id="volume" class="right-align volume">10.9732</span>
													<span data-id="total" class="right-align total">0.9108</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 52.706663841935px;"></span>
												</li>
												<li title='价格: 4565.723760 CNY， 数量：2.0000  ，总计：9131.4475 CNY' onclick='set_price(0,0.083000,155.0202,12.9365)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.083000</span>
													<span data-id="volume" class="right-align volume">2.0000</span>
													<span data-id="total" class="right-align total">0.1660</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.048117077256px;"></span>
												</li>
												<li title='价格: 4547.955943 CNY， 数量：0.1624  ，总计：737.1168 CNY' onclick='set_price(0,0.082677,155.1826,12.9499)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.082677</span>
													<span data-id="volume" class="right-align volume">0.1624</span>
													<span data-id="total" class="right-align total">0.0134</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.07558435147px;"></span>
												</li>
												<li title='价格: 4540.749801 CNY， 数量：0.1150  ，总计：522.5828 CNY' onclick='set_price(0,0.082546,155.2976,12.9594)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.082546</span>
													<span data-id="volume" class="right-align volume">0.1150</span>
													<span data-id="total" class="right-align total">0.0095</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.095048811122px;"></span>
												</li>
												<li title='价格: 4540.639784 CNY， 数量：1.2320  ，总计：5594.3868 CNY' onclick='set_price(0,0.082544,156.5296,13.0611)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.082544</span>
													<span data-id="volume" class="right-align volume">1.2320</span>
													<span data-id="total" class="right-align total">0.1017</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.302975645961px;"></span>
												</li>
												<li title='价格: 4538.219400 CNY， 数量：1.6840  ，总计：7640.7112 CNY' onclick='set_price(0,0.082500,158.2136,13.2000)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.082500</span>
													<span data-id="volume" class="right-align volume">1.6840</span>
													<span data-id="total" class="right-align total">0.1389</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.58565486764px;"></span>
												</li>
												<li title='价格: 4535.468964 CNY， 数量：0.0038  ，总计：16.5026 CNY' onclick='set_price(0,0.082450,158.2174,13.2003)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.082450</span>
													<span data-id="volume" class="right-align volume">0.0038</span>
													<span data-id="total" class="right-align total">0.0003</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.586263792077px;"></span>
												</li>
												<li title='价格: 4527.217656 CNY， 数量：0.1030  ，总计：467.5741 CNY' onclick='set_price(0,0.082300,158.3204,13.2088)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.082300</span>
													<span data-id="volume" class="right-align volume">0.1030</span>
													<span data-id="total" class="right-align total">0.0085</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.603513776607px;"></span>
												</li>
												<li title='价格: 4516.160903 CNY， 数量：0.0300  ，总计：137.5218 CNY' onclick='set_price(0,0.082099,158.3504,13.2113)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.082099</span>
													<span data-id="volume" class="right-align volume">0.0300</span>
													<span data-id="total" class="right-align total">0.0025</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.608586245119px;"></span>
												</li>
												<li title='价格: 4510.715040 CNY， 数量：1.0000  ，总计：4510.7150 CNY' onclick='set_price(0,0.082000,159.3504,13.2933)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.082000</span>
													<span data-id="volume" class="right-align volume">1.0000</span>
													<span data-id="total" class="right-align total">0.0820</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.774697983787px;"></span>
												</li>
												<li title='价格: 4488.711552 CNY， 数量：0.0023  ，总计：11.0017 CNY' onclick='set_price(0,0.081600,159.3527,13.2935)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.081600</span>
													<span data-id="volume" class="right-align volume">0.0023</span>
													<span data-id="total" class="right-align total">0.0002</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.775102507086px;"></span>
												</li>
												<li title='价格: 4472.208936 CNY， 数量：0.1369  ，总计：610.5968 CNY' onclick='set_price(0,0.081300,159.4896,13.3046)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.081300</span>
													<span data-id="volume" class="right-align volume">0.1369</span>
													<span data-id="total" class="right-align total">0.0111</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 53.797548781092px;"></span>
												</li>
												<li title='价格: 4455.706320 CNY， 数量：4.3209  ，总计：19253.0520 CNY' onclick='set_price(0,0.081000,163.8105,13.6546)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.081000</span>
													<span data-id="volume" class="right-align volume">4.3209</span>
													<span data-id="total" class="right-align total">0.3500</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 54.500572979147px;"></span>
												</li>
												<li title='价格: 4455.431276 CNY， 数量：3.1009  ，总计：13818.1905 CNY' onclick='set_price(0,0.080995,166.9114,13.9058)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.080995</span>
													<span data-id="volume" class="right-align volume">3.1009</span>
													<span data-id="total" class="right-align total">0.2512</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 54.99960448585px;"></span>
												</li>
												<li title='价格: 4441.954140 CNY， 数量：0.0023  ，总计：11.0017 CNY' onclick='set_price(0,0.080750,166.9137,13.9060)' class='orderline odd hanga'> <span data-id="price" class="price right-align">0.080750</span>
													<span data-id="volume" class="right-align volume">0.0023</span>
													<span data-id="total" class="right-align total">0.0002</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 55px;"></span>
												</li>
												<li title='价格: 4441.404053 CNY， 数量：1.0000  ，总计：4439.2037 CNY' onclick='set_price(0,0.080740,167.9137,13.9867)' class='orderline even hangb'> <span data-id="price" class="price right-align">0.080740</span>
													<span data-id="volume" class="right-align volume">1.0000</span>
													<span data-id="total" class="right-align total">0.0807</span>
													<span data-id="rect" class="right-align rect down fenlv" style="width: 55.159358520984px;"></span>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="chengjiao">
							<div class="bottom_maidan">
								<div class="m_title" style="margin:18px 0 0">
									最新成交
									<ul class="high-low">
										<li>
											最高价: <b id="tHigh">0.08601</b>
										</li>
										<li>
											最低价: <b id="tLow">0.083404</b>
										</li>
									</ul>
								</div>

								<div class="m_con maidan cjbox" id="sectioncont-history">
									<div id="deal-info-box" class="box">
										<div class="list-wrapper">
											<ul class="trade-list_re">
												<li class="number sorting dealtop">
													<span class="time">时间</span>
													<!--<span class="type">交易类型</span>-->
													<span class="price">成交价(<span class="currb-unit">BTC</span>)</span>
													<span class="amount">成交量(ETH)</span>
													<span class="total">总计(<span class="currb-unit">BTC</span>)</span>
												</li>
											</ul>
											<div id="trade-list">
												<ul id="ul-trade-list" data-id='trade-list' class='trade-list_re' style='height: 553px; overflow: hidden;'>
													<li data-id="list-item" tid="61873305" class="up"><span class="time" data-id="time">16:17:06</span><span class="price" data-id="price">0.084372</span><span class="amount" data-id="amount">4.9170</span><span class="total" data-id="total">0.4149</span></li>
													<li data-id="list-item" tid="61872669" class="up"><span class="time" data-id="time">16:14:47</span><span class="price" data-id="price">0.084374</span><span class="amount" data-id="amount">1.0726</span><span class="total" data-id="total">0.0905</span></li>
													<li data-id="list-item" tid="61872353" class="down"><span class="time" data-id="time">16:13:35</span><span class="price" data-id="price">0.084280</span><span class="amount" data-id="amount">0.1716</span><span class="total" data-id="total">0.0145</span></li>
													<li data-id="list-item" tid="61872225" class="up"><span class="time" data-id="time">16:13:12</span><span class="price" data-id="price">0.084472</span><span class="amount" data-id="amount">0.0060</span><span class="total" data-id="total">0.0005</span></li>
													<li data-id="list-item" tid="61872163" class="up"><span class="time" data-id="time">16:13:02</span><span class="price" data-id="price">0.084509</span><span class="amount" data-id="amount">0.0420</span><span class="total" data-id="total">0.0035</span></li>
													<li data-id="list-item" tid="61872060" class="up"><span class="time" data-id="time">16:12:47</span><span class="price" data-id="price">0.084573</span><span class="amount" data-id="amount">0.0035</span><span class="total" data-id="total">0.0003</span></li>
													<li data-id="list-item" tid="61871898" class="down"><span class="time" data-id="time">16:12:18</span><span class="price" data-id="price">0.084280</span><span class="amount" data-id="amount">0.2366</span><span class="total" data-id="total">0.0199</span></li>
													<li data-id="list-item" tid="61871856" class="up"><span class="time" data-id="time">16:12:13</span><span class="price" data-id="price">0.084280</span><span class="amount" data-id="amount">0.4670</span><span class="total" data-id="total">0.0394</span></li>
													<li data-id="list-item" tid="61871182" class="up"><span class="time" data-id="time">16:09:51</span><span class="price" data-id="price">0.084280</span><span class="amount" data-id="amount">1.5153</span><span class="total" data-id="total">0.1277</span></li>
													<li data-id="list-item" tid="61871181" class="up"><span class="time" data-id="time">16:09:50</span><span class="price" data-id="price">0.084140</span><span class="amount" data-id="amount">0.0092</span><span class="total" data-id="total">0.0008</span></li>
													<li data-id="list-item" tid="61870366" class="down"><span class="time" data-id="time">16:07:07</span><span class="price" data-id="price">0.083811</span><span class="amount" data-id="amount">6.6457</span><span class="total" data-id="total">0.5570</span></li>
													<li data-id="list-item" tid="61870252" class="up"><span class="time" data-id="time">16:06:45</span><span class="price" data-id="price">0.084140</span><span class="amount" data-id="amount">0.0214</span><span class="total" data-id="total">0.0018</span></li>
													<li data-id="list-item" tid="61869249" class="down"><span class="time" data-id="time">16:03:43</span><span class="price" data-id="price">0.084270</span><span class="amount" data-id="amount">0.9579</span><span class="total" data-id="total">0.0807</span></li>
													<li data-id="list-item" tid="61869233" class="up"><span class="time" data-id="time">16:03:41</span><span class="price" data-id="price">0.083918</span><span class="amount" data-id="amount">0.0001</span><span class="total" data-id="total">0.0000</span></li>
													<li data-id="list-item" tid="61869075" class="down"><span class="time" data-id="time">16:03:13</span><span class="price" data-id="price">0.083951</span><span class="amount" data-id="amount">0.5000</span><span class="total" data-id="total">0.0420</span></li>
													<li data-id="list-item" tid="61868957" class="up"><span class="time" data-id="time">16:02:43</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.0006</span><span class="total" data-id="total">0.0000</span></li>
													<li data-id="list-item" tid="61868952" class="up"><span class="time" data-id="time">16:02:42</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.2208</span><span class="total" data-id="total">0.0185</span></li>
													<li data-id="list-item" tid="61868951" class="up"><span class="time" data-id="time">16:02:42</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.6980</span><span class="total" data-id="total">0.0586</span></li>
													<li data-id="list-item" tid="61868877" class="down"><span class="time" data-id="time">16:02:34</span><span class="price" data-id="price">0.083899</span><span class="amount" data-id="amount">0.0194</span><span class="total" data-id="total">0.0016</span></li>
													<li data-id="list-item" tid="61868869" class="up"><span class="time" data-id="time">16:02:34</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.1280</span><span class="total" data-id="total">0.0107</span></li>
													<li data-id="list-item" tid="61868861" class="up"><span class="time" data-id="time">16:02:31</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.3260</span><span class="total" data-id="total">0.0274</span></li>
													<li data-id="list-item" tid="61868840" class="up"><span class="time" data-id="time">16:02:30</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.8330</span><span class="total" data-id="total">0.0699</span></li>
													<li data-id="list-item" tid="61868558" class="up"><span class="time" data-id="time">16:01:30</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.0379</span><span class="total" data-id="total">0.0032</span></li>
													<li data-id="list-item" tid="61868545" class="up"><span class="time" data-id="time">16:01:29</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.4167</span><span class="total" data-id="total">0.0350</span></li>
													<li data-id="list-item" tid="61868529" class="up"><span class="time" data-id="time">16:01:27</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.5000</span><span class="total" data-id="total">0.0420</span></li>
													<li data-id="list-item" tid="61868515" class="up"><span class="time" data-id="time">16:01:24</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.1650</span><span class="total" data-id="total">0.0138</span></li>
													<li data-id="list-item" tid="61868384" class="up"><span class="time" data-id="time">16:00:54</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">1.6540</span><span class="total" data-id="total">0.1388</span></li>
													<li data-id="list-item" tid="61868323" class="up"><span class="time" data-id="time">16:00:41</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.0800</span><span class="total" data-id="total">0.0067</span></li>
													<li data-id="list-item" tid="61868118" class="up"><span class="time" data-id="time">15:59:52</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.0800</span><span class="total" data-id="total">0.0067</span></li>
													<li data-id="list-item" tid="61868033" class="up"><span class="time" data-id="time">15:59:27</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.0045</span><span class="total" data-id="total">0.0004</span></li>
													<li data-id="list-item" tid="61868028" class="up"><span class="time" data-id="time">15:59:26</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.1460</span><span class="total" data-id="total">0.0123</span></li>
													<li data-id="list-item" tid="61868022" class="up"><span class="time" data-id="time">15:59:25</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.1804</span><span class="total" data-id="total">0.0151</span></li>
													<li data-id="list-item" tid="61867958" class="up"><span class="time" data-id="time">15:59:15</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.1330</span><span class="total" data-id="total">0.0112</span></li>
													<li data-id="list-item" tid="61867945" class="up"><span class="time" data-id="time">15:59:14</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.1410</span><span class="total" data-id="total">0.0118</span></li>
													<li data-id="list-item" tid="61867930" class="up"><span class="time" data-id="time">15:59:11</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.2200</span><span class="total" data-id="total">0.0185</span></li>
													<li data-id="list-item" tid="61867860" class="up"><span class="time" data-id="time">15:58:58</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.1320</span><span class="total" data-id="total">0.0111</span></li>
													<li data-id="list-item" tid="61867754" class="up"><span class="time" data-id="time">15:58:34</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">8.8497</span><span class="total" data-id="total">0.7425</span></li>
													<li data-id="list-item" tid="61867497" class="up"><span class="time" data-id="time">15:57:35</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.3270</span><span class="total" data-id="total">0.0274</span></li>
													<li data-id="list-item" tid="61867492" class="up"><span class="time" data-id="time">15:57:34</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">2.0000</span><span class="total" data-id="total">0.1678</span></li>
													<li data-id="list-item" tid="61867462" class="up"><span class="time" data-id="time">15:57:25</span><span class="price" data-id="price">0.083900</span><span class="amount" data-id="amount">0.3340</span><span class="total" data-id="total">0.0280</span></li>
												</ul>
											</div>
										</div>
										<template data-id="list-item-tpl">
											<li data-id="list-item" tid="" class="number">
												<span class="time" data-id="time"></span>
												<span class="type" data-id="type"></span>
												<span class="price" data-id="price"></span>
												<span class="amount" data-id="amount"></span>
												<span class="total" data-id="total"></span>
												<!--<span class="right-align rect" data-id="rect"></span>-->
											</li>
										</template>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!--end of order lists -->

				</div>
				<!--end of right content-->
			</div>
			<!-- end of main content-->

		</div>
		<!-- content -->

		<div class="footer">
			<div class="fkicon">
				<ul class="clearfix">
					<li>
						<a href="javascript:ticketsRoute();" title="Ticket">
							<div class="fico fc5"></div>
							<div class="fkcont">
								<div class="ftel">Ticket</div>
								<div class="ftelnum">Submit a request</div>
							</div>
						</a>
					</li>
					<li>
						<a href="https://twitter.com/gate_io" target="_blank" title="Twitter">
							<div class="fico fc-twi"></div>
							<div class="fkcont">
								<div class="ftel">Twitter</div>
								<div class="ftelnum">twitter.com/gate_io</div>
							</div>
						</a>
					</li>
					<li>
						<a href="https://t.me/gate_io" target="_blank" title="Telegram">
							<div class="fico fc3"></div>
						</a>
					</li>
					<li>
						<a href="https://www.instagram.com/gate.io/" target="_blank" title="Instagram">
							<div class="fico fc7"></div>
						</a>
					</li>
					<li>
						<a href="mailto:support@mail.gate.io" target="_blank" title="Email">
							<div class="fico fc6"></div>
							<div class="fkcont">
								<div class="ftel">Email</div>
								<div class="ftelnum">Email us</div>
							</div>
						</a>
					</li>
					<li>
						<a href="https://github.com/gateio" target="_blank" title="Github">
							<div class="fico fc4"></div>
							<div class="fkcont">
								<div class="ftel">Github</div>
								<div class="ftelnum">gate.io Github</div>
							</div>
						</a>
					</li>
				</ul>
				<div class="fxts">
					<p style="text-align: center"><i>!</i>比特币等密码币的交易存在风险，在全球范围内一周7天，一天24小时无休止交易，没有每日涨停跌停限制，价格受到新闻事件，各国政策，市场需求等多种因素影响，浮动很大。我们强烈建议您事先调查了解，在自身所能承受的风险范围内参与交易。</p>
				</div>
			</div>

			<div class="fnav">
				<div class="fnavcon">
					<ul>
						<li class="fnav_list">
							<!--<div class="fnav_title">关于我们</div>-->
							<ul>
								<li>
									<a href="/page/contacts">联系我们</a>
								</li>
								<li>
									<a href="/fee">费率标准</a>
								</li>
								<li>
									<a href="/api2">API文档</a>
								</li>
								<li>
									<a href="/docs/agreement.pdf">用户协议</a>
								</li>
								<li>
									<a href="/articlelist/ann">本站公告</a>
								</li>
							</ul>
						</li>

					</ul>
				</div>
				<div class="tail">
					<span>gate.io&nbsp;&nbsp;版权所有 © 2018</span>
					<div class="vol-all">
						<span>成交量:</span>
						<span> USDT : $<span id="usdtAll">124632754</span> </span>
						<span> BTC : ฿<span id="btcAll">655</span> </span>
						<span> LTC : Ł<span id="ltcAll">2721</span> </span>
						<span> ETH : E<span id="ethAll">30297</span> </span>
					</div>
					<span id="runTime">
                <!--<a href="#">gate.io</a> is powered by <a href="#">gate.io Dev Team</a>-->
                <span class="admin-view"> Elapsed:39.444ms - .234;cnst:1.0;t:0.2;s1:0.0;bl:0.0;s2:0.0;s3:0.1;f:1.6;3:17.9;422noc:4.8;4:4.9;5:2.4;61:0.1;62:1.6;6:1.7;<br>h:2.0;8:2.1;9:0.3;10:0.7;11:0.0;12:0.2;13:1.8;14:0.4;w:0.0;c:0.0;n:0.0;g:0.4;run:37.1; p:.234 &nbsp; a/e/r </span>
					</span>
				</div>
			</div>
		</div>


		<script>
			//force user to use https
			//  if ('https:' != document.location.protocol) { window.location = 'https://' + window.location.hostname + window.location.pathname; }

			//for footer
			var tier_next_progress = '0.0';

			$("#usdtAll").text(toThousands(124632754));
			$("#btcAll").text(toThousands(655));
			$("#ltcAll").text(toThousands(2721));
			$("#ethAll").text(toThousands(30297));
			is_login = 'zuoyehengudan' != '';
		</script>

		<script>
			var currA = 'ETH',
				currB = 'BTC',
				base = 'BTC',
				customBase = '',
				listDataDefault = null;
			listDataDefault = {
				"eth_btc": {
					"no": 2,
					"symbol": "ETH",
					"name": "Ethereum",
					"name_en": "Ethereum",
					"name_cn": "\u4ee5\u592a\u5e01",
					"pair": "eth_btc",
					"rate": "0.0844",
					"vol_a": "508.420612571",
					"vol_b": "43.04",
					"curr_a": "ETH",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-1.43",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-1.43 %<\/font>",
					"trend": "down",
					"supply": 94886500,
					"marketcap": "8,005,764",
					"coin_icon": ""
				},
				"btm_btc": {
					"no": 17,
					"symbol": "BTM",
					"name": "Bytom",
					"name_en": "Bytom",
					"name_cn": "\u6bd4\u539f\u94fe",
					"pair": "btm_btc",
					"rate": "0.0000902",
					"vol_a": "276244.3684573779",
					"vol_b": "24.06",
					"curr_a": "BTM",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "22.06",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+22.06 %<\/font>",
					"trend": "up",
					"supply": 2100000000,
					"marketcap": "189,420",
					"coin_icon": ""
				},
				"gtc_btc": {
					"no": 43,
					"symbol": "GTC",
					"name": "Game.com",
					"name_en": "Game.com",
					"name_cn": "G\u5e01",
					"pair": "gtc_btc",
					"rate": "0.0000208",
					"vol_a": "772859.4542123928",
					"vol_b": "15.98",
					"curr_a": "GTC",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "1.47",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+1.47 %<\/font>",
					"trend": "up",
					"supply": 2000000000,
					"marketcap": "41,500",
					"coin_icon": ""
				},
				"doge_btc": {
					"no": 37,
					"symbol": "DOGE",
					"name": "DogeCoin",
					"name_en": "DogeCoin",
					"name_cn": "\u72d7\u72d7\u5e01",
					"pair": "doge_btc",
					"rate": "0.00000050",
					"vol_a": "23027068.9584072401",
					"vol_b": "11.70",
					"curr_a": "DOGE",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-1.96",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-1.96 %<\/font>",
					"trend": "down",
					"supply": 111630000000,
					"marketcap": "55,815",
					"coin_icon": ""
				},
				"lym_btc": {
					"no": 53,
					"symbol": "LYM",
					"name": "Lympo",
					"name_en": "Lympo",
					"name_cn": "Lympo",
					"pair": "lym_btc",
					"rate": "0.0000111",
					"vol_a": "1024340.28907535",
					"vol_b": "11.38",
					"curr_a": "LYM",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.18",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.18 %<\/font>",
					"trend": "down",
					"supply": 1000000000,
					"marketcap": "11,100",
					"coin_icon": ""
				},
				"eos_btc": {
					"no": 5,
					"symbol": "EOS",
					"name": "EOS",
					"name_en": "EOS",
					"name_cn": "EOS",
					"pair": "eos_btc",
					"rate": "0.001639",
					"vol_a": "5581.41106118",
					"vol_b": "9.14",
					"curr_a": "EOS",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "0.42",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+0.42 %<\/font>",
					"trend": "up",
					"supply": 1000000000,
					"marketcap": "1,639,200",
					"coin_icon": ""
				},
				"nas_btc": {
					"no": 29,
					"symbol": "NAS",
					"name": "Nebulas",
					"name_en": "Nebulas",
					"name_cn": "\u661f\u4e91\u94fe",
					"pair": "nas_btc",
					"rate": "0.000916",
					"vol_a": "9482.1019911",
					"vol_b": "8.39",
					"curr_a": "NAS",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "4.15",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+4.15 %<\/font>",
					"trend": "up",
					"supply": 100000000,
					"marketcap": "91,630",
					"coin_icon": ""
				},
				"ocn_btc": {
					"no": 47,
					"symbol": "OCN",
					"name": "OCOIN",
					"name_en": "OCOIN",
					"name_cn": "OCOIN",
					"pair": "ocn_btc",
					"rate": "0.0000022",
					"vol_a": "3759184.8115455436",
					"vol_b": "8.23",
					"curr_a": "OCN",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "5.80",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+5.80 %<\/font>",
					"trend": "up",
					"supply": 10000000000,
					"marketcap": "21,900",
					"coin_icon": ""
				},
				"ddd_btc": {
					"no": 41,
					"symbol": "DDD",
					"name": "Scry",
					"name_en": "Scry",
					"name_cn": "Scry\u7121\u57df",
					"pair": "ddd_btc",
					"rate": "0.0000444",
					"vol_a": "172205.9260570441",
					"vol_b": "8.03",
					"curr_a": "DDD",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.72",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.72 %<\/font>",
					"trend": "down",
					"supply": 1000000000,
					"marketcap": "44,370",
					"coin_icon": ""
				},
				"jnt_btc": {
					"no": 51,
					"symbol": "JNT",
					"name": "JibrelNetwork",
					"name_en": "JibrelNetwork",
					"name_cn": "JibrelNetwork",
					"pair": "jnt_btc",
					"rate": "0.0000625",
					"vol_a": "112996.0525678271",
					"vol_b": "6.79",
					"curr_a": "JNT",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "1.05",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+1.05 %<\/font>",
					"trend": "up",
					"supply": 200000000,
					"marketcap": "12,490",
					"coin_icon": ""
				},
				"ae_btc": {
					"no": 22,
					"symbol": "AE",
					"name": "Aeternity",
					"name_en": "Aeternity",
					"name_cn": "Aeternity",
					"pair": "ae_btc",
					"rate": "0.000474",
					"vol_a": "11465.884496176",
					"vol_b": "5.37",
					"curr_a": "AE",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "2.91",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+2.91 %<\/font>",
					"trend": "up",
					"supply": 273686000,
					"marketcap": "129,656",
					"coin_icon": ""
				},
				"dbc_btc": {
					"no": 23,
					"symbol": "DBC",
					"name": "DeepBrain",
					"name_en": "DeepBrain",
					"name_cn": "\u6df1\u8111\u94fe",
					"pair": "dbc_btc",
					"rate": "0.0000119",
					"vol_a": "425599.181672442",
					"vol_b": "5.09",
					"curr_a": "DBC",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "0.25",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+0.25 %<\/font>",
					"trend": "up",
					"supply": 10000000000,
					"marketcap": "118,700",
					"coin_icon": ""
				},
				"lsk_btc": {
					"no": 20,
					"symbol": "LSK",
					"name": "Lisk",
					"name_en": "Lisk",
					"name_cn": "Lisk",
					"pair": "lsk_btc",
					"rate": "0.001362",
					"vol_a": "3637.8186719799",
					"vol_b": "4.84",
					"curr_a": "LSK",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "3.26",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+3.26 %<\/font>",
					"trend": "up",
					"supply": 116136000,
					"marketcap": "158,177",
					"coin_icon": ""
				},
				"lrc_btc": {
					"no": 26,
					"symbol": "LRC",
					"name": "Loopring",
					"name_en": "Loopring",
					"name_cn": "Loopring",
					"pair": "lrc_btc",
					"rate": "0.0000784",
					"vol_a": "52082.2480925493",
					"vol_b": "4.10",
					"curr_a": "LRC",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "3.16",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+3.16 %<\/font>",
					"trend": "up",
					"supply": 1395000000,
					"marketcap": "109,368",
					"coin_icon": ""
				},
				"bcd_btc": {
					"no": 30,
					"symbol": "BCD",
					"name": "BCD",
					"name_en": "BCD",
					"name_cn": "\u6bd4\u7279\u5e01\u94bb\u77f3",
					"pair": "bcd_btc",
					"rate": "0.000436",
					"vol_a": "9360.66435442",
					"vol_b": "4.05",
					"curr_a": "BCD",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "0.69",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+0.69 %<\/font>",
					"trend": "up",
					"supply": 210000000,
					"marketcap": "91,560",
					"coin_icon": ""
				},
				"sbtc_btc": {
					"no": 44,
					"symbol": "SBTC",
					"name": "SuperBitcoin",
					"name_en": "SuperBitcoin",
					"name_cn": "\u8d85\u7ea7\u6bd4\u7279\u5e01",
					"pair": "sbtc_btc",
					"rate": "0.001870",
					"vol_a": "2097.64951826",
					"vol_b": "3.90",
					"curr_a": "SBTC",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "1.63",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+1.63 %<\/font>",
					"trend": "up",
					"supply": 21210000,
					"marketcap": "39,663",
					"coin_icon": ""
				},
				"xmc_btc": {
					"no": 50,
					"symbol": "XMC",
					"name": "XMC(XMO)",
					"name_en": "XMC(XMO)",
					"name_cn": "\u95e8\u7f57\u539f\u94fe",
					"pair": "xmc_btc",
					"rate": "0.000945",
					"vol_a": "3792.92138266",
					"vol_b": "3.66",
					"curr_a": "XMC",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-2.12",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-2.12 %<\/font>",
					"trend": "down",
					"supply": 15904300,
					"marketcap": "15,032",
					"coin_icon": ""
				},
				"xrp_btc": {
					"no": 1,
					"symbol": "XRP",
					"name": "Ripple",
					"name_en": "Ripple",
					"name_cn": "\u745e\u6ce2\u5e01",
					"pair": "xrp_btc",
					"rate": "0.0000817",
					"vol_a": "39812.38116924",
					"vol_b": "3.27",
					"curr_a": "XRP",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.49",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.49 %<\/font>",
					"trend": "down",
					"supply": 100000000000,
					"marketcap": "8,170,000",
					"coin_icon": ""
				},
				"ada_btc": {
					"no": 6,
					"symbol": "ADA",
					"name": "Cardano",
					"name_en": "Cardano",
					"name_cn": "\u827e\u8fbe\u5e01",
					"pair": "ada_btc",
					"rate": "0.0000320",
					"vol_a": "89920.4498952256",
					"vol_b": "2.88",
					"curr_a": "ADA",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "4.17",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+4.17 %<\/font>",
					"trend": "up",
					"supply": 31112500000,
					"marketcap": "995,600",
					"coin_icon": ""
				},
				"iota_btc": {
					"no": 10,
					"symbol": "IOTA",
					"name": "IOTA",
					"name_en": "IOTA",
					"name_cn": "IOTA",
					"pair": "iota_btc",
					"rate": "0.000212",
					"vol_a": "12219.08490275",
					"vol_b": "2.61",
					"curr_a": "IOTA",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-1.39",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-1.39 %<\/font>",
					"trend": "down",
					"supply": 2779530000,
					"marketcap": "589,260",
					"coin_icon": ""
				},
				"xmr_btc": {
					"no": 11,
					"symbol": "XMR",
					"name": "Monero",
					"name_en": "Monero",
					"name_cn": "\u95e8\u7f57\u5e01",
					"pair": "xmr_btc",
					"rate": "0.0236",
					"vol_a": "98.02876656",
					"vol_b": "2.34",
					"curr_a": "XMR",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.97",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.97 %<\/font>",
					"trend": "down",
					"supply": 15260400,
					"marketcap": "359,529",
					"coin_icon": ""
				},
				"xvg_btc": {
					"no": 27,
					"symbol": "XVG",
					"name": "Verge",
					"name_en": "Verge",
					"name_cn": "Verge",
					"pair": "xvg_btc",
					"rate": "0.0000066",
					"vol_a": "326219.6068581444",
					"vol_b": "2.11",
					"curr_a": "XVG",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "1.54",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+1.54 %<\/font>",
					"trend": "up",
					"supply": 16555000000,
					"marketcap": "109,097",
					"coin_icon": ""
				},
				"zec_btc": {
					"no": 8,
					"symbol": "ZEC",
					"name": "ZCash",
					"name_en": "ZCash",
					"name_cn": "ZCash",
					"pair": "zec_btc",
					"rate": "0.0406",
					"vol_a": "48.99041855",
					"vol_b": "1.98",
					"curr_a": "ZEC",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-4.25",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-4.25 %<\/font>",
					"trend": "down",
					"supply": 21000000,
					"marketcap": "852,600",
					"coin_icon": ""
				},
				"bch_btc": {
					"no": 4,
					"symbol": "BCH",
					"name": "BCH",
					"name_en": "BCH",
					"name_cn": "BCH(\u539fBCC)",
					"pair": "bch_btc",
					"rate": "0.1503",
					"vol_a": "9.91218741",
					"vol_b": "1.49",
					"curr_a": "BCH",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "0.74",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+0.74 %<\/font>",
					"trend": "up",
					"supply": 21000000,
					"marketcap": "3,156,300",
					"coin_icon": ""
				},
				"xlm_btc": {
					"no": 3,
					"symbol": "XLM",
					"name": "Stellar",
					"name_en": "Stellar",
					"name_cn": "\u6052\u661f\u5e01",
					"pair": "xlm_btc",
					"rate": "0.0000385",
					"vol_a": "34710.8253379827",
					"vol_b": "1.34",
					"curr_a": "XLM",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.59",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.59 %<\/font>",
					"trend": "down",
					"supply": 103689000000,
					"marketcap": "3,986,842",
					"coin_icon": ""
				},
				"qash_btc": {
					"no": 33,
					"symbol": "QASH",
					"name": "LIQUID",
					"name_en": "LIQUID",
					"name_cn": "LIQUID",
					"pair": "qash_btc",
					"rate": "0.0000718",
					"vol_a": "17986.54841736",
					"vol_b": "1.29",
					"curr_a": "QASH",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.04",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.04 %<\/font>",
					"trend": "down",
					"supply": 1000000000,
					"marketcap": "71,810",
					"coin_icon": ""
				},
				"ltc_btc": {
					"no": 7,
					"symbol": "LTC",
					"name": "Litecoin",
					"name_en": "Litecoin",
					"name_cn": "\u83b1\u7279\u5e01",
					"pair": "ltc_btc",
					"rate": "0.0163",
					"vol_a": "72.4190660932",
					"vol_b": "1.18",
					"curr_a": "LTC",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.79",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.79 %<\/font>",
					"trend": "down",
					"supply": 53165200,
					"marketcap": "867,124",
					"coin_icon": ""
				},
				"neo_btc": {
					"no": 9,
					"symbol": "NEO",
					"name": "Neo",
					"name_en": "Neo",
					"name_cn": "\u5c0f\u8681Neo",
					"pair": "neo_btc",
					"rate": "0.007682",
					"vol_a": "146.2372812622",
					"vol_b": "1.10",
					"curr_a": "NEO",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "6.03",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+6.03 %<\/font>",
					"trend": "up",
					"supply": 100000000,
					"marketcap": "768,200",
					"coin_icon": ""
				},
				"tnc_btc": {
					"no": 49,
					"symbol": "TNC",
					"name": "Trinity",
					"name_en": "Trinity",
					"name_cn": "Trinity",
					"pair": "tnc_btc",
					"rate": "0.0000169",
					"vol_a": "63888.9379215796",
					"vol_b": "1.10",
					"curr_a": "TNC",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-4.90",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-4.90 %<\/font>",
					"trend": "down",
					"supply": 1000000000,
					"marketcap": "16,880",
					"coin_icon": ""
				},
				"qtum_btc": {
					"no": 16,
					"symbol": "QTUM",
					"name": "Qtum",
					"name_en": "Qtum",
					"name_cn": "\u91cf\u5b50\u94fe",
					"pair": "qtum_btc",
					"rate": "0.001966",
					"vol_a": "551.867860824",
					"vol_b": "1.09",
					"curr_a": "QTUM",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "0.41",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+0.41 %<\/font>",
					"trend": "up",
					"supply": 100000000,
					"marketcap": "196,600",
					"coin_icon": ""
				},
				"bts_btc": {
					"no": 25,
					"symbol": "BTS",
					"name": "BitShares",
					"name_en": "BitShares",
					"name_cn": "\u6bd4\u7279\u80a1",
					"pair": "bts_btc",
					"rate": "0.0000308",
					"vol_a": "32236.80802405",
					"vol_b": "1.01",
					"curr_a": "BTS",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-2.19",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-2.19 %<\/font>",
					"trend": "down",
					"supply": 3600570000,
					"marketcap": "110,862",
					"coin_icon": ""
				},
				"mobi_btc": {
					"no": 55,
					"symbol": "MOBI",
					"name": "Mobius",
					"name_en": "Mobius",
					"name_cn": "Mobius",
					"pair": "mobi_btc",
					"rate": "0.0000094",
					"vol_a": "105477.06158023",
					"vol_b": "1.00",
					"curr_a": "MOBI",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-3.39",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-3.39 %<\/font>",
					"trend": "down",
					"supply": 887991000,
					"marketcap": "8,356",
					"coin_icon": ""
				},
				"gxs_btc": {
					"no": 42,
					"symbol": "GXS",
					"name": "GXShares",
					"name_en": "GXShares",
					"name_cn": "\u516c\u4fe1\u5b9d",
					"pair": "gxs_btc",
					"rate": "0.000421",
					"vol_a": "2354.37057148",
					"vol_b": "0.99",
					"curr_a": "GXS",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.69",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.69 %<\/font>",
					"trend": "down",
					"supply": 100000000,
					"marketcap": "42,116",
					"coin_icon": ""
				},
				"bcx_btc": {
					"no": 18,
					"symbol": "BCX",
					"name": "BCX",
					"name_en": "BCX",
					"name_cn": "\u6bd4\u7279\u65e0\u9650",
					"pair": "bcx_btc",
					"rate": "0.00000083",
					"vol_a": "1089092.22931449",
					"vol_b": "0.88",
					"curr_a": "BCX",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "0.00",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+0.00 %<\/font>",
					"trend": "flat",
					"supply": 210000000000,
					"marketcap": "174,300",
					"coin_icon": ""
				},
				"ruff_btc": {
					"no": 46,
					"symbol": "RUFF",
					"name": "RuffChain",
					"name_en": "RuffChain",
					"name_cn": "RuffChain",
					"pair": "ruff_btc",
					"rate": "0.0000125",
					"vol_a": "64612.79998075",
					"vol_b": "0.83",
					"curr_a": "RUFF",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "0.16",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+0.16 %<\/font>",
					"trend": "up",
					"supply": 1790300000,
					"marketcap": "22,397",
					"coin_icon": ""
				},
				"hsr_btc": {
					"no": 38,
					"symbol": "HSR",
					"name": "HShare",
					"name_en": "HShare",
					"name_cn": "HShare",
					"pair": "hsr_btc",
					"rate": "0.001136",
					"vol_a": "737.7670439",
					"vol_b": "0.81",
					"curr_a": "HSR",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "4.38",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+4.38 %<\/font>",
					"trend": "up",
					"supply": 42260000,
					"marketcap": "48,004",
					"coin_icon": ""
				},
				"ink_btc": {
					"no": 48,
					"symbol": "INK",
					"name": "Ink",
					"name_en": "Ink",
					"name_cn": "Ink",
					"pair": "ink_btc",
					"rate": "0.0000217",
					"vol_a": "30682.5873227077",
					"vol_b": "0.67",
					"curr_a": "INK",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-1.81",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-1.81 %<\/font>",
					"trend": "down",
					"supply": 1000000000,
					"marketcap": "21,710",
					"coin_icon": ""
				},
				"zrx_btc": {
					"no": 19,
					"symbol": "ZRX",
					"name": "0xProject",
					"name_en": "0xProject",
					"name_cn": "0x\u9879\u76ee",
					"pair": "zrx_btc",
					"rate": "0.000166",
					"vol_a": "3044.74415625",
					"vol_b": "0.51",
					"curr_a": "ZRX",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-4.00",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-4.00 %<\/font>",
					"trend": "down",
					"supply": 1000000000,
					"marketcap": "165,500",
					"coin_icon": ""
				},
				"qlc_btc": {
					"no": 52,
					"symbol": "QLC",
					"name": "QLINK",
					"name_en": "QLINK",
					"name_cn": "QLINK",
					"pair": "qlc_btc",
					"rate": "0.0000190",
					"vol_a": "23227.9709002888",
					"vol_b": "0.45",
					"curr_a": "QLC",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-1.86",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-1.86 %<\/font>",
					"trend": "down",
					"supply": 600000000,
					"marketcap": "11,388",
					"coin_icon": ""
				},
				"gas_btc": {
					"no": 13,
					"symbol": "GAS",
					"name": "Gas",
					"name_en": "Gas",
					"name_cn": "\u5c0f\u8681Gas",
					"pair": "gas_btc",
					"rate": "0.002772",
					"vol_a": "134.194291938",
					"vol_b": "0.38",
					"curr_a": "GAS",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.86",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.86 %<\/font>",
					"trend": "down",
					"supply": 100000000,
					"marketcap": "277,197",
					"coin_icon": ""
				},
				"ledu_btc": {
					"no": 57,
					"symbol": "LEDU",
					"name": "Education",
					"name_en": "Education",
					"name_cn": "Education",
					"pair": "ledu_btc",
					"rate": "0.0000024",
					"vol_a": "151861.6088195449",
					"vol_b": "0.35",
					"curr_a": "LEDU",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-6.00",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-6.00 %<\/font>",
					"trend": "down",
					"supply": 362983000,
					"marketcap": "853",
					"coin_icon": ""
				},
				"omg_btc": {
					"no": 14,
					"symbol": "OMG",
					"name": "OmiseGo",
					"name_en": "OmiseGo",
					"name_cn": "OmiseGo",
					"pair": "omg_btc",
					"rate": "0.001545",
					"vol_a": "210.67080075",
					"vol_b": "0.32",
					"curr_a": "OMG",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "1.64",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+1.64 %<\/font>",
					"trend": "up",
					"supply": 140245000,
					"marketcap": "216,679",
					"coin_icon": ""
				},
				"snt_btc": {
					"no": 28,
					"symbol": "SNT",
					"name": "Status",
					"name_en": "Status",
					"name_cn": "Status",
					"pair": "snt_btc",
					"rate": "0.0000143",
					"vol_a": "22382.2599818",
					"vol_b": "0.32",
					"curr_a": "SNT",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "0.70",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+0.70 %<\/font>",
					"trend": "up",
					"supply": 7317070000,
					"marketcap": "104,634",
					"coin_icon": ""
				},
				"zpt_btc": {
					"no": 54,
					"symbol": "ZPT",
					"name": "Zeepin",
					"name_en": "Zeepin",
					"name_cn": "Zeepin",
					"pair": "zpt_btc",
					"rate": "0.0000091",
					"vol_a": "30479.2582404598",
					"vol_b": "0.28",
					"curr_a": "ZPT",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.54",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.54 %<\/font>",
					"trend": "down",
					"supply": 1000000000,
					"marketcap": "9,140",
					"coin_icon": ""
				},
				"btg_btc": {
					"no": 21,
					"symbol": "BTG",
					"name": "BTG",
					"name_en": "BTG",
					"name_cn": "BTG",
					"pair": "btg_btc",
					"rate": "0.006400",
					"vol_a": "39.658817461",
					"vol_b": "0.26",
					"curr_a": "BTG",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-3.03",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-3.03 %<\/font>",
					"trend": "down",
					"supply": 21000000,
					"marketcap": "134,400",
					"coin_icon": ""
				},
				"waves_btc": {
					"no": 35,
					"symbol": "WAVES",
					"name": "Waves",
					"name_en": "Waves",
					"name_cn": "\u6ce2\u5e01",
					"pair": "waves_btc",
					"rate": "0.000704",
					"vol_a": "297.23924373",
					"vol_b": "0.21",
					"curr_a": "WAVES",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-0.85",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-0.85 %<\/font>",
					"trend": "down",
					"supply": 100000000,
					"marketcap": "70,400",
					"coin_icon": ""
				},
				"storj_btc": {
					"no": 40,
					"symbol": "STORJ",
					"name": "Storj",
					"name_en": "Storj",
					"name_cn": "Storj",
					"pair": "storj_btc",
					"rate": "0.000109",
					"vol_a": "1829.80614252",
					"vol_b": "0.20",
					"curr_a": "STORJ",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-2.33",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-2.33 %<\/font>",
					"trend": "down",
					"supply": 425000000,
					"marketcap": "46,368",
					"coin_icon": ""
				},
				"dash_btc": {
					"no": 12,
					"symbol": "DASH",
					"name": "Dash",
					"name_en": "Dash",
					"name_cn": "\u8fbe\u4e16\u5e01",
					"pair": "dash_btc",
					"rate": "0.0466",
					"vol_a": "3.78905884",
					"vol_b": "0.18",
					"curr_a": "DASH",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-1.08",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-1.08 %<\/font>",
					"trend": "down",
					"supply": 7592180,
					"marketcap": "353,416",
					"coin_icon": ""
				},
				"nano_btc": {
					"no": 31,
					"symbol": "NANO",
					"name": "Nano",
					"name_en": "Nano",
					"name_cn": "Nano",
					"pair": "nano_btc",
					"rate": "0.000668",
					"vol_a": "264.8432579079",
					"vol_b": "0.18",
					"curr_a": "NANO",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-7.01",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-7.01 %<\/font>",
					"trend": "down",
					"supply": 133248000,
					"marketcap": "88,978",
					"coin_icon": ""
				},
				"pay_btc": {
					"no": 45,
					"symbol": "PAY",
					"name": "TenX",
					"name_en": "TenX",
					"name_cn": "TenX",
					"pair": "pay_btc",
					"rate": "0.000146",
					"vol_a": "1133.042106082",
					"vol_b": "0.17",
					"curr_a": "PAY",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-2.67",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-2.67 %<\/font>",
					"trend": "down",
					"supply": 205218000,
					"marketcap": "29,962",
					"coin_icon": ""
				},
				"etc_btc": {
					"no": 15,
					"symbol": "ETC",
					"name": "Ethereum Classic",
					"name_en": "Ethereum Classic",
					"name_cn": "\u4ee5\u592a\u7ecf\u5178",
					"pair": "etc_btc",
					"rate": "0.002132",
					"vol_a": "76.6384",
					"vol_b": "0.16",
					"curr_a": "ETC",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-1.25",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-1.25 %<\/font>",
					"trend": "down",
					"supply": 96008000,
					"marketcap": "204,689",
					"coin_icon": ""
				},
				"btf_btc": {
					"no": 34,
					"symbol": "BTF",
					"name": "BTF",
					"name_en": "BTF",
					"name_cn": "\u6bd4\u7279\u4fe1\u4ef0",
					"pair": "btf_btc",
					"rate": "0.003400",
					"vol_a": "46.7955574508",
					"vol_b": "0.16",
					"curr_a": "BTF",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-5.56",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-5.56 %<\/font>",
					"trend": "down",
					"supply": 21000000,
					"marketcap": "71,400",
					"coin_icon": ""
				},
				"mdt_btc": {
					"no": 56,
					"symbol": "MDT",
					"name": "MeasurableData",
					"name_en": "MeasurableData",
					"name_cn": "\u91cf\u6570\u5e01",
					"pair": "mdt_btc",
					"rate": "0.0000069",
					"vol_a": "23382.1443191599",
					"vol_b": "0.16",
					"curr_a": "MDT",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-1.99",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-1.99 %<\/font>",
					"trend": "down",
					"supply": 1000000000,
					"marketcap": "6,910",
					"coin_icon": ""
				},
				"powr_btc": {
					"no": 39,
					"symbol": "POWR",
					"name": "PowerLedger",
					"name_en": "PowerLedger",
					"name_cn": "PowerLedger",
					"pair": "powr_btc",
					"rate": "0.0000480",
					"vol_a": "1181.241971329",
					"vol_b": "0.06",
					"curr_a": "POWR",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-4.88",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-4.88 %<\/font>",
					"trend": "down",
					"supply": 1000000000,
					"marketcap": "47,950",
					"coin_icon": ""
				},
				"bifi_btc": {
					"no": 24,
					"symbol": "BIFI",
					"name": "BitcoinFile",
					"name_en": "BitcoinFile",
					"name_cn": "BitcoinFile",
					"pair": "bifi_btc",
					"rate": "0.0000054",
					"vol_a": "8643.0610055",
					"vol_b": "0.05",
					"curr_a": "BIFI",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "3.24",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+3.24 %<\/font>",
					"trend": "up",
					"supply": 21000000000,
					"marketcap": "113,820",
					"coin_icon": ""
				},
				"bat_btc": {
					"no": 36,
					"symbol": "BAT",
					"name": "BasicAttentionToken",
					"name_en": "BasicAttentionToken",
					"name_cn": "\u6ce8\u610f\u529b\u5e01",
					"pair": "bat_btc",
					"rate": "0.0000428",
					"vol_a": "145.4455409",
					"vol_b": "0.01",
					"curr_a": "BAT",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "1.18",
					"rate_percent_str": "<font color=green id='leftbarupdn'>+1.18 %<\/font>",
					"trend": "up",
					"supply": 1500000000,
					"marketcap": "64,200",
					"coin_icon": ""
				},
				"god_btc": {
					"no": 32,
					"symbol": "GOD",
					"name": "BitcoinGod",
					"name_en": "BitcoinGod",
					"name_cn": "\u6bd4\u7279\u5e01\u4e0a\u5e1d",
					"pair": "god_btc",
					"rate": "0.004050",
					"vol_a": "0.64933151",
					"vol_b": "0.00",
					"curr_a": "GOD",
					"curr_b": "BTC",
					"curr_suffix": " BTC",
					"rate_percent": "-4.03",
					"rate_percent_str": "<font color=red id='leftbarupdn'>-4.03 %<\/font>",
					"trend": "down",
					"supply": 21000000,
					"marketcap": "85,050",
					"coin_icon": ""
				}
			};
		</script>
		<script src="js/leftbar.js?v=1526472098"></script>

		<script src="js/socket/socket.io.slim.js"></script>

		<script src="js/chat_room/webim.min.js"></script>



		<script src="js/footer.js?v=0420"></script>
		<script type="text/javascript" src="js/test.js"></script>
	</body>

</html>