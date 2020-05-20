<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie c1 = new Cookie("notebook","gram2019");
	response.addCookie(c1); //ch09 - 읽을 수 있음. 디폴트 현재위치

	Cookie c2 = new Cookie("phone","cookiePhone");
	c2.setMaxAge(60);
	c2.setPath("/ch09");//읽을 수 있음,불가
	response.addCookie(c2);
	
	Cookie c3 = new Cookie("coffee","mixCoffee");
	c3.setMaxAge(75);
	c3.setPath("/");//읽기가능,가능
	response.addCookie(c3);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>