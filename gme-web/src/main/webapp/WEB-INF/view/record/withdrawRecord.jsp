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
	</head>

	<body class="">
			<div class="L_36">
				<div class="L_39" style="border-bottom: 1px solid #E6EAF0;">
					提现记录
				</div>
				<div class="L_42">
					<span>币种</span>
					<select>
						<option value="volvo">全部</option>
						<option value="saab">BTC</option>
						<option value="opel">ETH</option>
						<option value="audi">CBD</option>
					</select>
					<span>状态</span>
					<select>
						<option value="volvo">全部</option>
						<option value="saab">BTC</option>
						<option value="opel">ETH</option>
						<option value="audi">CBD</option>
					</select>
					<span>时间</span>
					<input type="date" name="user_date" />
					<span style="margin: 0px;">-</span>
					<input type="date" name="user_date" />
					<input type="button" value="查询" style="width: 48px;height: 30px;color: #FFFFFF;background: #00BEC1;border-radius: 2px;" />
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
					<c:if test="${list != null}">
						<c:forEach items="${list}" var="data">
							<tr>
								<td>${data.withdrawalId}</td>
								<td>
									<c:if test="${data.currencyId == 1}">
										<c:out value="BTC"></c:out>
									</c:if>
									<c:if test="${data.currencyId == 2}">
										<c:out value="USDT"></c:out>
									</c:if>
									<c:if test="${data.currencyId == 3}">
										<c:out value="LTC"></c:out>
									</c:if>
								</td>
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
					<span>上一页</span>
					<span>下一页</span>
				</div>
			</div>
			
		<script type="text/javascript" src="js/style.js"></script>
	</body>

</html>