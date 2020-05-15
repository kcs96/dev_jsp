<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String htest1 = request.getParameter("htest1");
	String htest2 = request.getParameter("htest2");
	String htest3 = request.getParameter("htest3");
	String htest4 = request.getParameter("htest4");
	out.print(htest1+" ,"+htest2+" ,"+htest3+" ,"+htest4);
	int junsu = 0; 
%>
<%

	if(htest1.equals("1")){
		junsu+=25;
	}
	if(htest2.equals("1")){
		junsu+=25;
	}
	if(htest3.equals("2")){
		junsu+=25;
	}
	if(htest4.equals("3")){
		junsu+=25;
	}
%>

당신의 점수는 <%= junsu %>점입니다.
