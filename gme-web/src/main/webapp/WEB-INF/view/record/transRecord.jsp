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
		<script type="text/javascript">
			$.ajax({
				type: 'GET',
				url: "http://192.168.0.148:8080/gme-web/api/v1/operation/coinList.json",
				data: "isToken=1",
				dataType: "json",
				success: function(data) {
					if (data.code == 200) {
						var hiddenSymbol = $("#hiddenSymbol").val();
						$.each(data.data,function(index,item){
							$.each(item,function(index,item){
								if (item.isToken == 1) {
									if (hiddenSymbol == null || hiddenSymbol == "") {
										$("#currencySymbol").append("<option value='"+item.currencyId+"'>"+item.name+"</option>");
									}else {
										if (hiddenSymbol == item.currencyId) {
											$("#currencySymbol").append("<option value='"+item.currencyId+"' selected='selected'>"+item.name+"</option>");
										}else {
											$("#currencySymbol").append("<option value='"+item.currencyId+"'>"+item.name+"</option>");
										}
									}
								}
							});
						});
						$("#currencySymbol").change(function(){
							// 清空 currencyId下拉列表
							$("#currencyId option").not(":first").remove(); 
							$.ajax({
								type: 'GET',
								url: "http://192.168.0.148:8080/gme-web/api/v1/operation/coinTradePairList.json",
								data: "currencyId="+$(this).val(),
								dataType: "json",
								success: function(data){
									if (data.code == 200) {
										var currencyId = $("#hiddenId").val();
										$.each(data.data,function(index,item){
											$.each(item,function(index,item){
												if (currencyId == null || currencyId == "") {
													$("#currencyId").append("<option value='"+item.currencyId+"'>"+item.currencySymbol+"</option>");
												}else {
													if (currencyId == item.currencyId) {
														$("#currencyId").append("<option value='"+item.currencyId+"' selected='selected'>"+item.currencySymbol+"</option>");
													}else {
														$("#currencyId").append("<option value='"+item.currencyId+"'>"+item.currencySymbol+"</option>");
													}
												}
											});
										});
									}
								}
							});
						});
					}
				}
			});
		</script>
		
	</head>

	<body class="">
	<div class="L_36">
				<div class="L_39" style="border-bottom: 1px solid #E6EAF0;">
					我的交易记录
				</div>
				<form action="transRecord.html" method="post">
				<div class="L_42">
					<span>市场</span>
					<input type="hidden" value="${review.currencySymbol}" id="hiddenSymbol"/>
					<select id="currencySymbol" name="currencySymbol">
						<option value="">全部</option>
					</select>
					<span>币种</span>
					<input type="hidden" value="${review.currencyId}" id="hiddenId"/>
					<select id="currencyId" name="currencyId">
						<option value="">全部</option>
					</select>
					<span>时间</span>
					<input type="date" id="startTime" name="startTime" value="${review.startTime}"/>
					<span style="margin: 0px;">-</span>
					<input type="date" id="endTime" name="endTime" value="${review.endTime}" />
					<input type="submit" id="button" value="查询" style="width: 48px;height: 30px;color: #FFFFFF;background: #00BEC1;border-radius: 2px;" />
				</div>
				<table class="L_40">
					<tr>
						<th>日期</th>
						<th>类型</th>
						<th>交易对</th>
						<th>交易价</th>
						<th>挂单量(锁定)</th>
						<th>总计</th>
					</tr>
					<c:if test="${pageBean != null && pageBean.recordList != null}">
						<c:forEach items="${pageBean.recordList}" var="data">
							<tr>
								<td>${data.time}</td>
								<c:if test="${data.type == '买入' }">
									<td class="L_40m">买入</td>
								</c:if>
								<c:if test="${data.type == '卖出' }">
									<td class="L_40mc">卖出</td>
								</c:if>
								<td>${data.symbol}</td>
								<td>${data.transPrice}</td>
								<td>${data.num}</td>
								<td>${data.amount}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<div class="L_41">
					<span>1</span>
					<span style="background: #2B6FC9;color: #FFFFFF;">2</span>
					<span>...</span>
					<span><a id="prePage">上一页</a></span>
					<span><a id="nextPage">下一页</a></span>
				</div>
				</form>
			</div>
		<script type="text/javascript" src="js/style.js"></script>
		<script type="text/javascript">
			var currentPage = ${pageBean.currentPage}; 
			var totalPage = ${pageBean.pageCount};
			// 是否能下一页
				// 如果当前页加1大于总页数
			if ((currentPage + 1) <= totalPage) {
				$("#nextPage").click(function(){
					var currencyId = $("#currencyId").val();
					var currencySymbol = $("#currencySymbol").val();
					var startTime = $("#startTime").val();
					var endTime = $("#endTime").val();
					$("#nextPage").attr("href","transRecord.html?pageNum="+(currentPage+1)+"&currencyId=" + currencyId + "&currencySymbol=" +
																			currencySymbol + "&startTime=" + startTime + "&endTime=" + endTime);
				});
			}
			
			// 是否能上一页
			if ((currentPage - 1) >= 1) {
				$("#prePage").click(function(){
					var currencyId = $("#currencyId").val();
					var currencySymbol = $("#currencySymbol").val();
					var startTime = $("#startTime").val();
					var endTime = $("#endTime").val();
					$("#prePage").attr("href","transRecord.html?pageNum="+(currentPage-1)+"&currencyId=" + currencyId + "&currencySymbol=" +
																		currencySymbol + "&startTime=" + startTime + "&endTime=" + endTime);
				});
			}
		</script>
		
		
		
		<script type="text/javascript">
			// 清空 currencyId下拉列表
			$("#currencyId option").not(":first").remove();
			$.ajax({
				type: 'GET',
				url: "http://192.168.0.148:8080/gme-web/api/v1/operation/coinTradePairList.json",
				data: "currencyId="+$(this).val(),
				dataType: "json",
				success: function(data){
					if (data.code == 200) {
						var currencyId = $("#hiddenId").val();
						$.each(data.data,function(index,item){
							$.each(item,function(index,item){
								if (currencyId == null || currencyId == "") {
									$("#currencyId").append("<option value='"+item.currencyId+"'>"+item.currencySymbol+"</option>");
								}else {
									if (currencyId == item.currencyId) {
										$("#currencyId").append("<option value='"+item.currencyId+"' selected='selected'>"+item.currencySymbol+"</option>");
									}else {
										$("#currencyId").append("<option value='"+item.currencyId+"'>"+item.currencySymbol+"</option>");
									}
								}
							});
						});
					}
				}
			});
		
		</script>
	</body>

</html>