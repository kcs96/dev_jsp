<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> deptList = (List<Map<String,Object>>)request.getAttribute("rlist");
	Gson g = new Gson();
	String imsi = g.toJson(deptList);
	out.print(imsi);//json포맷
%>
