<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리</title>
</head>
<body>
주문관리 페이지 입니다.
<%
	List<Map<String,Object>> olist = (List<Map<String,Object>>)request.getAttribute("olist");
	out.print(olist);
	for(int i=0; i<olist.size();i++){
		Map<String,Object> rmap = olist.get(i);
		Object keys[] = rmap.keySet().toArray();
		out.print(rmap.get(keys[0])+", "
				 +rmap.get(keys[1])+", "
				 +rmap.get(keys[2]));
	}
%>
</body>
</html>