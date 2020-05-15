<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	function key() {
		$.ajax({
				method: "get"
			   ,url: "getCaptchaNkey.jsp"
			   ,dataType: "text"
			   ,success:function(data){
				  $("#p_key").text(data);
			   }
		});
	}
	

</script>
<script type="text/javascript">
function img() {
	var key = $("#p_key").text();
	$("#d_img").html("<img src='https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key+"'/>");
}
</script>
</head>
<body>
<button onClick="javascript:key()">키 생성</button>
<p id="p_key"></p>
<button onClick="javascript:img()">이미지 생성</button>
<div id="d_img"></div>

</body>
</html>