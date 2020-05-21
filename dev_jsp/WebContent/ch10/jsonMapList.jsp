<%@page import="com.map.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.google.gson.Gson" %>  
    <%--스크립틀릿 : 자바코드를 쓸수있다. --%>
<%
	RestaurantDao rDao = new RestaurantDao();
	List<Map<String,Object>> mrList = rDao.mapRestList();
	Gson g = new Gson();
	String imsi = g.toJson(mrList);
	//out.print(mrList);  포멧형식이 json이아니라 못뺸다.
	out.print(imsi);
%>