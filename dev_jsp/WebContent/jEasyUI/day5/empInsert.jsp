<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//사용자가 입력한 값 읽어오기
	int empno = 0;
	String ename = "";
	String job = "";
	int mgr = 0;
	String hiredate = "";
	double sal = 0.0;
	double comm = 0.0;
	int deptno = 0;
	if(request.getParameter("empno")!=null){
		empno = Integer.parseInt(request.getParameter("empno"));
	}
	ename = request.getParameter("ename");
	job = request.getParameter("job");
	if(request.getParameter("mgr")!=null){//그룹코드임
		mgr = Integer.parseInt(request.getParameter("mgr"));
	}
	hiredate = request.getParameter("hiredate");
	if(request.getParameter("sal")!=null){
		sal = Double.parseDouble(request.getParameter("sal"));
	}
	if(request.getParameter("comm")!=null){
		sal = Double.parseDouble(request.getParameter("comm"));
	}
	if(request.getParameter("deptno")!=null){
		deptno = Integer.parseInt(request.getParameter("deptno"));
	}
	orm.dao.SqlMapEmpDao eDao = new orm.dao.SqlMapEmpDao();
	int result = 0;
	java.util.Map<String,Object> pMap = new java.util.HashMap<>();
	pMap.put("empno",empno);
	pMap.put("ename",ename);
	pMap.put("job",job);
	pMap.put("mgr",mgr);
	pMap.put("hiredate",hiredate);
	pMap.put("sal",sal);
	pMap.put("comm",comm);
	pMap.put("deptno",deptno);
	result = eDao.empINS(pMap);
	//out.print("result: "+result);
	//response.sendRedirect("EmpManagerVer6.jsp");//페이지 이동-
	if(result == 1){//등록 성공했을 때
		response.sendRedirect("EmpManagerVer8.jsp?mode=update");//페이지 열리전 db경유함.
	}
	//등록 실패 했을 때
	else{
		response.sendRedirect("empInsertFail.jsp");//페이지 열리전 db경유함.		
	}
%>


























