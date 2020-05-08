<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="orm.dao.SqlMapCommonDao" %>    
<%@ page import="java.util.*" %>    
<%@ page import="com.google.gson.*" %>    
<%
	String dong = request.getParameter("dong");
	SqlMapCommonDao cdao = new SqlMapCommonDao();
	Map<String,Object> pmap = new HashMap<>();
	pmap.put("dong",dong);
	List<Map<String,Object>> zlist = cdao.zipcodeList(pmap);
	Gson g = new Gson();
	String imsi = g.toJson(zlist);
	out.print(imsi);
%>