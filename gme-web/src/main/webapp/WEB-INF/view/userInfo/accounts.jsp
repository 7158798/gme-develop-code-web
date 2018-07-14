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
			<div class="L_36">
				<div class="L_39" style="border-bottom: 1px solid #E6EAF0;height: 102px;">
					<div class="L_47">
						<p>我的账号ID</p>
						<p>144691</p>
					</div>
					<div class="L_47">
						<p>交易费折扣</p>
						<p>无</p>
					</div>
				</div>
				<div class="L_48">
					<p>总资产估值</p>
					<p>当前资金总估：<span>0.000000USDT</span>&nbsp;或&nbsp;<span>0.0000000BTC</span></p>
					<p>注：资金总估是由历史行情估算值，仅为用户提供一个参考，请以单项资金为准。</p>
				</div>
				<div class="L_49">
					<div class="L_50">
						<p>资金(我的在线钱包)</p>
						<input type="text" placeholder="请输入币种名称" />
						<img src="img/L_6.png" />
					</div>
					<div class="L_51">
						<div class="slideOne">
							<input type="checkbox" value="None" id="slideOne" name="check" checked />
							<label for="slideOne"></label>
						</div>
						<span style="float: left;">只显示有资金币种(隐藏0资金币种)</span>
						<table id="currencyTable" class="L_40" style="width: 100%;">
							<tr>							
								<th style="width: 12%;">币种</th>
								<th>可用余额</th>
								<th>冻结金额</th>
								<th>总计</th>
								<th>估算为人民币</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>
									<img src="img/L_7.png" />
									BTC 比特币
								</td>
								<td>0.00000000</td>
								<td>0.00000000</td>
								<td>0.00000000</td>
								<td>0.00</td>
								<td>
									<a>充值</a>
									<a>提现</a>
									<a>交易</a>
								</td>
							</tr>
						</table>
					</div>
					<div class="L_41" style="width: 100%;">
						<span>1</span>
						<span style="background: #2B6FC9;color: #FFFFFF;">2</span>
						<span>上一页</span>
						<span>下一页</span>
						<span style="float: left;border: 0px;font-size: 13px;color: #5c5c66;margin-left: 0px;padding: 0px;">当前显示第1至8币种，共10币种</span>
					</div>
				</div>
				<div class="L_49">
					<div class="L_50">
						<p>已经下架币种列表(请提现)：</p>
					</div>
					<div class="L_51">
						<table class="L_40" style="width: 100%;">
							<tr>
								<th style="width: 12%;">币种</th>
								<th>可用余额</th>
								<th>冻结金额</th>
								<th>总计</th>
								<th>估算为人民币</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>
									<img src="img/L_7.png" />
									BTC 比特币
								</td>
								<td>0.00000000</td>
								<td>0.00000000</td>
								<td>0.00000000</td>
								<td>0.00</td>
								<td>
									<a>提现</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="L_49">
					<div class="L_50" style="margin-top: 30px;">
						<span style="font-size: 15px;color: #152137;float: left;">最近充值记录</span>
						<span style="font-size: 15px;color: #152137;float: right;"><a href="rechargeRecord.html">更多</a></span>
					</div>
					<div class="L_51">
						<table id="rechargeRecordTable" class="L_40" style="width: 100%;">
							<tr>
								<th style="width: 7%;">订单号</th>
								<th>币种类型</th>
								<th>时间</th>
								<th>数量</th>
								<th>TX ID</th>
								<th>确认数量</th>
								<th>状态</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="L_49">
					<div class="L_50" style="margin-top: 30px;">
						<span style="font-size: 15px;color: #152137;float: left;">最近提现记录</span>
						<span style="font-size: 15px;color: #152137;float: right;"><a href="withdrawRecord.html">更多</a></span>
					</div>
					<div class="L_51">
						<table id="withdrawRecordTable" class="L_40" style="width: 100%;">
							<tr>
								<th style="width: 0%;">订单号</th>
								<th>币种类型</th>
								<th>时间</th>
								<th>提币数量</th>
								<th>手续费</th>
								<th>实际到账数量</th>
								<th>提现地址</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>
									205896
								</td>
								<td>BTC</td>
								<td>2018-06-29 16:13:00</td>
								<td>1314.00000000</td>
								<td>13.00000000</td>
								<td>1300.00000000</td>
								<td>dfasdsfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasd</td>
								<td>
									成功
								</td>
								<td>
									<a>取消提现</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		<script type="text/javascript" src="js/style.js"></script>
		
		
		
		<script type="text/javascript">
			// 查询 最近充值记录
			function queryRechargeRecord(){
				$.ajax({
					type: "POST",
					url: "http://192.168.0.148:8080/gme-web/api/v1/wallet/getWalletRechargeRecord.json",
					dataType: "json",
					success: function(data){
						if (data.code == 200) {
							var dataChar = data.data;
							$("#withdrawRecordTable tr:not(:first)").remove();
							var status = data.status;
							var statusStr = "";
							if (status = 1) {
								statusStr = "等待确认";
							}
							if (status = 2) {
								statusStr = "成功";
							}
							if (status = 3) {
								statusStr = "失败";
							}
							
								$("#rechargeRecordTable").append("<tr><td>"+订单号+"</td><td>"+币种类型+"</td><td>"+时间+"</td><td>"+数量+"</td><td>"+tx+"</td><td>"+确认数量+"</td><td>"+statusStr+"</td></tr>");
							// 状态1-等待确认;2-成功;3-失败;
							if (status == 1) {
							}else if (status == 2) {
								$("#rechargeRecordTable").append("<tr><td>"+订单号+"</td><td>"+币种类型+"</td><td>"+时间+"</td><td>"+数量+"</td><td>"+tx+"</td><td>"+确认数量+"</td><td>成功</td></tr>");
							}else if (status == 3) {
								$("#rechargeRecordTable").append("<tr><td>"+订单号+"</td><td>"+币种类型+"</td><td>"+时间+"</td><td>"+数量+"</td><td>"+tx+"</td><td>"+确认数量+"</td><td>失败</td></tr>");
							}
						}else {
							alert("查询最近充值记录:" + data.message);
						}						
						
					}
				});
			}
		</script>
		
		
		
		
		
		
		<script type="text/javascript">
			// 查询 最近提现记录
			function queryWithdrawRecord(){
				$.ajax({
					type: "GET",
					url: "http://192.168.0.148:8080/gme-web/api/v1/wallet/getWithdrawRecordPage.json",
					dataType: "json",
					success: function(data){
						if (data.code == 200) {
							var dataChar = data.data;
							$("#withdrawRecordTable tr:not(:first)").remove();
							// 1-申请;2-处理中;3-已处理;4-已拒绝;5-撤销;
							var status = dataChar.status;
							var statusStr = "";
							var operation = "";
							if (status == 1) {
								statusStr = "已申请";
								operation = "<a onclick='cancleWithdraw(this);'>取消提现</a>";
							}
							if (status == 2) {
								statusStr = "处理中";
								operation = "--";
							}
							if (status == 3) {
								statusStr = "已处理";
								operation = "--";
							}
							if (status == 4) {
								statusStr = "已拒绝";
								operation = "--";
							}
							if (status == 5) {
								statusStr = "撤销";
								operation = "--";
							}
							
							$("#withdrawRecordTable").append("<tr><td>"+订单号+"</td><td>"+币种类型+"</td><td>"+时间+"</td><td>"+提币数量+"</td><td>"+手续费+"</td><td>"+实际到账数量+"</td><td>"+提现地址+"</td><td>"+statusStr+"</td><td>"+operation+"</td></tr>");
							
							
							// 如果状态是已申请，允许撤销
							if ($(this).children().eq(-2).text() == "已申请") {
								// 取消提现
								$("#withdrawRecordTable tr:not(:first)").children().each(function(){
									$(this).children().eq(-1).children().click(function(){
										var orderId = $(this).parent().parent().children().eq(1).text();
										$.ajax({
											type: "POST",
											url: "http://192.168.0.148:8080/gme-web/api/v1/wallet/cancelWithdraw.json",
											dataType: "json",
											data: "orderId=" + orderId,
											success: function(data){
												alert("查询 最近提现记录:" + data.message);
											}
										});
									});
								});
							}else {
								// 设置为不可 取消提现
								$(this).children().eq(-1).children().attr("href","javascript:return false").attr("style","display: inline-block;margin-left: 40px;opacity: 0.2;");
							}
						}else {
							alert("查询 最近提现记录:" + data.message);
						}						
						
					}
				});
			}
		</script>
		
		
		
		
		<script type="text/javascript">
			// 查询我的账户资金
			function myAccounts(){
				$.ajax({
					type: "GET",
					url: "http://192.168.0.148:8080/gme-web/api/v1/finance/balance.json",
					dataType: "json",
					success: function(data){
						if (data.code == 200) {
							$("#currencyTable tr:not(:first)").remove();
							
							var data = data.data;
							var balanceBTC = data.balance_btc;
							var balanceCNY = data.balance_cny;
							var dataChar = data.coins;
							for (var i = 0; i < dataChar.length; i++) {
								var data = dataChar[i];
								$("#currencyTable").append("<tr><td>"+data.symbol+"</td><td>可用余额</td><td>"+data.frozenNumber+"</td><td>"+data.number+"</td><td>估算为人民币</td><td><a>充值</a><a>提现</a><a>交易</a></td></tr>");
							}
						}
					}					
				})
			}
		</script>
		
		
		
		
		
		
		
		
		
		<script type="text/javascript">
			// 查询 最近充值记录
			//queryRechargeRecord();
			// 查询 最近提现记录
			//queryWithdrawRecord();
		</script>
		
	</body>

</html>