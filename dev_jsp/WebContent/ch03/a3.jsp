<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page trimDirectiveWhitespace="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a3.jsp</title>
</head>
<body>
<%
	response.setContentType("text/xml;charset=UTF-8");
	String id=request.getParameter("mem_id");
	out.print("<?xml version='1.0' encoding='utf-8'?>");
	out.print("<records>");
	out.print("<record>");
	out.print("테스트");
	out.print("</record>");
	out.print("<record>");
	out.print("JAVA");
	out.print("</record>");
	out.print("<record>");
	out.print("JSP");
	out.print("</record>");
	out.print("</records>");
%>
</body>
</html>