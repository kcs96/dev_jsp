<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try {
		InitialContext ctx = new InitialContext();
	    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbPool");
	    out.println(ds);
		String sql="select dname from dept;";
		Connection con = ds.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = null;
		rs = pstmt.executeQuery();
		while(rs.next()){
			out.print(rs.getString("dname"));
		} 
	} catch (Exception e) {
		out.print("e ===>");
	}
%>
</body>
</html>