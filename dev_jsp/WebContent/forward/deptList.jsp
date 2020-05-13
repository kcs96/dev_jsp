<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="../deptList.do">
	부서번호<input type="text" name="deptno"> 
	<input type="submit" value="전송"/>
</form>
<br>

<div id="d_table">
<%
	if(request.getAttribute("pMap")!=null){
	Map<String,Object> rMap =(Map<String,Object>)request.getAttribute("pMap");
	out.print(rMap.get("DNAME"));
	}

%>
</div>
</body>
</html>