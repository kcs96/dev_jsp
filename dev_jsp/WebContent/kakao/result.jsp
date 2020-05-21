<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name =request.getParameter("name");    
	String email =request.getParameter("email");    
	out.print(name+"님 로그인 되었습니다."+"<br>");
	out.print("이메일 정보입니다."+email);
%>