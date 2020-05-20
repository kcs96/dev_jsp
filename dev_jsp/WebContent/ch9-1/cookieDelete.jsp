<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키삭제</title>
</head>
<body>
<%
	Cookie notebook = new Cookie("notebook","");
	notebook.setMaxAge(0);
	response.addCookie(notebook);
%>
</body>
</html>