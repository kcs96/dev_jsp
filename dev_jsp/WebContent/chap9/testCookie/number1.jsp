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
	function next() {
		var result1 = "";
		   $(":checkbox[name='chk1']:checked").each(function(i,e){
		       if(result1 == ""){
		    	   result1 = e.value;
		         alert(result1);
		        }else{
		        	result1 += "^"+e.value;
		         alert(result1);
		        }
		   });
		   //값 취득 후 쿠키저장 & 페이지 이동
	}
</script>
</head>
<body>
문제1 
서블릿 메소드의 호출 순서로 맞는 것은?
<input id="chk" name="chk1" type="checkbox" value="1">① init() - service() - destroy() <br>
<input id="chk" name="chk1" type="checkbox" value="2">② service() - destroy() - init() <br>
<input id="chk" name="chk1" type="checkbox" value="3">③ destroy() - init() - service() <br>
<input id="chk" name="chk1" type="checkbox" value="4">④ doGet() - destroy() - init() - service() <br>
<button onClick="javascript:next()">다음단계</button>
</body>
</html>