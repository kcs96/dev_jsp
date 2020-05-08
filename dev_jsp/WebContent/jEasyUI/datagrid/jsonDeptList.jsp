<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	com.dept.DeptDao ddao = new com.dept.DeptDao();
	java.util.List<java.util.Map<String,Object>> dlist = null;
	dlist = ddao.deptList();
	com.google.gson.Gson g = new com.google.gson.Gson();
	String imsi = g.toJson(dlist);
	out.print(imsi);
%>