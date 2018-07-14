

// 检查支付方式是否没有选中
function checkPayMethod(payMethod){
	if (payMethod == null) {
		return false;
	}
	return true;
}

// 给买入填写的 数量 和 价格 绑定onkeyup事件(乘法)
function checkBuyCalcAmount(num){
	if (checkReg(num)) {
		var buyPrice = $("#buyPrice").val();
		var buyCount = $("#buyCount").val();
		var buyAmount = $("#buyAmount").val();
		if (buyAmount != "") {
			// 如果金额不为空 价格为空 数量不为空
			if (buyPrice == "" && buyCount != "") {
				var result = clacCount(buyAmount,buyCount);
				// 保留两位小数
				result = String(result).replace(/^(.*\..{4}).*$/,"$1");
				result = Number(result);
				$("#buyPrice").val(result);
				return true;
			}
			// 如果金额不为空 价格不为空 数量为空
			if (buyCount == "" && buyPrice != "") {
				var result = clacCount(buyAmount,buyPrice);
				// 保留四位小数
				result = String(result).replace(/^(.*\..{4}).*$/,"$1");
				result = Number(result);
				$("#buyCount").val(result);
				return true;
			}
			// 如果金额不为空 价格不为空 数量不为空
			if (buyCount != "" && buyPrice != "") {
				var result = clacPrice(buyPrice,buyCount);
				$("#buyAmount").val(result);
				return true;
			}
			return true;
		}else {
			if (buyCount == "") {
				return true;
			}
			if (buyPrice == "") {
				return true;
			}
			var result = clacPrice(buyPrice,buyCount);
			$("#buyAmount").val(result);
			return true;
		}
	}
 }


// 给买入填写的金额绑定onkeyup事件(除法)
function checkBuyAmount(num){
	if (checkReg(num)) {
		var buyPrice = $("#buyPrice").val();
		var buyCount = $("#buyCount").val();
		var buyAmount = $("#buyAmount").val();
		
		// 如果输入价格
		if (buyCount == "") {
			if (buyPrice == "") {
				return true;
			}else {
				var result = clacCount(buyAmount,buyPrice);
				// 保留四位小数
				result = String(result).replace(/^(.*\..{4}).*$/,"$1");
				result = Number(result);
				$("#buyCount").val(result);
				return true;
			}
		}else {
			var result = clacCount(buyAmount,buyCount);
			// 保留两位小数
			result = String(result).replace(/^(.*\..{4}).*$/,"$1");
			result = Number(result);
			$("#buyPrice").val(result);
			return true;
		}
	}
	
}


// 给卖出填写的 数量 和 价格 绑定onkeyup事件(乘法)
function checkSellCalcAmount(num){
	if (checkReg(num)) {
		var sellPrice = $("#sellPrice").val();
		var sellCount = $("#sellCount").val();
		var sellAmount = $("#sellAmount").val();
		if (sellAmount != "") {
			// 如果金额不为空 价格为空 数量不为空
			if (sellPrice == "" && sellCount != "") {
				var result = clacCount(sellAmount,sellCount);
				// 保留两位小数
				result = String(result).replace(/^(.*\..{4}).*$/,"$1");
				result = Number(result);
				$("#sellPrice").val(result);
				return true;
			}
			// 如果金额不为空 价格不为空 数量为空
			if (sellCount == "" && sellPrice != "") {
				var result = clacCount(sellAmount,sellPrice);
				// 保留四位小数
				result = String(result).replace(/^(.*\..{4}).*$/,"$1");
				result = Number(result);
				$("#sellCount").val(result);
				return true;
			}
			// 如果金额不为空 价格不为空 数量不为空
			if (sellCount != "" && sellPrice != "") {
				var result = clacPrice(sellPrice,sellCount);
				$("#sellAmount").val(result);
				return true;
			}
			return true;
		}else {
			if (sellCount == "") {
				return true;
			}
			if (sellPrice == "") {
				return true;
			}
			var result = clacPrice(sellPrice,sellCount);
			$("#sellAmount").val(result);
			return true;
		}
	}
 }



