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
			
		</script>
	</head>

	<body class="">
				<div class="L_39">
					账单明细
				</div>
				<div class="L_42">
					<span>币种</span>
					<select id="currencyId" name="currencyId">
						<option value="">全部</option>
					</select>
					<span>业务类型</span>
					<select id="bizType" name="bizType">
						<option value="">全部</option>
						<option value="1">提现</option>
						<option value="2">充值</option>
						<option value="3">交易</option>
						<option value="4">C2C</option>
					</select>
					<span>时间</span>
					<input type="date" id="startTime"/>
					<span style="margin: 0px;">-</span>
					<input type="date" id="endTime"/>
					<input type="button" id="button" value="查询" style="width: 48px;height: 30px;color: #FFFFFF;background: #00BEC1;border-radius: 2px;" />
				</div>
				<table id="billTable" class="L_40">
					<tr>
						<th style="width: 7%;">序号</th>
						<th>时间</th>
						<th>业务类型</th>
						<th>操作单号</th>
						<th>操作金额</th>
						<th>账户余额</th>
					</tr>
				</table>
				<div class="L_41">
					<span>1</span>
					<span style="background: #2B6FC9;color: #FFFFFF;">2</span>
					<span>...</span>
					<input type="hidden" id="currentPage"/>
					<input type="hidden" id="pageCount"/>
					<span><a id="prePage">上一页</a></span>
					<span><a id="nextPage">下一页</a></span>
				</div>
		<script type="text/javascript" src="js/style.js"></script>
		<script type="text/javascript" src="js/utils.js"></script>
		<script type="text/javascript" src="js/page/userInfo/bill.js"></script>
		
		
	</body>

</html>