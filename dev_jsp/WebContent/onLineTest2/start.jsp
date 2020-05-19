<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();//쿠키값을 얻어올땐 배열로 받아야한다.
	String h_no=null;
	if(cookies!=null &&cookies.length >0){
		for(int i=0;i<cookies.length;i++){
			if("c_hno".equals(cookies[i].getName())){
				h_no=cookies[i].getValue();
			}
		}
	}
	out.print("h_no :"+h_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인테스트(쿠키활용처리)</title>
<%@ include file="../common/jEasyUICommon.jsp"%>
</head>
<body>
<form method="get" action="test1.jsp">
	수험번호 :<input type="hidden" name="h_no" value="20200515001"><br>
	수험자명 :<input type="hidden" name="h_name" value="이순신"><br>
<input type="submit" value="시험시작">
</form>
</body>
</html>