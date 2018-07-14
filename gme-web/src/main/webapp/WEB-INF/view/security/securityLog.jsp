<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

		<!--
        	作者：李德芳
        	时间：2018-06-28
        	描述：
        -->
			<div class="L_36" style="height: 100%;min-height: 800px;">
				<div class="L_84">
					您尚未实名认证！为保障您的资金安全，在完成实名认证之前，您将不能进行C2C交易，提币等操作。
					<a href="#" style="display: inline-block;background: #fb9a00;color: #FFFFFF;">立即认证</a>
				</div>
				<div class="L_39" style="border-bottom: 2px solid #fafbfc;">
					安全日志
				</div>
				<div class="L_49">
					<div class="L_51" style="max-height: 500px;overflow-y: auto;">
						<table id="logList" class="L_40" style="width: 100%;">
							<tr>
								<th style="width: 0%;">序号</th>
								<th>时间</th>
								<th>登录方式</th>
								<th>IP</th>
								<th>状态</th>
								<th>语言</th>
							</tr>
							<tr>
								<td>1</td>
								<td>2018-06-29 16:13:00 32分钟之前</td>
								<td>web</td>
								<td>
									<a>查看</a>
								</td>
								<td>
									成功
								</td>
								<td>
									cn
								</td>
							</tr>
						</table>
					</div>
					<div class="L_49" style="width: 100%;">
						<div class="L_50" style="margin-top: 30px;">
							<span style="font-size: 15px;color: #152137;float: left;">安全设置历史</span>
						</div>
						<div class="L_51">
							<table id="historyList" class="L_40" style="width: 100%;">
								<tr>
									<th style="width: 0%;">序号</th>
									<th>时间</th>
									<th>操作</th>
									<th>IP</th>
								</tr>
								<tr>
									<td>
										1
									</td>
									<td>2018-06-29 16:13:00  32分钟之前</td>
									<td>修改登录密码</td>
									<td><a>查看</a></td>
								</tr>
								<tr>
									<td>
										1
									</td>
									<td>2018-06-29 16:13:00  32分钟之前</td>
									<td>修改登录密码</td>
									<td><a>查看</a></td>
								</tr>
								<tr>
									<td>
										1
									</td>
									<td>2018-06-29 16:13:00  32分钟之前</td>
									<td>修改登录密码</td>
									<td><a>查看</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>	
			</div>

		<script type="text/javascript" src="js/style.js"></script>
		
		
		<script type="text/javascript">
			// 当前服务器时间
			function currentTime(){
				$.ajax({
					type: "GET",
					url: "http://192.168.0.148:8080/gme-web/api/v1/security/systemTime.json",
					dataType: "json",
					success: function(data){
						if (data.code == 200) {
							$("#time").text(data.data);
						}
					}
				});
			}
		</script>
		
		
		
		<script type="text/javascript">
			// 查询安全日志
			function securityLog(){
				$.ajax({
					type: "GET",
					url: "http://192.168.0.148:8080/gme-web/api/v1/security/securityLogList.json",
					dataType: "json",
					success: function(data){
						if (data.code == 200) {
							$("#logList tr:not(:first)").remove();
							var dataChar = data.data;
							for (var i = 0; i < data.length; i++) {
								var data = dataChar[i];
								$("#logList").append("<tr><td>"+序号+"</td><td>"+时间+"</td></td>"+登录方式+"</td><td><a>"+IP+"</a></td><td>"+状态+"</td><td>"+语言+"</td></tr>");
							}
						}
					}
				})
			}
		</script>
		
		
		<script type="text/javascript">
			// 查询安全设置历史
			function securityOperationHistory(){
				$.ajax({
					type: "GET",
					url: "http://192.168.0.148:8080/gme-web/api/v1/security/securityOperationHistory.json",
					dataType: "json",
					success: function(data){
						if (data.code == 200) {
							$("#historyList tr:not(:first)").remove();
							var dataChar = data.data;
							for (var i = 0; i < data.length; i++) {
								var data = dataChar[i];
								$("#historyList").append("<tr><td>"+序号+"</td><td>"+时间+"</td></td>"+操作+"</td><td><a>"+IP+"</a></td></tr>");
							}
						}
					}
				})
			}
		
		</script>
		
		
		
		
		
		
		<script type="text/javascript">
			// 格式化时间 yyyy-MM-dd hh:mm:ss
			function getFormatDateWithHours(date) {
				var date = new Date(date);
			    var seperator1 = "-";
			    var seperator2 = ":";
			    var month = date.getMonth() + 1;
			    var strDate = date.getDate();
			    if (month >= 1 && month <= 9) {
			        month = "0" + month;
			    }
			    if (strDate >= 0 && strDate <= 9) {
			        strDate = "0" + strDate;
			    }
			    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
			            + " " + date.getHours() + seperator2 + date.getMinutes()
			            + seperator2 + date.getSeconds();
			    
			    return currentdate;
			}
		</script>
		
		
		<script type="text/javascript">
			function calcTime() {
				//1.计算出两个时间的差
				//var target = new Date(2018,9,1,10,30);
//				var now = new Date("2018/07/12 9:33");
				var now = new Date("2018-07-12 9:38:49");
				var target = new Date();
				//使用距离计算机元年的时间差(毫秒)
				//console.log(target.getTime()-now.getTime());
				console.log(target-now);
				var d = target-now;
				//把相差的时间转成秒
				d = Math.floor(d/1000);
				var days = d/(24*60*60);
				days = Math.floor(days);
				//使用之前的时间和天数取余的结果(不是一天),转成小时
				var hours = d%(24*60*60)/3600;
				hours = Math.floor(hours);
				//获取分钟，直接和小时取余
				var minutes = d%(60*60)/60;
				minutes = Math.floor(minutes);
				//获取秒钟，直接和60取余
				var seconds = d%60;
				console.debug(days);
				if (days == "0") {
					if (hours == "0") {
						if (minutes == "0") {
							console.log(seconds+'秒 之前');			
							return;
						}
						console.log(minutes+'分'+seconds+'秒 之前');			
						return;
					}
					console.log(hours+'时'+minutes+'分'+seconds+'秒 之前');			
					return;
				}
			}
			//setInterval("calcTime()",1000);
		</script>
		
		
		<script type="text/javascript">
			// 当前服务器时间
			currentTime();
			// 查询安全日志
			securityLog();
			// 查询安全设置历史
			securityOperationHistory();
		</script>
		
	</body>

</html>