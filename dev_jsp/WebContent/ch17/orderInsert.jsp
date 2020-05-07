<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/ch17/orderInsert.do">
 <input type="text" name="mem_name">
 <input type="submit" value="전송"> 
 <input type="submit" value="전송2" onclick="send();">
</form>
</body>
</html>