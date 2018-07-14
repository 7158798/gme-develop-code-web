<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				dataType: "json",
				success: function(data) {
					if (data.code == 200) {
						var currencyId = $("#hiddenId").val();
						$.each(data.data,function(index,item){
							$.each(item,function(index,item){
								if (currencyId == null || currencyId == "") {
									$("#currencyId").append("<option value='"+item.currencyId+"'>"+item.name+"</option>");
								}else {
									if (currencyId == item.currencyId) {
										$("#currencyId").append("<option value='"+item.currencyId+"' selected='selected'>"+item.name+"</option>");
									}else {
										$("#currencyId").append("<option value='"+item.currencyId+"'>"+item.name+"</option>");
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
					充值记录
				</div>
				<form action="rechargeRecord.html" method="post">
				<div class="L_42">
					<span>币种</span>
					<input type="hidden" value="${review.currencyId}" id="hiddenId"/>
					<select id="currencyId" name="currencyId">
						<option value="">全部</option>
					</select>
					<span>状态</span>
					<select id="status" name="status">
						<option value="">全部</option>
						<option value="1" <c:if test="${review.status == 1}"> <c:out value='selected="selected"'></c:out></c:if>>等待确认</option>
						<option value="2" <c:if test="${review.status == 2}"> <c:out value='selected="selected"'></c:out></c:if>>成功</option>
						<option value="3" <c:if test="${review.status == 3}"> <c:out value='selected="selected"'></c:out></c:if>>失败</option>
					</select>
					<span>时间</span>
					<input type="date" id="startTime" name="startTime" value="${review.startTime}" />
					<span style="margin: 0px;">-</span>
					<input type="date" id="endTime" name="endTime" value="${review.endTime}"/>
					<input type="submit" id="button" value="查询" style="width: 48px;height: 30px;color: #FFFFFF;background: #00BEC1;border-radius: 2px;" />
				</div>
				<table class="L_40">
					<tr>
						<th style="width: 7%;">订单号</th>
						<th>币种类型</th>
						<th>时间</th>
						<th>数量</th>
						<th>TX ID</th>
						<th>确认个数</th>
						<th>状态</th>
					</tr>
					<c:if test="${pageBean != null && pageBean.recordList != null}">
						<c:forEach items="${pageBean.recordList}" var="data">
							<tr>
								<td><c:out value="${data.rechargeId}"></c:out></td>
								<td><c:out value="${data.currencyId}"></c:out></td>
								<td>${data.updatedTime}</td>
								<%-- <td><fmt:formatDate value="${data. }" pattern="yyyy-MM-dd"/></td> --%>
								<td><c:out value="${data.amount}"></c:out></td>
								<td><c:out value="${data.txId}"></c:out></td>
								<td><c:out value="${data.confirmNumber}"></c:out></td>
								<td>
									<c:if test="${data.status == 1}">
										<c:out value="等待确认"></c:out>
									</c:if>
									<c:if test="${data.status == 2}">
										<c:out value="成功"></c:out>
									</c:if>
									<c:if test="${data.status == 3}">
										<c:out value="失败"></c:out>
									</c:if>
								</td>
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
					var status = $("#status").val();
					var startTime = $("#startTime").val();
					var endTime = $("#endTime").val();
					$("#nextPage").attr("href","rechargeRecord.html?pageNum="+(currentPage+1)+"&currencyId=" + currencyId + "&status=" +
																			status + "&startTime=" + startTime + "&endTime=" + endTime);
				});
			}
			
			// 是否能上一页
			if ((currentPage - 1) >= 1) {
				$("#prePage").click(function(){
				var currencyId = $("#currencyId").val();
				var status = $("#status").val();
				var startTime = $("#startTime").val();
				var endTime = $("#endTime").val();
				$("#prePage").attr("href","rechargeRecord.html?pageNum="+(currentPage-1)+"&currencyId=" + currencyId + "&status=" +
																		status + "&startTime=" + startTime + "&endTime=" + endTime);
				});
			}
		</script>
		
	</body>

</html>