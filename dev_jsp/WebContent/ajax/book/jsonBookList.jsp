<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="orm.dao.SqlMapBookDao" %>    
<%@ page import="java.util.*" %>    
<%@ page import="com.google.gson.*" %>    
<%
//사용자로 부터 입력받은 문자열(a, aj, aja, ajax.....) - 초성검색 하기와 초성검색 대상이 아닌 경우
	String book_title = request.getParameter("book_title");
	SqlMapBookDao bdao = new SqlMapBookDao();
	Map<String,Object> pmap = new HashMap<>();
	pmap.put("book_title",book_title);
	List<Map<String,Object>> elist = bdao.bookList(pmap);
	Gson g = new Gson();
	String imsi = g.toJson(elist);
	out.print(imsi);
%>