<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String empnoArr = request.getParameter("empno");//7899,9011,9013
	String empnos[] = null;
	if(empnoArr!=null) {
		empnos = empnoArr.split(",");
	}
	int result = 0;
	orm.dao.SqlMapEmpDao eDao = new orm.dao.SqlMapEmpDao();
	result = eDao.empDEL(empnos);
	out.print("result: "+result);
	//response.sendRedirect("EmpManagerVer6.jsp");//페이지 이동-
	if(result >0){//등록 성공했을 때
		response.sendRedirect("EmpManagerVer8.jsp?mode=update");//페이지 열리전 db경유함.
	}
	//등록 실패 했을 때
	else{
		response.sendRedirect("empDeleteFail.jsp");//페이지 열리전 db경유함.		
	}
%>


























