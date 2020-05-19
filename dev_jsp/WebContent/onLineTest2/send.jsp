<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String htest4 = request.getParameter("htest4");
	Cookie c_htest4 = new Cookie("c_test4", htest4);
	c_htest4.setMaxAge(60*60);
	response.addCookie(c_htest4);
	
	
%>
<form method="get" action="account.jsp">
<input type="submit" value="채점하기">
</form>