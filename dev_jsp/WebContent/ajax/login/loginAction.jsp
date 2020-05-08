<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String db_id = "test";
    String db_pw = "123";
    String db_name = null;
//스크립틀릿에서 선언한 변수는 모두 다 지역변수임.
	String u_id = request.getParameter("mem_id");
	String u_pw = request.getParameter("mem_pw");
	if(db_id.equals(u_id)){//아이디가 존재하니?
		if(db_pw.equals(u_pw)){//비번은?
			db_name = "이순신";					
		}else{
			db_name="비번이 틀렸습니다.";				
		}
	}
	else{//아이디가 없네
		db_name="아이디가 없습니다.";
	}	
	out.print(db_name);
%>
