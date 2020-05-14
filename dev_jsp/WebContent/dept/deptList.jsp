<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 목록</title>
<%@include file="../common/jEasyUICommon.jsp" %>

</head>
<body>
<form method="get" action="deptList.do">
부서번호 : <input type="text" name="deptno"> 
<input type="submit" value="전송"> 
</form>
<table id="dg_dept" class="easyui-datagrid"></table>

<script type="text/javascript">
	$("#dg_dept").datagrid({
		url:'./deptList.km',
		title:'부서관리',
		width: 480,
	    columns:[[
	        {field:'DEPTNO',title:'부서번호',width:120, align:'center'}
	       ,{field:'DNAME',title:'부서명',width:150, align:'center'}
	       ,{field:'LOC',title:'지역',width:200, align:'center'}
	    ]]		
	}); 
</script>
</body>
</html>
