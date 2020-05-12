<%@ page import="java.util.*"%>
<%@ page import="com.google.gson.* " %>
<%@ page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 반드시 jsp주석으로 처리할 것.  --%>

<%
//주석은 사용불가함. - 소스보기했을 때 주석이 보이므로 json포멧에 맞지 않음.
   String empno = request.getParameter("empno");
   int iempno = 0;
   
   Map<String, Object> pmap = new HashMap<>();
   if(request.getParameter("empno") != null) {
      iempno = Integer.parseInt(empno);
      pmap.put("empno", iempno);
   }
   SqlMapEmpDao edao = new SqlMapEmpDao();
   List<Map<String, Object>> elist = edao.empList(pmap);
   Gson g = new Gson();
   String imsi = g.toJson(elist);
   out.print(imsi);
%>