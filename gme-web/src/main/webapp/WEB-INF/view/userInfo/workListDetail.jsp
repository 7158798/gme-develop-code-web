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
		<div class="L_98">
			工单详情
		</div>
		<div class="L_99">
			<p>
				<span>工单ID：</span>
				<span id="workId"></span>
				<span>创建时间：</span>
				<span id="createTime"></span>
				<span>状态：</span>
				<span id="status"></span>
			</p>
			<div id="boss" class="L_100">
				<!-- <div class="L_100_1">
					<img src="img/L_59.png" />
					<img src="img/L_61.png" />
					<div class="L_10086">
						<p>2018-08-08 18:18:18</p>
						<p>在网站上方点击“我的财务”找到要提币的币种，点击“提现”，直接进入提现页面，根据页面提示信息进行如实填写，填写完成后点击“提交提现申请”，完成提现操作。</p>
						<img src="img/L_39.png" />
						<img src="img/L_39.png" />
						<img src="img/L_39.png" />
					</div>
					<span>李天一他</span>
				</div>
				<div class="L_100_2">
					<img src="img/L_60.png" />
					<img src="img/L_61.png" />
					<div class="L_10087">
						<p>2018-08-08 18:18:18</p>
						<p>在网站上方点击“我的财务”找到要提币的币种，点击“提现”，直接进入提现页面，根据页面提示信息进行如实填写，填写完成后点击“提交提现申请”，完成提现操作。</p>
					</div>
					<span>客服妹妹</span>
				</div> -->
			</div>
			<div class="L_101">
				<textarea id="content" class="L_101_1" placeholder="请具体并准确描述您的问题，这有助于我们更高效得帮助您！" autocomplete="off"></textarea>
				<a class="L_88_3" style="width: 84px;height: 90px;margin-left: 20px;"><input type="file"></a>
				<a class="L_88_3" style="width: 84px;height: 90px;margin-left: 20px;"><input type="file"><img src="img/L_62.png" style="z-index: 9999;position: absolute;top: 0px;right: 0px;" onclick="alert(1)" /></a>
				<a class="L_88_3" style="width: 84px;height: 90px;margin-left: 20px;"><input type="file"></a>
				<input onclick="submitReply();" class="L_101_2" type="button" value="提交" />
			</div>
		</div>
		<script type="text/javascript" src="js/style.js"></script>
		<script type="text/javascript" src="js/utils.js"></script>
		
		
		
		<script type="text/javascript">
			// 用户提交工单回复
			function submitReply(){
				var workId = $("#workId").text();
				var content = $("#content").val();
				$.ajax({
					type: "POST",
					url: "http://192.168.0.148:8080/gme-web/api/v1/operation/replyWorkList.json",
					dataType: "json",
					data: "subjectId=" + workId + "&content=" + content + "&replyImgId=111" + "&type=1",
					success: function(data){
						if (data.code == 200) {
							window.location.href=window.location.href;
						}else {
							alert(data.message);
						}
					}
				})
			}		
		</script>
		
		
		
		
		<script type="text/javascript">
			// 我的工单详情
			function myWorkListDetail(){
				var subjectId = '${subjectId}';
				
				$.ajax({
					type: "GET",
					url: "http://192.168.0.148:8080/gme-web/api/v1/operation/listWorkOrderReply.json",
					dataType: "json",
					data: "subjectId=" + subjectId,
					success: function(data){
						if (data.code == 200) {
							var dataChar = data.data;
							var workId = dataChar.workId;
							var createTime = getFormatDateWithHours(dataChar.dateTime);
							var status = dataChar.status;
							$("#workId").text(workId);
							$("#createTime").text(createTime);
							if (status == 1) {
								status = "未处理";
							}
							if (status == 2) {
								status = "处理中";
							}
							if (status == 3) {
								status = "已处理";
							}
							$("#status").text(status);
							
							for (var i = 0; i < dataChar.length; i++) {
								var data = dataChar[i];
								var time = getFormatDateWithHours(data.time);
								// 是用户
								if (data.type == 1) {
										$("#boss").append('<div class="L_100_1"><img src="img/L_59.png" /><img src="img/L_61.png" /><div id="a'+i+'" class="L_10086"><p>'+time+'</p><p>'+data.content+'</p></div></div><span>'+data.fromWho+'</span></div></div>');
										//$("#boss").append('<div class="L_100_1"><img src="img/L_59.png" /><img src="img/L_61.png" /><div class="L_10086"><p>'+time+'</p><p>'+data.content+'</p><img src="'+data.imgs[j]+'" /></div></div><span>'+data.fromWho+'</span></div></div>');
									if (data.imgs.length > 0) {
										for (var j = 0; j < data.imgs.length; j++) {
											$("#a"+i+"").append('<img src="'+data.imgs[j]+'" />');
										}
									}
								}
								// 是客服
								if (data.type == 2) {
									$("#boss").append('<div class="L_100_2"><img src="img/L_60.png" /><img src="img/L_61.png" /><div id="b'+i+'" class="L_10087"><p>'+time+'</p><p>'+data.content+'</p></div></div><span>客服妹妹</span></div></div>');
									//$("#boss").append('<div class="L_100_2"><img src="img/L_60.png" /><img src="img/L_61.png" /><div class="L_10087"><p>'+time+'</p><p>'+data.content+'</p><img src="'+data.imgs[j]+'" /></div></div><span>'+data.fromWho+'</span></div></div>');
									if (data.imgs.length < 1) {
										for (var j = 0; j < data.imgs.length; j++) {
											$("#b"+i+"").append('<img src="'+data.imgs[j]+'" />');
										}
									}
								}
							}
							
							
						}
					}
					
				})
			}
			
		</script>		
	
	
		<script type="text/javascript">
			myWorkListDetail();
		</script>

	</body>

</html>