<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String menu = null;
	if(request.getParameter("menu")!=null){
		menu = request.getParameter("menu"); //intro or login or board
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인솔루션 개발</title>
</head>
<center>
<table width="1000px" height="600" >
<!-- top.jsp 시작 -->
   <tr>
      <td width="1000px" height="50" colspan="2">
  			 <%@ include file="top.jsp" %> 
      </td>
   </tr>
<!-- top.jsp 끝 -->
<!-- main.jsp 시작 -->
   <tr>
      <td valign="top">
      <table border="1" borderColor="blue">
      <tr>
         <td width="250px" height="450px"><%@ include file="menu.jsp" %> </td>
         <td width="750px" height="450px">
         
         <% if(menu ==null || "intro".equals(menu)) { %>
       	  <%@ include file="intro.jsp" %>
         <% } else if("login".equals(menu)) { %>
        	 <%@ include file="login.jsp" %>
         <% }else if("board".equals(menu)) { %>
        	 <%@ include file="board.jsp" %>
          <% } %>
         </td>
      </tr>
      </table>
      </td>
      
   
   </tr>
<!-- main.jsp 끝 -->
</table>
</center>
</body>
</html>