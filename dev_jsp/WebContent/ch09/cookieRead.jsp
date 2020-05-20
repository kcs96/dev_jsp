<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키에서 읽기</title>
<script type="text/javascript">
	function cookDel(){
		location.href = "cookieDelete.jsp"
	}
</script>
</head>
<body>
<%
	Cookie[] cs = request.getCookies();
	if(cs != null && cs.length>0){
		for(int i=0;i<cs.length;i++){
			out.print(cs[i].getName()+", "+cs[i].getValue()+"<br>");
		}
	}

%>
<input type="button" value="쿠키삭제" onClick="cookDel()">

</body>
</html>