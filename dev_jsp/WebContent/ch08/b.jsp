<%@page import="ch08.Sonata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
b.jsp 페이지 입니다.
<%
	Sonata myCar = (Sonata)request.getAttribute("myCar");
	out.print(myCar.carColor+", "+myCar.wheelNum);
%>
</body>
</html>