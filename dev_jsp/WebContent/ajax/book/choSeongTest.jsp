<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choSeongTest.jsp</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
</head>
<body>
<!-- 
가 - 44032
나 - 45208
 -->
<div id="d_msg"></div> 
<script type="text/javascript">
	function choSeongAccount(str){
		var cho = [
			         "ㄱ","ㄲ","ㄴ","ㄷ","ㄸ"
			        ,"ㄹ","ㅁ","ㅂ","ㅃ","ㅅ"
			        ,"ㅆ","ㅇ","ㅈ","ㅉ","ㅊ"
			        ,"ㅋ","ㅌ","ㅍ","ㅎ"
			      ];
		var code;
		var result='';//ㅈㅂ을 반환하는 변수
		//alert(str.charCodeAt());
		for(i=0;i<str.length;i++){
			code = str.charCodeAt(i)-44032;
			//$("#d_msg").append(code+" ");
			if(code > -1 && code < 11172) result += cho[Math.floor(code/588)];
		}
		return result;
	}
	var a = choSeongAccount("ㅈ");
	alert("a:"+a+"&&&");
</script>
</body>
</html>