// 给卖出填写的金额绑定onkeyup事件(除法)
function checkSellAmount(num){
	if (checkReg(num)) {
		var sellPrice = $("#sellPrice").val();
		var sellCount = $("#sellCount").val();
		var sellAmount = $("#sellAmount").val();
		
		// 如果输入价格
		if (sellCount == "") {
			if (sellPrice == "") {
				return true;
			}else {
				var result = clacCount(sellAmount,sellPrice);
				// 保留四位小数
				result = String(result).replace(/^(.*\..{4}).*$/,"$1");
				result = Number(result);
				$("#sellCount").val(result);
				return true;
			}
		}else {
			var result = clacCount(sellAmount,sellCount);
			// 保留两位小数
			result = String(result).replace(/^(.*\..{4}).*$/,"$1");
			result = Number(result);
			$("#sellPrice").val(result);
			return true;
		}
	}
	
}


// 检查商家卖出usdt数据是否正确 
function changeStyle(obj) {
	var id = $(obj).attr("id");
	if (id == "buy") {
		$(obj).attr("style","margin-right: 40px;margin-left: 10px;color: #41b2ce;");
		$("#sell").attr("style","color: #152137;");
		showDeity(1);
	}
	if (id == "sell") {
		$(obj).attr("style","color: #41b2ce;");
		$("#buy").attr("style","margin-right: 40px;margin-left: 10px;color: #152137;");
		showDeity(2);
	}
}



// 检查商家买入usdt数据是否正确 
$("#sellButton").click(function(){
	var sellPrice = $("#sellPrice").val();
	var sellCount = $("#sellCount").val();
	var sellAmount = $("#sellAmount").val();
	var sMinLimit = $("#sMinLimit").val();
	var sMaxLimit = $("#sMaxLimit").val();
	var sAliPay = $("#sAliPay:checked").val();
	var sWechatPay = $("#sWechatPay:checked").val();
	var sBankCard = $("#sBankCard:checked").val();

	if (sAliPay != null || sWechatPay != null || sBankCard != null) {
		var payMethod = (checkPayMethod(sBankCard)?sBankCard:"02") + (checkPayMethod(sAliPay)?sAliPay:"02") + (checkPayMethod(sWechatPay)?sWechatPay:"02");
	}else {
		alert("请至少选择一种支付方式");
		return;
	}
	
	/* if (buyPrice == "" || buyCount == "" || buyAmount == "" || bMinLimit == "" || bMaxLimit == "" || payMehtod.length <= 0) {
		return false;
	}
	
	// 判断 买入量 和 金额 是否是数字
	if (isNaN(buyCount) || isNaN(buyAmount)) {
		return false;
	} */
	
	
	if (sMinLimit > sMaxLimit) {
		alert("最小限额不能大于最大限额");
		return;
	}							
	
	
	$.ajax({
		type: "POST",
		url: "http://192.168.0.148:8080/gme-web/api/v1/otc/busBuyAndSell.json", 
		data: "number=" + sellCount + "&minMoney=" + sMinLimit + "&maxMoney=" + sMaxLimit + 
			  "&price=" + sellPrice + "&payMethod=" + payMethod + "&type=2",
		dataType: "json",
		success: function(data){
			if (data.code == 200) {
				alert("下单成功");
			}else {
				console.debug(data.message);
			}
		}
	});
});


// 查看行情
function showTicket(){
	$.ajax({
		type: "GET",
		url: "http://192.168.0.148:8080/gme-web/api/v1/kline/ticker.json",
		dataType: "json",
		data: "symbol=usdt",
		success: function(data){
			if (data.code == 200) {
				$("#realTime").text("¥" + data.data.priceForCny);
				$("#highsAndLows").text("+" + data.data.increase + "↑");
				$("#highest").text("¥" + data.data.highPriceToday);
				$("#lowest").text("¥" + data.data.lowPriceToday);
			}
		}
	});
}
			
		
			
