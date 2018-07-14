
// 计算买入的总价
function checkBuyCalcAmount(num) {
	if(checkReg(num)) {
		var price = $("#buyPrice").val();
		var count = $("#buyCount").val();
		if (price != "") {
			$("#buyChangeCNY").text(price * 6);
		}
		if (price != "" && count != "") {
			$("#buyAmountSymbol").text(clacPrice(price,count));
			$("#buyAmountCNY").text($("#buyAmountSymbol").text() * 6);
		}
		return true;
	}else {
		return false;
	}
}
		
		
// 计算卖出的总价
function checkSellCalcAmount(num) {
	if(checkReg(num)) {
		var price = $("#sellPrice").val();
		var count = $("#sellCount").val();
		if (price != "") {
			$("#sellChangeCNY").text(price * 6);
		}
		if (price != "" && count != "") {
			$("#sellAmountSymbol").text(clacPrice(price,count));
			$("#sellAmountCNY").text($("#sellAmountSymbol").text() * 6);
		}
		return true;
	}else {
		return false;
	}
}


// 买入(交易)
$("#buyButton").click(function(){
	var pairId = $("#pairId").val();
	var price = $("#buyPrice").val();
	var amount = $("#buyCount").val();
	var tradeAuth = $("#buyPayPassword").val();
	if (price == "") {
		alert("请输入价格");
		return;
	}
	if (amount == "") {
		alert("请输入数量");
		return;
	}
	if (tradeAuth == "") {
		alert("请输入资金密码");
		return;
	}
	$.ajax({
		type: "POST",
		url: "http://192.168.0.148:8080/gme-web/api/v1/coin/bbBuySell.json",
		dataType: "json",
		data: "price=" + price + "&amount=" + amount + "&tradeAuth=" + tradeAuth + "&type=1" + "&pairId=" + pairId,
		success: function(data){
			alert(data.message);
		}
	});
});







// 卖出(交易)
$("#sellButton").click(function(){
	var pairId = $("#pairId").val();
	var price = $("#sellPrice").val();
	var amount = $("#sellCount").val();
	var tradeAuth = $("#sellPayPassword").val();
	if (price == "") {
		alert("请输入价格");
		return;
	}
	if (amount == "") {
		alert("请输入数量");
		return;
	}
	if (tradeAuth == "") {
		alert("请输入资金密码");
		return;
	}
	$.ajax({
		type: "POST",
		url: "http://192.168.0.148:8080/gme-web/api/v1/coin/bbBuySell.json",
		dataType: "json",
		data: "price=" + price + "&amount=" + amount + "&tradeAuth=" + tradeAuth + "&type=2" + "&pairId=" + pairId,
		success: function(data){
			alert(data.message);
		}
	});
});




// 我的成交记录
function currencyTransRecord(type){
	var pairId = $("#pairId").val();
	$.ajax({
		type: "POST",
		url: "http://192.168.0.148:8080/gme-web/api/v1/coin/transRecord.json",
		dataType: "json",
		data: "pairId=" + pairId + "&type=" + type,
		success: function(data){
			if (data.code == 200) {
				$("#myTransRecordTable tr:not(:first)").remove();
				var dataChar = data.data;
				for (var i = 0; i < dataChar.length; i++) {
					var data = dataChar[i];
					console.debug(data.date)
					var date = getFormatDateWithHours(data.date);
					if (data.type == 1) {
						$("#myTransRecordTable").append("<tr><td>"+date+"</td><td>买入</td><td>"+data.pairSymbol+"</td><td>"+data.price+"</td><td>"+data.amount+"</td><td>"+data.total+"</td><td>"+data.procedureFee+"</td></tr>");
					}
					if (data.type == 2) {
						$("#myTransRecordTable").append("<tr><td>"+date+"</td><td>卖出</td><td>"+data.pairSymbol+"</td><td>"+data.price+"</td><td>"+data.amount+"</td><td>"+data.total+"</td><td>"+data.procedureFee+"</td></tr>");
					}
				}
			}
		}	
	})
}



