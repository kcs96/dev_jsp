
<%@page import="ch08.Sonata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SonataTest</title>
<script type="text/javascript">
	function moveB() {
		<%
		Sonata myCar = new Sonata();
		request.setAttribute("myCar", myCar);
		RequestDispatcher view = request.getRequestDispatcher("b.jsp");
		view.forward(request, response);
		%>
	}
</script>  
</head>
<body>

<button onClick="moveB()">b로 이동</button>
</body>
</html> 