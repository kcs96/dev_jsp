<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500에러 발생</title>
</head>
<body>
에러메시지 : <%=exception.getMessage() %> <br>
에러메시지 : <%=exception.toString() %> <br>

</body>
</html>