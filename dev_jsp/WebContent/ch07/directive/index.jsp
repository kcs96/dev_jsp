<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1 width="1000px" height="500px">
	<tr>
		<th width="1000px" height="50px" colspan=2>
			<div><jsp:include page="top.jsp" flush="false"/> </div>
		</th>
	<tr>
		<td width="250" height="450"><div><jsp:include page="menu.jsp" flush="false"/></div></td>
		<td width="750" height="450"><div><jsp:include page="body.jsp" flush="false"/></div></td>
	</tr>
</table>
</body>
</html>