<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.util.DBConnetionMgr"%>

<%
	int res_num = 0;
	if(request.getParameter("res_num")!=null){
		res_num = Integer.parseInt(request.getParameter("res_num"));
	}
	Connection con = null;
	PreparedStatement pstmt = null;
	DBConnetionMgr dbMgr = DBConnetionMgr.getInstance();
	StringBuilder sql = new StringBuilder();
	int result=0; //0이면 수정 실패 1이면 수정 성공
	try{
		con = dbMgr.getConnection();
		sql.append("Update resturant SET res_like=res_like+1 WHERE res_num=?");
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, res_num);
		result = pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		pstmt.close();
		con.close();
	}
	out.print(result);
%>