// 我的当前委托
function entrustRecord(type){
	var pairId = $("#pairId").val();
	var type = type;
	$.ajax({
		type: "POST",
		url: "http://192.168.0.148:8080/gme-web/api/v1/coin/entrustRecord.json",
		dataType: "json",
		data: "pairId=" + pairId + "&type=" + type,
		success: function(data){
			if (data.code == 200) {
				$("#myEntrustRecordTable tr:not(:first)").remove();
				var dataCharBuy = data.data.buyOrders;
				var dataCharSell = data.data.sellOrders;
				for (var i = 0; i < dataCharBuy.length; i++) {
					var data =  dataCharBuy[i];
					var date = getFormatDateWithHours(data.date);
					//订单状态；1-委托中;2-全部成交;3-部分成交;4撤销;
					if (data.status == 1) {
						$("#myEntrustRecordTable").append("<tr><td>"+date+"</td><td>买入</td><td>"+data.price+"</td><td>"+data.number+"</td><td>"+data.finished+"</td><td>"+data.finished+"</td><td>委托中</td><td><a>撤销</a><a>详情<img src='img/L_41.png' /></a></td><input type='hidden' value='"+data.orderId+"'/></tr>");
					}
					if (data.status == 2) {
						$("#myEntrustRecordTable").append("<tr><td>"+date+"</td><td>买入</td><td>"+data.price+"</td><td>"+data.number+"</td><td>"+data.finished+"</td><td>"+data.finished+"</td><td>全部成交</td><td><a>撤销</a><a>详情<img src='img/L_41.png' /></a></td><input type='hidden' value='"+data.orderId+"'/></tr>");
					}
					if (data.status == 3) {
						$("#myEntrustRecordTable").append("<tr><td>"+date+"</td><td>买入</td><td>"+data.price+"</td><td>"+data.number+"</td><td>"+data.finished+"</td><td>"+data.finished+"</td><td>部分成交</td><td><a>撤销</a><a>详情<img src='img/L_41.png' /></a></td><input type='hidden' value='"+data.orderId+"'/></tr>");
					}
					if (data.status == 4) {
						$("#myEntrustRecordTable").append("<tr><td>"+date+"</td><td>买入</td><td>"+data.price+"</td><td>"+data.number+"</td><td>"+data.finished+"</td><td>"+data.finished+"</td><td>撤销</td><td><a>详情<img src='img/L_41.png' /></a></td><input type='hidden' value='"+data.orderId+"'/></tr>");
					}
				}
				
				for (var i = 0; i < dataCharSell.length; i++) {
					var data =  dataCharSell[i];
					var date = getFormatDateWithHours(data.date);
					//订单状态；1-委托中;2-全部成交;3-部分成交;4撤销;
					if (data.status == 1) {
						$("#myEntrustRecordTable").append("<tr><td>"+date+"</td><td>卖出</td><td>"+data.price+"</td><td>"+data.number+"</td><td>"+data.finished+"</td><td>"+data.finished+"</td><td>委托中</td><td><a>撤销</a><a>详情</a></td><input type='hidden' value='"+data.orderId+"'/></tr>");
					}
					if (data.status == 2) {
						$("#myEntrustRecordTable").append("<tr><td>"+date+"</td><td>卖出</td><td>"+data.price+"</td><td>"+data.number+"</td><td>"+data.finished+"</td><td>"+data.finished+"</td><td>全部成交</td><td><a>撤销</a><a>详情<img src='img/L_41.png' /></a></td><input type='hidden' value='"+data.orderId+"'/></tr>");
					}
					if (data.status == 3) {
						$("#myEntrustRecordTable").append("<tr><td>"+date+"</td><td>卖出</td><td>"+data.price+"</td><td>"+data.number+"</td><td>"+data.finished+"</td><td>"+data.finished+"</td><td>部分成交</td><td><a>撤销</a><a>详情<img src='img/L_41.png' /></a></td><input type='hidden' value='"+data.orderId+"'/></tr>");
					}
					if (data.status == 4) {
						$("#myEntrustRecordTable").append("<tr><td>"+date+"</td><td>卖出</td><td>"+data.price+"</td><td>"+data.number+"</td><td>"+data.finished+"</td><td>"+data.finished+"</td><td>撤销</td><td><a>详情<img src='img/L_41.png' /></a></td><input type='hidden' value='"+data.orderId+"'/></tr>");
					}
				}
				
				
				// 查看详情
				$("#myEntrustRecordTable tr:not(:first)").each(function(){
					if ($(this).children().eq(-2).children().eq(-1).text() == "详情") {
						$(this).children().eq(-2).children().eq(-1).click(function(){
							if ($(this).attr("testStyle") == "testStyle") {
								// 详情已经展示，用户想要隐藏
								//$(".L_91_3").css("display","none");
								$(this).attr("testStyle","");
								var len = $(".L_91_3").length;
								for (var i = 0; i < len; i++) {
									// 如果是 详情信息再删除
									if ($(this).parent().parent().next().children().children().attr("class") == "L_91_3") {
										$(this).parent().parent().next().remove();
									}
								}
							}else {
								var orderId = $(this).parent().next().val();
								$.ajax({
									type: "POST",
									url: "http://192.168.0.148:8080/gme-web/api/v1/coin/queryDetial.json",
									dataType: "json",
									data: "orderId=" + orderId,
									success: function(data){
										alert("查看详情:" + data.message);
										if (data.code == 200) {
											var dataChar = data.data;
											for (var i = 0; i < dataChar.length; i++) {
												var data = dataChar[i];
												// 成交额
												var total = toNonExponential(data.price * data.number);
												$(this).parent().parent().after("<tr><td colspan='8' style='height: 0px;'><div class='L_91_3'><ul><li>时间</li><li>价格</li><li>成交数量</li><li>成交额</li><li>手续费</li></ul></div></td></tr>");
												$(this).parent().parent().next().children().children().append("<ul><li>"+data.date+"</li><li>"+data.price+"</li><li>"+data.number+"</li><li>"+total+"</li><li>"+data.手续费+"</li></ul>");
											}
											
											$(".L_91_3").css("display","block");
											// 给a标签添加一个属性做判断
											$(this).attr("testStyle","testStyle");
										}
									}
								})
								
//								$(this).parent().parent().after("<tr><td colspan='8' style='height: 0px;'><div class='L_91_3'><ul><li>时间</li><li>价格</li><li>成交数量</li><li>成交额</li><li>手续费</li></ul><ul><li>1</li><li>1</li></ul></div></td></tr>");
//								$(this).parent().parent().after("<tr><td colspan='8' style='height: 0px;'><div class='L_91_3'><ul><li>时间</li><li>价格</li><li>成交数量</li><li>成交额</li><li>手续费</li></ul><ul><li>2</li><li>2</li></ul></div></td></tr>");
//								$(this).parent().parent().after("<tr><td colspan='8' style='height: 0px;'><div class='L_91_3'><ul><li>时间</li><li>价格</li><li>成交数量</li><li>成交额</li><li>手续费</li></ul><ul><li>3</li><li>3</li></ul></div></td></tr>");
//								$(this).attr("testStyle","testStyle");
//								$(".L_91_3").css("display","block");
							}
						});
					}
				});
				
				
				
				
				
				// 撤销
				$("#myEntrustRecordTable tr:not(:first)").each(function(){
					if ($(this).children().eq(-2).children().eq(0).text() == "撤销") {
						$(this).children().eq(-2).children().eq(0).click(function(){
							var orderId = $(this).parent().next().val();
							$.ajax({
								type: "POST",
								url: "http://192.168.0.148:8080/gme-web/api/v1/coin/cancelCoinOrder.json",
								dataType: "json",
								data: "orderId=" + orderId,
								success: function(data){
									alert("撤销:" + data.message);
									if (data.code == 200) {
										// 重新请求
										entrustRecord(pairId,type);
									}
								}
							})
						});
					}
				});
				
				
				
			}
		}
	})
}





