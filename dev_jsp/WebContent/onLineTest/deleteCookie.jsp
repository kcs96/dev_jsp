<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();//쿠키값을 얻어올땐 배열로 받아야한다.
	if(cookies!=null &&cookies.length >0){
		for(int i=0;i<cookies.length;i++){
			if("c_hno".equals(cookies[i].getName())){
				Cookie c_hno = new Cookie("c_hno","");
				c_hno.setMaxAge(0);
				response.addCookie(c_hno);
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
</head>
<body>
수험번호에 해당하는 쿠키값 삭제하기

</body>
</html>