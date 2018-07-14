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
				<div class="L_39">
					最新挂单
				</div>
				<table class="L_40">
					<tr>
						<th>日期</th>
						<th>类型</th>
						<th>交易对</th>
						<th>交易价</th>
						<th>挂单量(锁定)</th>
						<th>总计</th>
						<th>操作</th>
					</tr>
					<c:if test="${pageBean != null && pageBean.recordList != null}">
						<c:forEach items="${pageBean.recordList}" var="data">
							<tr>
								<td><c:out value="${data.time}"></c:out></td>
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
								<td><a href="#">撤销</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<div class="L_41">
					<span>1</span>
					<span style="background: #2B6FC9;color: #FFFFFF;">2</span>
					<span>...</span>
					<span><a id="prePage" href="#">上一页</a></span>
					<span><a id="nextPage" href="#">下一页</a></span>
				</div>
			</div>
		<script type="text/javascript" src="js/style.js"></script>
		<script type="text/javascript">
			var currentPage = ${pageBean.currentPage}; 
			var totalPage = ${pageBean.pageCount};
			// 是否能下一页
				// 如果当前页加1大于总页数
			if ((currentPage + 1) <= totalPage) {
				$("#nextPage").attr("href","myDeity.html?pageNum="+(currentPage+1));
			}
			
			// 是否能上一页
			if ((currentPage - 1) >= 1) {
				$("#prePage").attr("href","myDeity.html?pageNum="+(currentPage-1));
			}
		</script>
	</body>

</html>