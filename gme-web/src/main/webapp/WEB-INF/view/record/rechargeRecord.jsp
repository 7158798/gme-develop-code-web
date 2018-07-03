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

	</head>

	<body class="">
			<div class="L_36">
				<div class="L_39" style="border-bottom: 1px solid #E6EAF0;">
					充值记录
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
					<c:if test="${pageBean != null}">
						<span><a href="rechargeRecord.html?pageNum=${pageBean.currentPage + 1 > ${pageBean.pageCount} ? ${pageBean.currentPage} : ${pageBean.currentPage + 1} } ">下一页</a></span>
						
						<span><a href="rechargeRecord.html?pageNum=${pageBean.currentPage - 1 < 1 ? ${pageBean.currentPage} : ${pageBean.currentPage - 1} } ">上一页</a></span>
					</c:if>
				</div>
			</div>
		<script type="text/javascript" src="js/style.js"></script>
		<script type="text/javascript">
			var currentPage = ${pageBean.currentPage}; 
			var totalPage = ${pageBean.totalCount};
			// 是否能下一页
			function nextPageIsEnable (){
				// 如果当前页加1大于总页数
				if ((currentPage + 1) > totalPage) {
					return false;
				}
				return true;
			}
			
			// 是否能上一页
			function prePageIsEnable (){
				if ((currentPage - 1) < 1) {
					return false;
				}
				return true;
			}
			
			function nextPage (){
				if (nextPageIsEnable) {
					var pageNum = currentPage+1;
					window.location.href = "rechargeRecord.html?pageNum=${pageBean.currentPage + 1 }";
				}
			}
			
			function prePage (){
				if (prePageIsEnable) {
					var pageNum = currentPage-1;
					window.location.href = "rechargeRecord.html?pageNum="+pageNum;
				}
			}
		</script>
	</body>

</html>