// 查询市场挂单
function showDeity(type){
	$.ajax({
		type: "GET",
		url: "http://192.168.0.148:8080/gme-web/api/v1/otc/deityList.json",
		data: "type=" + type + "&symbol=usdt",
		dataType: "json",
		success: function(data){
			if (data.code == 200) {
				$("#deityTable tr:not(:first)").remove();
				var dataChar = data.data.recordList;
				// 遍历返回的data对象
				for (var i = 0;i <dataChar.length; i++) {
					var data = dataChar[i];
					var payMethod = data.orderPayType; 
					// 支付方式
					
					var stradd = "";
					var typePre = "";
					var typeSuf = "";
					var pay1 = payMethod.substring(0, 2);
					var pay2 = payMethod.substring(2, 4);
					var pay3 = payMethod.substring(4, 6);
			 
					
					if(pay1 == "01") {
						stradd = stradd + "<img src='img/L_22.png' />&nbsp;";
					}
					if(pay2 == "01") {
						stradd =  stradd +"<img src='img/L_16.png' />&nbsp;";
					}
					if(pay3 == "01") {
						stradd =  stradd +"<img src='img/L_20.png' />&nbsp;";
					}
					if(type == 1) {
						typePre = "买入";
						typeSuf = "卖出";
					}
					else if(type == 2) {
						typePre = "卖出";
						typeSuf = "买入";
					}
				
					$("#deityTable").append("<tr><td>"+typePre+"</td><td>"+data.orderPrice+"</td><td>"+data.orderNumber+"</td><td>"+data.orderAmount+"</td><td>"+data.orderMinAmount+"-"+data.orderMaxAmount+"</td><td>王*11分钟</td><td>888</td><td>2</td><td align='left'>"+stradd+"</td><td><a style='display: inline-block;margin-left: 40px;'>"+typeSuf+"</a></td><input type='hidden' value='"+data.orderId+"'></input><input type='hidden' value='"+payMethod+"'></input></tr>");
				 
				}
				
				// 给买入或者卖出绑定事件
				$("#deityTable tr:not(:first)").each(function(){
					$(this).children().eq(-3).children().click(function(){
						var parice = $(this).parent().parent().children().eq(1).text();
						var orderNum = $(this).parent().parent().children().eq(2).text();
						var amount = $(this).parent().parent().children().eq(3).text();
						var limit = $(this).parent().parent().children().eq(4).text();
						var limits = limit.split("-");
						var orderMinAmount = limits[0];
						var orderMaxAmount = limits[1];
						var payMethod = $(this).parent().parent().children().eq(-1).val();
						var orderId = $(this).parent().parent().children().eq(-2).val();
						var type = $(this).parent().parent().children().eq(-3).text();
						if (type == "买入") {
							type = 1;
						}
						if (type == "卖出") {
							type = 2;
						}
						
						$.ajax({
							type: "POST",
							url: "http://192.168.0.148:8080/gme-web/api/v1/otc/userBuySell.json",
							dataType: "json",
							data: "orderId=" + orderId + "&orderNum=" + orderNum + "&type=" + type + "&amount=" + amount + "&payPassword=1111",
							success: function(data){
								if (data.code == 200) {
									alert(data.message);
								}else {
									alert(data.message);
								}
							}
						});
					});
				});
								
				
				
			}else {
				$("#deityTable tr:not(:first)").remove();
				console.debug(data.message);
			}
		}
	});
}


