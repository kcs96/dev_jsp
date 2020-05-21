<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션에 있는 값 읽어오기
	String s_name = (String)session.getAttribute("s_name");
	out.print(s_name);
%>