<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp[a.jsp에 포함될 내용 포함]</title>
</head>
<body>
첫쨰<br>
둘째<br>
<%
	request.setAttribute("mem_name","이순신");
%>
셋째<br>
</body>
</html>