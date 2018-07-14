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
			<div class="L_36" style="height: 672px;">
				<div class="L_39" style="border-bottom: 2px solid #fafbfc;">
					邮箱绑定
				</div>
				<div class="L_86" style="border-bottom: 1px solid #fafbfc;">
					<span style="float: left;margin-right: 30px;">提币手机验证</span>
					<div class="slideOne" style="top: 30px;">
						<input type="checkbox" value="None" onclick="c()" id="slideOne" name="check" />
						<label for="slideOne"></label>
					</div>
					<span id="phoneText"></span>
				</div>
				<div class="L_85" id="L_86_1" style="display: none;">
					<p>您尚未绑定手机，<span>绑定手机</span></p><br />
					<input type="button" value="立即绑定" onclick="$('#L_86_1').css('display','none');$('#L_86_2').css('display','block');" />
				</div>
				<div class="L_85" style="display: none;" id="L_86_2">
					<p>已绑定手机：<span id="phoneNumber"></span></p>
				</div>
				
				
				<script type="text/javascript">
					var isBindPhone = '${isBindPhone}';
					
					var phoneCode = '${phoneCode}';
					
					// 绑定了手机
					if (isBindPhone == "false") {
						$("#phoneText").text("开启");
						$("#slideOne").attr("checked","checked");
						$("#L_86_2").css("display", "block");
						$("#phoneNumber").text("****" + phoneCode.substring(phoneCode.length-4));
					}else { // 没绑定手机
						$("#phoneText").text("关闭");
						$("#slideOne").attr("checked",false);
					}
				</script>
				
				
				<script>
					function c() {
						var isBindPhone = '${isBindPhone}';
						var phoneCode = '${phoneCode}';
						// 绑定了手机
						if (isBindPhone == "false") {
							if($("#slideOne").is(':checked')) {
								$("#phoneText").text("开启");
								$("#L_86_2").css("display", "block");
								$("#phoneNumber").text("****" + phoneCode.substring(phoneCode.length-4));
							}else {
								$("#phoneText").text("关闭");
								$('#L_86_1').css('display', 'none');
								$('#L_86_2').css('display', 'none');
							}
						}else { // 没绑定手机
							if($("#slideOne").is(':checked')) {
								$("#phoneText").text("开启");
								$('#L_86_1').css('display', 'block');
								$("#phoneNumber").text("****" + phoneCode.substring(phoneCode.length-4));
							}else {
								$("#phoneText").text("关闭");
								$('#L_86_1').css('display', 'none');
								$('#L_86_2').css('display', 'none');
							}
						}
					}
				</script>
				
				
				
				<div class="L_86">
					<span style="float: left;margin-right: 30px;">提币邮箱验证</span>
					<div class="slideOne" style="top: 30px;">
						<input type="checkbox" value="None" onclick="cc()" id="slideOne2" name="check"/>
						<label for="slideOne2"></label>
					</div>
					<span>开启</span>
				</div>
				<div class="L_85" id="L_86_3" style="display: none;">
					<p>您尚未绑定邮箱，<span>绑定邮箱</span></p><br />
					<input type="button" value="立即绑定" onclick="$('#L_86_3').css('display','none');$('#L_86_4').css('display','block');" />
				</div>
				<div class="L_85" style="display: none;" id="L_86_4">
					<p>已绑定邮箱：<span>2484***@qq.com</span></p>
				</div>
				<script>
					function cc(){
						if ($("#slideOne2").is(':checked')) {
							$('#L_86_3').css('display','block');
						} else{
							$('#L_86_3').css('display','none');
							$('#L_86_4').css('display','none');
						}
					}
				</script>
			</div>
		<script type="text/javascript" src="js/style.js"></script>
	</body>

</html>