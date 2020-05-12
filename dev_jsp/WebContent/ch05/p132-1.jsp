<%@page import="jsp.ch05.Sonata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객체의 영역(SCOPE에 관해서-p132-1.jsp)</title>
</head>
<body>
<jsp:useBean id="himCar" scope="request" class="jsp.ch05.Sonata"/>
<%
	String imsi =(String)request.getAttribute("carColor");
	out.print("carColor:"+imsi);
	out.print("carWheel"+request.getAttribute("wheelNum"));
%>
</body>
</html>