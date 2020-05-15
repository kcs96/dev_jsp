<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제1</title>
<%@ include file="../common/jEasyUICommon.jsp"%>
</head>
<body>
<form method="get" action="test1.jsp">
	수험번호 :<input type="hidden" name="h_id" value="20200515001"><br>
	수험자명 :<input type="hidden" name="h_name" value="이순신"><br>
<input type="submit" value="시험시작">
</form>
</body>
</html>