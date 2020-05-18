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
	function keyOne() {
		$.ajax({
				method: "get"
			   ,url: "getCaptchaNkey.jsp"
			   ,dataType: "text"
			   ,success:function(data){
				  $("#p_key").text(data);
			   }
		});
	}
	function imgOne() {
		var key = $("#p_key").text();
		$("#d_img").html("<img src='https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key+"'/>");
	}
	
	function result() {
		var key = $("#p_key").text().trim();
		var input = $("#result").val().trim();
		var param = "key="+key+"&input="+input;
		
		$.ajax({
			method: "get"
			,url : "getCaptchaResult.jsp"
			,data : param
			,success:function(data){
				if(data.trim()=="일치!!"){
					$("#d_result").html("<p id='p_result'>"+data+"</p>");
				}
				else if(data.trim()=="불일치!!"||data.trim()=="오류발생"){
					//keyOne();  
					//key() 함수의 내용
					   $.ajax({
						method: "get"
					   ,url: "getCaptchaNkey.jsp"
					   ,dataType: "text"
					   ,success:function(data){
						  $("#p_key").text(data);
						  //img() 함수의 내용
						  var key = $("#p_key").text();
						  $("#d_img").html("<img src='https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key+"'/>");
					   }
					});   
					//결과 내용 출력
					$("#d_result").html("<p id='p_result'>"+data+"</p>");
				}///end of else if
			}
		});
	}
</script>
</head>
<body>
<button onClick="javascript:keyOne()">키 생성</button>
<p id="p_key"></p>
<button onClick="javascript:imgOne()">이미지 생성</button>
<br><br>
<div id="d_img"></div>
<br>
<input type="text" id="result" name="result" placeholder="인증코드입력"/>

<button onClick="javascript:result()">판정</button>
<br><br>
<h2>결과 : </h2> 
<div id="d_result"></div>
</body>
</html>