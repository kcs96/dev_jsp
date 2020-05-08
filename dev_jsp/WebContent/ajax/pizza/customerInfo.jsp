<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>    
<%@ page import="java.util.Map, java.util.HashMap" %>    
<%@ page import="com.google.gson.Gson" %>   
<%--
	//이름 : mem_name
	//주소 : mem_addr
	//전화번호 : mem_tel jsp주석이다. 소스보기에 안보임
	//주석은 자바주석은 소스보기에 보임 -json포맷이 아니다.
 --%> 
<%
	List<Map<String,Object>> cusList = new ArrayList<>();
	Map<String,Object> rMap = new HashMap<>();
	rMap.put("mem_name","이순신");
	rMap.put("mem_addr","서울시 마포구 공덕동");
	rMap.put("mem_tel","025559990");
	cusList.add(rMap);
	rMap = new HashMap<>();
	rMap.put("mem_name","김유신");
	rMap.put("mem_addr","서울시 영등포구 당산동");
	rMap.put("mem_tel","025559991");
	cusList.add(rMap);
	rMap = new HashMap<>();
	rMap.put("mem_name","강감찬");
	rMap.put("mem_addr","서울시 금천구 가산동");
	rMap.put("mem_tel","025559992");
	cusList.add(rMap);
	Gson g = new Gson();
	String result = g.toJson(cusList);
	out.print(result);
%>