// 用户订单查询
function userOrderQuery(status){
	$.ajax({
		type: "GET",
		url: "http://192.168.0.148:8080/gme-web/api/v1/otc/userOrderHistory.json",
		dataType: "json",
		data: "status=" + status,
		success :function(data) {
			if (data.code == 200) {
				$("#userOrderQuery tr:not(:first)").remove();
				$("#userPayment").attr("style","display:none;");
				var dataList = data.data.recordList;
				for (var i = 0; i < dataList.length; i++) {
					var data = dataList[i];
					
					var typeStr = "";
					var statusStr = "";
					var operation = "";
					if (data.status == 1) {
						statusStr = "交易中";
						operation = "<a>撤销</a>";
					}else if (data.status == 3) {
						statusStr = "已完成";
						operation = "--";
					}else if (data.status == 4) {
						statusStr = "已取消";
						operation = "--";
					}else if (data.status == 7) {
						statusStr = "已申诉";
						operation = "--";
					}
					
					if (data.type == 1) {
						typeStr = "买入"
					}else if (data.type == 2){
						typeStr = "卖出"
					}
					
					
					$("#userOrderQuery").append("<tr><td>"+data.entryOrderId+"<img src='img/L_30.png' style='margin-left: 10px;'/></td><td>"+typeStr+"</td><td>"+data.price+"</td><td>"+data.number+"</td><td>"+data.amount+"</td><td>"+statusStr+"</td><td>未知</td><td>"+data.createTime+"</td><td>"+operation+"</td></tr>");
				}
				
				
				// 给撤销绑定事件
				$("#userOrderQuery tr:not(:first)").each(function(){
					var status = $(this).children().eq(1).text();
					var orderId = $(this).children().first().text();
					$(this).children().eq(-1).children().click(function(){
						$.ajax({
							type: "POST",
							url: "http://192.168.0.148:8080/gme-web/api/v1/otc/userCancleOrder.json",
							data: "orderId=" + orderId,
							dataType: "json",
							success: function(data){
								if (data.code == 200) {
									alert("撤销成功");
									// 刷新
									userOrderQuery(1);
								}else {
									alert(data.message);
								}
							}
						});
					});
				});
				
				
				// 用户每个订单查看付款方式
				$("#userOrderQuery tr:not(:first)").each(function(){
					$(this).children().click(function(){
						
						if ($(this).parent().attr("teststyle") != "testStyle" && $(this).parent().parent().children("[teststyle='testStyle']").length != 0) {
							$(this).parent().parent().children("[teststyle='testStyle']").next().remove();
							$(this).parent().parent().children("[teststyle='testStyle']").attr("teststyle","");
						}
						// 判断是否展示
						if ($(this).parent().attr("teststyle") == "testStyle") {
							// 移除付款方式
							$(this).parent().next().remove();
							$(this).parent().attr("teststyle","");
							// 判断其他tr是否还有teststyle属性
							/*if ($(this).parent().parent().children("[teststyle='testStyle']")) {
								$(this).parent().parent().children("[teststyle='testStyle']").next().remove();
								$(this).parent().parent().children("[teststyle='testStyle']").attr("teststyle","");
							}*/
						}else {
							var orderId = $(this).parent().children().eq(0).text();
							for (var i = 0; i < dataList.length; i++) {
								var data = dataList[i];
								// 根据点击的orderId 查询数组中的支付方式
								if (data.entryOrderId == orderId) {
									var bankName = data.bankName;	
									var alipayAccount = data.alipayAccount;
									var wxAccount = data.wxAccount;
									
									var bankNameStr = "";
									var alipayAccountStr = "";
									var wxAccountStr = "";
									var statusStr = "";
									var suffix = "</span><a onclick='copyText(this);'>复制</a></p>";
									var warning = "<p><span>切勿备注&nbsp;比特币&nbsp;虚拟币&nbsp;等信息</span></p><p><span>请留意与卖家姓名是否一致</span></p>";
									var targetName = data.targetName;
									if (bankName != "") {
										bankNameStr += "<div class='fl L_78_11'><p><img src='img/L_21.png' />银行转账</p>";
										bankNameStr += "<p>实际姓名：<span>"+targetName + suffix;
										bankNameStr += "<p>银行名：<span>"+bankName + suffix;
										bankNameStr += "<p>支行：<span>"+data.bankBranch + suffix;
										bankNameStr += "<p>银行卡号：<span>"+data.bankCardNumber + suffix;
										bankNameStr += "<p>付款金额：<span>"+data.amount + suffix + "</div>";
										//alipayAccountStr = bankNameStr + alipayAccountStr;
									}
									if (alipayAccount != "") {
										alipayAccountStr += "<div class='fl L_78_12'><p><img src='img/L_23.png' />支付宝</p>";
										alipayAccountStr += "<p>卖家姓名：<span>"+targetName + suffix;
										alipayAccountStr += "<p>支付宝账号：<span>"+alipayAccount + suffix;
										alipayAccountStr += "<p>付款金额：<span>"+data.amount + suffix;
										alipayAccountStr += warning;
										alipayAccountStr += "<p>支付宝收款码：<img src='"+data.alipayImg+"' /><div class='L_78_121'><span>支付宝</span><br />";
										alipayAccountStr += "<img src='"+data.alipayImg+"'/><span>收款码</span><br /><a onclick='alipayWatch(this);'>立即查看</a></div></div>";
										//wxAccountStr = alipayAccountStr + wxAccountStr;
									}
									if (wxAccount != "") {
										wxAccountStr += "<div class='fl L_78_13'><p><img src='img/L_17.png' />微信</p>";
										wxAccountStr += "<p>卖家姓名：<span>"+targetName + suffix;
										wxAccountStr += "<p>微信账号：<span>"+wxAccount + suffix;
										wxAccountStr += "<p>付款金额：<span>"+data.amount + suffix;
										wxAccountStr += warning;
										wxAccountStr += "<p>微信收款码：<img src='"+data.alipayImg+"' /><div class='L_78_121'><span>微信</span><br />";
										wxAccountStr += "<img src='"+data.alipayImg+"'/><span>收款码</span><br /><a onclick='wechatWatch(this);'>立即查看</a></div></div>";
									}
									if (status == 1) {
										statusStr = "交易中";
									}
									if (status == 3) {
										statusStr = "已完成";
									}
									if (status == 4) {
										statusStr = "已取消";
									}
									if (status == 7) {
										statusStr = "已申诉";
									}
//									$(this).parent().after("<tr><td>aaaa").next().append("</td><td>bbbbb").append("</td><td>ccc</td></tr>");
									// 展示支付方式
									$(this).parent().after("<tr id='L_40_tr' style='height: 0px;'><td colspan='9'><div class='L_78_3' id='L_78_3'><div class='L_78_1'><fieldset style='border: 1px solid #D9DADB;border-radius: 4px;'><legend>请选择以下某种方式向卖家付款</legend>"+bankNameStr + alipayAccountStr + wxAccountStr +"</fieldset></div><div class='L_78_2'><p style='display: inline-block;width: 100%;height: 103px;line-height: 103px;'>"+statusStr+"<span style='margin-left: 20px;'><img src='img/L_15.png' style='position: relative;top: 3px;'/>还剩下55分55秒</span></p><p style='display: inline-block;width: 100%;height: 103px;line-height: 103px;color: #5c5c66;'><span><img src='img/L_14.png' style='position: relative;top: 3px;'/>  联系对方  </span><span><img src='img/L_18.png'  style='position: relative;top: 3px;'/>  我要申诉</span></p></div></div></td></tr>");
									/*$(this).parent().after("<tr id='L_40_tr' style='height: 0px;'><td colspan='9'><div class='L_78_3' id='L_78_3'><div class='L_78_1'>").next()
									.append("<fieldset style='border: 1px solid #D9DADB;border-radius: 4px;'><legend>请选择以下某种方式向卖家付款</legend>")
									.append(bankNameStr + alipayAccountStr + wxAccountStr)
									.append("</fieldset></div><div class='L_78_2'>")
									.append("<p style='display: inline-block;width: 100%;height: 103px;line-height: 103px;'>"+statusStr+"<span style='margin-left: 20px;'><img src='img/L_15.png' style='position: relative;top: 3px;'/>还剩下55分55秒</span></p>")
									.append("<p style='display: inline-block;width: 100%;height: 103px;line-height: 103px;color: #5c5c66;'><span><img src='img/L_14.png' style='position: relative;top: 3px;'/>  联系对方  </span><span><img src='img/L_18.png'  style='position: relative;top: 3px;'/>  我要申诉</span></p>")
									.append("</div></div></td></tr>");*/
									
									// flag 判断展示是否
									$(this).parent().attr("teststyle","testStyle");
								}
							}
						}
							
					});
				});
				
				
			}else {
				alert("用户订单查询:" + data.message);
			}
		}
	});
}



