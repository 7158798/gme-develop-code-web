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

		<!--
        	作者：李德芳
        	时间：2018-06-28
        	描述：
        -->
		<div class="L_69">
			<div class="L_70">
				<ul id="currencyList">
					<li style="font-size: 16px;font-weight: 700;color: #23344a;">
						数字资产列表
					</li>
					<li class="action_70">
						<a href="#">
							<img src="img/L_7.png" /> BTC 比特币
						</a>
					</li>
				</ul>
			</div>
			<div class="L_71">
				<p style="display: inline-block;border-bottom: 1px solid #f2f3f5;height: 60px;line-height: 60px;font-size: 16px;color: #23344a;font-weight: 700;width: 100%;">BTC（比特币）</p>
				<p style="margin-top: 20px;">
					<span style="font-family:Arial,Helvetica,sans-serif">
						<span style="font-size:14px">
							<strong>一、基本情况</strong>
						</span>
					</span>
				</p>
				<p>
					<span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:14px;color: #4d5561;">名称：Bitcoin<br>
					简称：BTC<br>
					发起者：中本聪（Satoshi Nakamoto）<br>
					总发行量：2100万<br>
					核心算法：SHA-256<br>
					共识证明：POW</span></span>
				</p>

				<p><br>
					<span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:14px"><strong>二、比特币是什么？</strong></span></span>
				</p>

				<p><br>
					<span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:14px;color: #4d5561;">比特币（Bitcoin，简称BTC）是目前使用最为广泛的一种数字货币，其概念最初由中本聪在2009年提出，是一种点对点（P2P）传输的数字加密货币，总量2100万枚。比特币网络每10分钟释放出一定数量币，预计在2140年达到极限。</span></span><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:14px">比特币被投资者称为“数字黄金”。比特币依据特定算法，通过大量的计算产生，不依靠特定货币机构发行，其使用整个P2P网络中众多节点构成的分布式数据库来确认并记录所有的交易行为，并使用密码学设计确保货币流通各个环节安全性，可确保无法通过大量制造比特币来人为操控币值。基于密码学的设计可以使比特币只能被真实拥有者转移、支付及兑现。同样确保了货币所有权与流通交易的匿名性。</span></span><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:14px">随着比特币价值被认可，比特币应用场景也在不断的增加。当前，比特币不仅可以兑换货币，还可以在一些线下店购买商品。</span></span>
				</p>

				<p><br>
					<span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:14px"><strong>三、比特币特点</strong></span></span>
				</p>

				<p><br>
					<span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:14px;color: #4d5561;">总量恒定——2100万<br>
					去中心化——没人能篡改链上数据<br>
					全球流通——没有地域之分<br>
					采用POW机制，有区块奖励——当前12.5BTC/区块</span></span>
				</p>

				<p>&nbsp;</p>

				<p><strong><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:14px">四、常用链接</span></span></strong></p>

				<p><br>
					<span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:14px;color: #4d5561;">官网：<a href="https://bitcoin.org/zh_CN/"><span style="color:#2e6aba">https://bitcoin.org/zh_CN/</span></a><br> 白皮书：
					<a href="https://bitcoin.org/bitcoin.pdf"><span style="color:#2e6aba">https://bitcoin.org/bitcoin.pdf</span></a>
					</span>
					</span>
				</p>

				<p>&nbsp;</p>
			</div>
		</div>
		<script type="text/javascript" src="js/style.js"></script>
		
		
		<script type="text/javascript">
			// 查询所有的币种
			function getCurrencyList(){
				$.ajax({
					type: "GET",
					url: "http://192.168.0.148:8080/gme-web/api/v1/operation/coinList.json",
					dataType: "json",
					success: function(data){
						if (data.code == 200) {
							$("#currencyList li:not(:first)").remove();
							var dataChar = data.data;
							for (var i = 0; i < dataChar.length; i++) {
								var data = dataChar[i];
								$("#currencyList").append("<li><a><img src="img/L_7.png" />"+data.currencySymbol+"</a><input type='hidden' value='"+data.currencyId+"'/></li>");
							}
							// 给第一个默认选中样式
							$("#currencyList li:first").css("class","action_70");
							
							// 给每一个币种添加点击事件
							$("#currencyList").children().each(function(){
								$(this).children().click(function(){
									var currencyId = $(this).parent().children().eq(-1).val();
									$.ajax({
										type: "GET",
										url: "http://192.168.0.148:8080/gme-web/api/v1/operation/getCurrencyDetail.json",
										dataType: "json",
										data: "currencyId=" + currencyId,
										success: function(data){
											if (data.code == 200) {
											}
										}
									});
								});
							});
						}else {
							alert("查询所有的币种:" + data.message);
						}
					}
				})
			}
		</script>
		
		<script type="text/javascript">
			getCurrencyList();
		</script>
		
	</body>

</html>