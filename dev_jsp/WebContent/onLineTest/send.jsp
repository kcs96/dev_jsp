<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String htest1 = request.getParameter("htest1");
	String htest2 = request.getParameter("htest2");
	String htest3 = request.getParameter("htest3");
	String htest4 = request.getParameter("htest4");
	out.print(htest1+" ,"+htest2+" ,"+htest3+" ,"+htest4);
	
%>
<form method="get" action="account.jsp">
<input type="hidden" name="htest1" value="<%=request.getParameter("htest1")%>">
<input type="hidden" name="htest2" value="<%=request.getParameter("htest2")%>">
<input type="hidden" name="htest3" value="<%=request.getParameter("htest3")%>">
<input type="hidden" name="htest4" value="<%=request.getParameter("htest4")%>">
<input type="submit" value="채점하기">
</form>