// 用户选择查看订单类型
function changeOrderStatus(status){
	$("#orderStatus").children().not(":last").attr("style","margin-right: 20px;");
	if (status == 1) {
		$("#orderStatus").children().eq(0).attr("style","margin-right: 20px;color: #41b2ce;");
	}
	if (status == 3) {
		console.debug($("#orderStatus").children().eq(1));
		$("#orderStatus").children().eq(1).attr("style","margin-right: 20px;color: #41b2ce;");
	}
	if (status == 4) {
		$("#orderStatus").children().eq(2).attr("style","margin-right: 20px;color: #41b2ce;");
	}
	if (status == 7) {
		$("#orderStatus").children().eq(3).attr("style","margin-right: 20px;color: #41b2ce;");
	}
	userOrderQuery(status);
}












// 我的商家订单
function busOrderList(){
	$.ajax({
		type: "GET",
		url: "http://192.168.0.148:8080/gme-web/api/v1/otc/busOrderList.json",
		data: "symbol=usdt",
		dataType: "json",
		success: function(data){
			if (data.code == 200) {
				$("#busDeityTable tr:not(:first)").remove();
				var dataChar = data.data.recordList;
				// 遍历返回的data对象
				for (var i = 0;i <dataChar.length; i++) {
					var data = dataChar[i];
					var payMethod = data.orderPayType; 
					// 支付方式
					
					var stradd = "";
					var typePre = "";
					var pay1 = payMethod.substring(0, 2);
					var pay2 = payMethod.substring(2, 4);
					var pay3 = payMethod.substring(4, 6);
					var statusStr = "";
					
					if(pay1 == "01") {
						stradd = stradd + "<img src='img/L_22.png' />&nbsp;";
					}
					if(pay2 == "01") {
						stradd =  stradd +"<img src='img/L_16.png' />&nbsp;";
					}
					if(pay3 == "01") {
						stradd =  stradd +"<img src='img/L_20.png' />&nbsp;";
					}
					
					if(data.orderType == 1) {
						typePre = "买入";
					}
					else if(data.orderType == 2) {
						typePre = "卖出";
					}
					
					if (data.orderStatus == 1) {
						statusStr = "委托中";
					}
					if (data.orderStatus == 2) {
						statusStr = "全部成交";
					}
					if (data.orderStatus == 3) {
						statusStr = "部分成交";
					}
					if (data.orderStatus == 4) {
						statusStr = "撤销";
					}
					
					$("#busDeityTable").append("<tr><td>"+data.orderId+"</td><td>"+data.createTime+"</td><td>"+typePre+"</td><td>"+data.orderPrice+"</td><td>"+data.orderNumber+"</td><td>"+data.orderAmount+"</td><td>"+data.orderMinAmount+"-"+data.orderMaxAmount+"</td><td>"+data.finishedNumber+"</td><td>"+statusStr+"</td><td>"+stradd+"</td><td><a style='display: inline-block;margin-left: 40px;'>撤销</a></td><input type='hidden' value='"+payMethod+"'></input></tr>");
				}
				
				
				// 给撤销绑定事件
				$("#busDeityTable tr:not(:first)").each(function(){
					var cancle = $(this).children().eq(-4).text();
					if (cancle != "撤销") {
						var orderId = $(this).children().first().text();
						var payMethod = $(this).children().eq(-1).last().val();
						$(this).children().eq(-2).children().click(function(){
							$.ajax({
								type: "POST",
								url: "http://192.168.0.148:8080/gme-web/api/v1/otc/busCancleOrder.json",
								data: "payMethod=" + payMethod + "&orderId=" + orderId,
								dataType: "json",
								success: function(data){
									if (data.code == 200) {
										alert("撤销成功");
										// 刷新
										busOrderList();
									}else {
										alert(data.message);
									}
								}
							});
						});
					}else {
						// 设置为不可撤销
						$(this).children().eq(-2).children().attr("href","javascript:return false").attr("style","display: inline-block;margin-left: 40px;opacity: 0.2;");
					}
					
				});
			}else {
				$("#busDeityTable tr:not(:first)").remove();
				console.debug(data.message);
			}
		}
	});
}


	// 查询我的商家接单
	function busOrderQuery(){
		$.ajax({
			type: "GET",
			url: "http://192.168.0.148:8080/gme-web/api/v1/otc/busOrderHistory.json",
			dataType: "json",
			data: "symbol=usdt",
			success :function(data) {
				if (data.code == 200) {
					$("#busOrderQuery tr:not(:first)").remove();
					$("#busPayment").attr("style","display:none;");
					var dataList = data.data.recordList;
					for (var i = 0; i < dataList.length; i++) {
						var data = dataList[i];
						
						var typeStr = "";
						var statusStr = "";
						
						if (data.type == 1) {
							typeStr = "买入";
						}
						if (data.type == 2) {
							typeStr = "卖出";
						}
						
						if (data.status == 1) {
							statusStr = "交易中";
						}
						if (data.status == 3) {
							statusStr = "已完成";
						}
						if (data.status == 4) {
							statusStr = "已取消";
						}
						if (data.status == 7) {
							statusStr = "已申诉";
						}
						
						$("#busOrderQuery").append("<tr><td>"+data.entryOrderId+"<img src='img/L_30.png' style='margin-left: 10px;'/></td><td>"+typeStr+"</td><td>"+data.price+"</td><td>"+data.number+"</td><td>"+data.amount+"</td><td>"+statusStr+"</td><td>对方姓名</td><td>"+data.createTime+"</td><td><a>撤销</a></td><input type='hidden' value='"+data.payMethod+"'></input></tr>");
						
					}
					
					
					// 给撤销绑定事件
					$("#busOrderQuery tr:not(:first)").each(function(){
						var orderId = $(this).children().first().text();
						var payMethod = $(this).children().eq(-1).val();
						var status = $(this).children().eq(5).text();
						if (status == "交易中") {
							$(this).children().eq(-2).children().click(function(){
								$.ajax({
									type: "POST",
									url: "http://192.168.0.148:8080/gme-web/api/v1/otc/busCancleOrder.json",
									data: "payMethod=" + payMethod + "&orderId=" + orderId,
									dataType: "json",
									success: function(data){
										if (data.code == 200) {
											alert("撤销成功");
											// 设置为不可撤销
											$(this).children().eq(-2).children().attr("href","javascript:return false").attr("style","display: inline-block;margin-left: 40px;opacity: 0.2;");
											// 刷新
											busOrderQuery();
										}else {
											alert(data.message);
										}
									}
								});
							});
						}else {
							// 设置为不可撤销
							$(this).children().eq(-2).children().attr("href","javascript:return false").attr("style","display: inline-block;margin-left: 40px;opacity: 0.2;");
						}
						
					});
					
					
					// 商家每个订单查看付款方式
					$("#busOrderQuery tr:not(:first)").each(function(){
						$(this).children().click(function(){
							if ($(this).parent().attr("teststyle") != "testStyle" && $(this).parent().parent().children("[teststyle='testStyle']").length != 0) {
								$(this).parent().parent().children("[teststyle='testStyle']").next().remove();
								$(this).parent().parent().children("[teststyle='testStyle']").attr("teststyle","");
							}
							// 判断是否展示
							if ($(this).parent().attr("teststyle") == "testStyle") {
								// 移除付款方式
								$(this).parent().next().remove();
								$(this).parent().attr("teststyle","");
								// 判断其他tr是否还有teststyle属性
								/*if ($(this).parent().parent().children("[teststyle='testStyle']")) {
									$(this).parent().parent().children("[teststyle='testStyle']").next().remove();
									$(this).parent().parent().children("[teststyle='testStyle']").attr("teststyle","");
								}*/
							}else {
								var orderId = $(this).parent().children().eq(0).text();
								for (var i = 0; i < dataList.length; i++) {
									var data = dataList[i];
									// 根据点击的orderId 查询数组中的支付方式
									if (data.entryOrderId == orderId) {
										var bankName = data.bankName;	
										var alipayAccount = data.alipayAccount;
										var wxAccount = data.wxAccount;
										
										var bankNameStr = "";
										var alipayAccountStr = "";
										var wxAccountStr = "";
										var statusStr = "";
										var suffix = "</span><a onclick='copyText(this);'>复制</a></p>";
										var warning = "<p><span>切勿备注&nbsp;比特币&nbsp;虚拟币&nbsp;等信息</span></p><p><span>请留意与卖家姓名是否一致</span></p>";
										var targetName = data.targetName;
										if (bankName != "") {
											bankNameStr += "<div class='fl L_78_11'><p><img src='img/L_21.png' />银行转账</p>";
											bankNameStr += "<p>实际姓名：<span>"+targetName + suffix;
											bankNameStr += "<p>银行名：<span>"+bankName + suffix;
											bankNameStr += "<p>支行：<span>"+data.bankBranch + suffix;
											bankNameStr += "<p>银行卡号：<span>"+data.bankCardNumber + suffix;
											bankNameStr += "<p>付款金额：<span>"+data.amount + suffix + "</div>";
											//alipayAccountStr = bankNameStr + alipayAccountStr;
										}
										if (alipayAccount != "") {
											alipayAccountStr += "<div class='fl L_78_12'><p><img src='img/L_23.png' />支付宝</p>";
											alipayAccountStr += "<p>卖家姓名：<span>"+targetName + suffix;
											alipayAccountStr += "<p>支付宝账号：<span>"+alipayAccount + suffix;
											alipayAccountStr += "<p>付款金额：<span>"+data.amount + suffix;
											alipayAccountStr += warning;
											alipayAccountStr += "<p>支付宝收款码：<img src='"+data.alipayImg+"' /><div class='L_78_121'><span>支付宝</span><br />";
											alipayAccountStr += "<img src='"+data.alipayImg+"'/><span>收款码</span><br /><a onclick='alipayWatch(this);'>立即查看</a></div></div>";
											//wxAccountStr = alipayAccountStr + wxAccountStr;
										}
										if (wxAccount != "") {
											wxAccountStr += "<div class='fl L_78_13'><p><img src='img/L_17.png' />微信</p>";
											wxAccountStr += "<p>卖家姓名：<span>"+targetName + suffix;
											wxAccountStr += "<p>微信账号：<span>"+wxAccount + suffix;
											wxAccountStr += "<p>付款金额：<span>"+data.amount + suffix;
											wxAccountStr += warning;
											wxAccountStr += "<p>微信收款码：<img src='"+data.alipayImg+"' /><div class='L_78_121'><span>微信</span><br />";
											wxAccountStr += "<img src='"+data.alipayImg+"'/><span>收款码</span><br /><a onclick='wechatWatch(this);'>立即查看</a></div></div>";
										}
										if (status == 1) {
											statusStr = "交易中";
										}
										if (status == 3) {
											statusStr = "已完成";
										}
										if (status == 4) {
											statusStr = "已取消";
										}
										if (status == 7) {
											statusStr = "已申诉";
										}
										// 展示支付方式
										$(this).parent().after("<tr id='L_40_tr' style='height: 0px;'><td colspan='9'><div class='L_78_3' id='L_78_3'><div class='L_78_1'><fieldset style='border: 1px solid #D9DADB;border-radius: 4px;'><legend>请选择以下某种方式向卖家付款</legend>"+bankNameStr + alipayAccountStr + wxAccountStr +"</fieldset></div><div class='L_78_2'><p style='display: inline-block;width: 100%;height: 103px;line-height: 103px;'>"+statusStr+"<span style='margin-left: 20px;'><img src='img/L_15.png' style='position: relative;top: 3px;'/>还剩下55分55秒</span></p><p style='display: inline-block;width: 100%;height: 103px;line-height: 103px;color: #5c5c66;'><span><img src='img/L_14.png' style='position: relative;top: 3px;'/>  联系对方  </span><span><img src='img/L_18.png'  style='position: relative;top: 3px;'/>  我要申诉</span></p></div></div></td></tr>");
										
										// flag 判断展示是否
										$(this).parent().attr("teststyle","testStyle");
									}
								}
							}
						});
					});
					
				}else {
					alert("查询我的商家接单：" +data.message);
				}
			}
		});
	}
	
	
	
	
	// 用户已付款
	function userPayFinish(){
		var orderId = 11;
		var payPassword = 22;
		$.ajax({
			type: "POST",
			url: "http://192.168.0.148:8080/gme-web/api/v1/otc/userPayFinish.json",
			dataType: "json",
			data: "payPassword=" + payPassword + "&orderId=" + orderId,
			success: function(data){
				if (data.code == 200) {
					alert("付款成功,请等候商家放行");
				}else {
					alert(data.message);
				}
			}
		});
	}



	// 商家放行
	function busCheckFinish(){
		var orderId = 20180705213519205672;
		var payPassword = 123;
		$.ajax({
			type: "POST",
			url: "http://192.168.0.148:8080/gme-web/api/v1/otc/busCheckFinish.json",
			dataType: "json",
			data: "payPassword=" + payPassword + "&orderId=" + orderId,
			success: function(data){
				if (data.code == 200) {
					alert("商家放行成功");
				}else {
					alert(data.message);
				}
			}
		});
	}
	
	
	
	
	
	
	
// 页面加载完毕，调用的方法
$(function(){
	// 行情
	showTicket();
	// 所有挂单
	showDeity(1);
	// 商家订单
	busOrderList();
	// 用户订单
	userOrderQuery(1);
	// 商家接单
	busOrderQuery();
});
	
	
	
		
		