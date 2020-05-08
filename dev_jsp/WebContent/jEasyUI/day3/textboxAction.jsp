<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//<input id="tb_id" name="tb_id" width="100px" class="easyui-textbox" placeholder="아이디">
// textboxAction.jsp?tb_id=apple
	String tb_id = request.getParameter("umem_id");
	out.print("사용자가 입력한 아이디 ::"+tb_id);
%>