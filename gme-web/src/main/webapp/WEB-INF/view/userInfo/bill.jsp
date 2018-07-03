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
	</head>

	<body class="">
			<div class="L_36">
				<div class="L_39" style="border-bottom: 1px solid #E6EAF0;">
					账单明细
				</div>
				<div class="L_42">
					<span>币种</span>
					<select>
						<option value="volvo">全部</option>
						<option value="saab">BTC</option>
						<option value="opel">ETH</option>
						<option value="audi">CBD</option>
					</select>
					<span>操作类型</span>
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
						<th style="width: 7%;">序号</th>
						<th>时间</th>
						<th>操作类型</th>
						<th>操作单号</th>
						<th>操作金额</th>
						<th>账户余额</th>
						<th>账号总额</th>
					</tr>
					<c:if test="${list != null}">
						<c:forEach items="${list}" var="data" varStatus="num">
							<tr>
								<td>${num.index + 1}</td>
								<td>${data.time}</td>
								<td>${data.operationType}</td>
								<td>${data.assetId}</td>
								<td>${data.operationAsset}</td>
								<td>${data.balance}</td>
								<td>${data.totalAsset}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${list == null }">
						<tr>
							<td>1</td>
							<td>2018-05-23 16:20:00</td>
							<td>充值</td>
							<td>20180630</td>
							<td>80.0000 USDT</td>
							<td>80.0000 USDT</td>
							<td>80.0000 USDT</td>
						</tr>
					</c:if>
				</table>
				<div class="L_41">
					<span>1</span>
					<span style="background: #2B6FC9;color: #FFFFFF;">2</span>
					<c:if test="${list != null}">
						<span><a href="bill.html">上一页</a></span>
						<span>下一页</span>
					</c:if>
				</div>
			</div>
		<script type="text/javascript" src="js/style.js"></script>
	</body>

</html>