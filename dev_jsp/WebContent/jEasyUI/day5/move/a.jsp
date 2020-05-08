<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp-[시작페이지]</title>
<!-- 현재 내가 바라보는 곳 jEasyUI/day5/move
     js/여기로 이동
 -->
<script type="text/javascript" src="../../../js/commons.js"></script>
<script type="text/javascript">
	function move(){
		cmm_window_popup('./b.jsp','500','350','b');		
	}
</script>
</head>
<body>
내용
<button onClick="move()">b페이지</button>
</body>
</html>