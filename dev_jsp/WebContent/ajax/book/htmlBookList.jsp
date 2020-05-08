<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="orm.dao.SqlMapBookDao" %>    
<%@ page import="java.util.Map, java.util.HashMap, java.util.List" %>    
<%
	String book_title = request.getParameter("book_title");
	String choMode = request.getParameter("choMode");
	//out.print(book_title+", "+choMode);
	SqlMapBookDao bDao = new SqlMapBookDao();
	Map<String,Object> pmap = new HashMap<>();
	pmap.put("book_title",book_title);
	pmap.put("choMode",choMode);
	List<Map<String,Object>> bList = null;
	bList = bDao.bookList(pmap);
	//out.print(bList);
%>
<table border="1" borderColor="red">
<%
//조회 결과가 없을 때
	if(bList==null){
%>
	<tr>
		<td>조회결과가 없습니다.</td>
	</tr>
<%
	}else{
//조회 결과가 있을 때		
		for(int i=0;i<bList.size();i++){
			Map<String,Object> rmap = bList.get(i);
%>	
	<tr>
		<td id="<%=rmap.get("BOOK_NO") %>"><% out.print(rmap.get("BOOK_TITLE")); %></td>
	</tr>
<%
		}////////end of for
	}////////////end of else 
%>	
</table>