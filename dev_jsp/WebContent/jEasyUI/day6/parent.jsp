<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>    
<%@ page import="java.util.Map, java.util.HashMap" %>    
<%
	List<Map<String,Object>> mList = new ArrayList<>();
	Map<String,Object> rmap = new HashMap<>();
	rmap.put("name","이성계");
	mList.add(rmap);
	rmap = new HashMap<>();
	rmap.put("name","유재석");
	mList.add(rmap);	
	rmap = new HashMap<>();
	rmap.put("name","강호동");
	mList.add(rmap);	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../day5/JEasyUICommon.jsp" %>
<script type="text/javascript" src="../../js/commons.js"></script>
<script type="text/javascript">
	function test(p_url, p_width, p_height, p_name){
		cmm_window_popup(p_url,p_width,p_height,p_name);
	}
	function fun(){
		//alert("fun 호출 성공");
		$("#dg").datagrid({
			url:"../day5/jsonEmpList.jsp"
		   ,onLoadSuccess:function(data){
			   alert("emp목록 로딩 성공");
		   }
		});
		
	}
</script>
</head>
<body>
<table id="dg" class="easyui-datagrid" title="데이터출력방법 종류" style="width:600px">
	<thead>
		<tr><th data-options="field:'ENAME',width:150">이름</th></tr>
	</thead>
	<tbody>
<%
	for(int i=0;i<mList.size();i++){
		Map<String,Object> rmap2 = mList.get(i);
%>		
		<tr><td width="150"><% out.print(rmap2.get("name")); %></td></tr>	
<%
	}
%>			
	</tbody>
</table>
<table border="1" title="데이터출력방법 종류" style="width:600px">
	<thead>
		<tr><th>이름</th><th>주소</th></tr>
	</thead>
	<tbody>
<%
	for(int i=0;i<mList.size();i++){
		Map<String,Object> rmap2 = mList.get(i);
%>	
		<tr>
		<td width="150"><% out.print(rmap2.get("name")); %></td>
		<td>주소</td>
		</tr>	
<%
	}
%>		
	</tbody>
</table>
<button onclick="test('child2.jsp','700','450','child')">등록</button>
</body>
</html>