<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="orm.dao.SqlMapEmpDao" %>    
<%@ page import="java.util.*" %>     
<%
	SqlMapEmpDao edao = new SqlMapEmpDao();
	List<Map<String,Object>> elist = edao.empList(null);
%>
<table border="1" borderColor="red">
<%
//조회 결과가 없을 때
	if(elist==null){
%>
	<tr>
		<td>조회결과가 없습니다.</td>
	</tr>
<%
	}else{
//조회 결과가 있을 때		
		for(int i=0;i<elist.size();i++){
			Map<String,Object> rmap = elist.get(i);
%>	
	<tr>
		<td><% out.print(rmap.get("ENAME")); %></td>
	</tr>
<%
		}////////end of for
	}////////////end of else 
%>	
</table>






