<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mode = request.getParameter("mode");
	out.print(mode);//update, null
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a2.jsp-[시작페이지]</title>
<!-- 현재 내가 바라보는 곳 jEasyUI/day5/move
     js/여기로 이동
 -->
<script type="text/javascript" src="../../../js/commons.js"></script>
<script type="text/javascript">
	function move(){
		location.href="./b2.jsp";		
	}
</script>
</head>
<body>
내용
<button onClick="move()">b2페이지</button>
<br>
다시 돌아온 화면에서 mode값 확인하기 <%=mode %>
</body>
</html>