<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jeasyui.member.MemberDAO, java.util.List, java.util.Map" %>   
<%@ page import="com.google.gson.Gson" %>   
    <%-- html땅==> jsp주석으로 반드시 처리할 것. --%>
<%
	//스크립틀릿 - 자바땅
	MemberDAO mdao = new MemberDAO();
	List<Map<String,Object>> mList = null;
	mList = mdao.procMemberList();
	Gson g = new Gson();
	String imsi = g.toJson(mList);
	out.print(imsi);
%>    
