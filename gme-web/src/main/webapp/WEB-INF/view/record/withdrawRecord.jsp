<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
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
		<!-- <script type="text/javascript">
			$.ajax({
				type: 'GET',
				url: "http://192.168.0.148:8080/gme-web/api/v1/security/checkUserIdentify.json",	
				dataType: "json",
				success: function(data) {
					if (data.code != 200) {
						// 如果检查用户信息出错，
						alert(data.message);
						//window.location.reload();
						return;
					}else if (data.data.bindPhone != true) {
						// 如果检查用户没有绑定手机号
						window.location.href="http://192.168.0.148:8080/gme-web/firstLogin.html";
						return;
					}
				}
			});
		</script> -->
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
					提现记录
				</div>
				<form action="withdrawRecord.html" method="post">
				<div class="L_42">
					<span>币种</span>
					<input type="hidden" value="${review.currencyId}" id="hiddenId"/>
					<select id="currencyId" name="currencyId">
						<option value="">全部</option>
					</select>
					<span>状态</span>
					<select id="status" name="status">
						<option value="">全部</option>
						<option value="1" <c:if test="${review.status == 1}"> <c:out value='selected="selected"'></c:out></c:if> >申请</option>
						<option value="2" <c:if test="${review.status == 2}"> <c:out value='selected="selected"'></c:out></c:if> >处理中</option>
						<option value="3" <c:if test="${review.status == 3}"> <c:out value='selected="selected"'></c:out></c:if> >已处理</option>
						<option value="4" <c:if test="${review.status == 4}"> <c:out value='selected="selected"'></c:out></c:if> >已拒绝</option>
						<option value="5" <c:if test="${review.status == 5}"> <c:out value='selected="selected"'></c:out></c:if> >撤销</option>
					</select>
					<span>时间</span>
					<input type="date" id="startTime" name="startTime" value="${review.startTime}"/>
					<span style="margin: 0px;">-</span>
					<input type="date" id="endTime" name="endTime" value="${review.endTime}" />
					<input type="submit" value="查询" style="width: 48px;height: 30px;color: #FFFFFF;background: #00BEC1;border-radius: 2px;" />
				</div>
				
				<table class="L_40">
					<tr>
						<th style="width: 7%;">单号</th>
						<th>币种类型</th>
						<th>时间</th>
						<th>提币数量</th>
						<th>手续费</th>
						<th>实际到账数量</th>
						<th>体现地址</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
					<c:if test="${pageBean != null && pageBean.recordList != null}">
						<c:forEach items="${requestScope.pageBean.recordList}" var="data">
							<tr>
								<td>${data.withdrawalId}</td>
								<td><c:out value="${data.currencySymbol}"></c:out></td>
								<td>${data.updatedTime}</td>
								<%-- <td><fmt:formatDate value="${data. }" pattern="yyyy-MM-dd"/></td> --%>
								<td><c:out value="${data.requestAmount}"></c:out></td>
								<td><c:out value="${data.serviceCharge}"></c:out></td>
								<td><c:out value="${data.realAmount}"></c:out></td>
								<td><c:out value="${data.walletAddress}"></c:out></td>
								<td>
									<c:if test="${data.status == 1}">
										<c:out value="申请"></c:out>
									</c:if>
									<c:if test="${data.status == 2}">
										<c:out value="处理中"></c:out>
									</c:if>
									<c:if test="${data.status == 3}">
										<c:out value="已处理"></c:out>
									</c:if>
									<c:if test="${data.status == 4}">
										<c:out value="已拒绝"></c:out>
									</c:if>
									<c:if test="${data.status == 5}">
										<c:out value="撤销"></c:out>
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
					$("#nextPage").attr("href","withdrawRecord.html?pageNum="+(currentPage+1)+"&currencyId=" + currencyId + "&status=" +
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
					$("#prePage").attr("href","withdrawRecord.html?pageNum="+(currentPage-1)+"&currencyId=" + currencyId + "&status=" +
							status + "&startTime=" + startTime + "&endTime=" + endTime);
				});
			}
		</script>
		
	</body>

</html>