// 平台实时交易记录
function realTimeTradeRecord(){
	var pairId = $("#pairId").val();
	$.ajax({
		type: "GET",
		url: "http://192.168.0.148:8080/gme-web/api/v1/coin/realTimeTradeRecord.json",
		dataType: "json",
		data: "pairId=" + pairId,
		success: function(data){
			if (data.code == 200) {
				$("#platformTransRecord").children(":tr").remove();
				var dataChar = data.data;
				for (var i = 0; i < dataChar.length; i++) {
					var data = dataChar[i];
					$("#platformTransRecord").append("<tr><td>"+data.price+"</td><td>"+data.total+"</td><td>"+data.date+"</td></tr>");
				}
			}
		}
	})
}



// 买卖委托单
function buySellOrder(pairId){
	$.ajax({
		type: "GET",
		url: "http://192.168.0.148:8080/gme-web/api/v1/coin/buySellOrders.json",
		dataType: "json",
		data: "pairId=" + pairId,
		success: function(data){
			if (data.code == 200) {
				$("#buying tr:not(:first)").remove();
				$("#selling tr:not(:first)").remove();
				var dataCharBuy = data.data.buyOrders;
				var dataCharSell = data.data.sellOrders;
				for (var i = 0; i < dataCharBuy.length; i++) {
					var data = dataCharBuy[i];
					var amount = toNonExponential(data.price * data.number);
					$("#buying").append("<tr><td>"+data.price+"</td><td>"+data.number+"</td><td>"+amount+"</td><tr>");
				}
				for (var j = 0; j < dataCharSell.length; j++) {
					var data = dataCharSell[j];
					var amount = toNonExponential(data.price * data.number);
					$("#selling").append("<tr><td>"+data.price+"</td><td>"+data.number+"</td><td>"+amount+"</td><tr>");
				}
				
				
				
				// 给tr注册事件，填写买卖交易的文本框
				$("#buying tr:not(:first)").each(function(){
					$(this).click(function(){
						$("#buyPrice").val($(this).children().eq(0).text());
						$("#sellPrice").val($(this).children().eq(0).text());
					});
				});
				
				$("#selling tr:not(:first)").each(function(){
					$(this).click(function(){
						$("#buyPrice").val($(this).children().eq(0).text());
						$("#sellPrice").val($(this).children().eq(0).text());
					});
				});
				
			}
		}
	})
}


// 将科学计数法转换为数字	
function toNonExponential(num) {
    var m = num.toExponential().match(/\d(?:\.(\d*))?e([+-]\d+)/);
    return num.toFixed(Math.max(0, (m[1] || '').length - m[2]));
}


//格式化时间 yyyy-MM-dd hh:mm:ss
function getFormatDateWithHours(date) {
	var date = new Date(date);
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var strHours = date.getHours();
    var strMin = date.getMinutes();
    var strSeconds = date.getSeconds();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if (strHours >= 0 && strHours <= 9) {
    	strHours = "0" + strHours;
    }
    if (strMin >= 0 && strMin <= 9) {
    	strMin = "0" + strMin;
    }
    if (strSeconds >= 0 && strSeconds <= 9) {
    	strSeconds = "0" + strSeconds;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + strHours + seperator2 + strMin
            + seperator2 + strSeconds;
    return currentdate;
}



//格式化时间 hh:mm:ss




var pairId = $("#pairId").val();
// 我的成交记录
currencyTransRecord(3);
// 我的当前委托
entrustRecord(3);
// 平台实时交易记录
realTimeTradeRecord();
// 买卖委托单
buySellOrder(pairId);

//k线30分钟
sf(30);