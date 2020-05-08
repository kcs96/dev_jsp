<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//여기는 톰캣 서버 내부에서 처리되는 코드이고
//처리된 결과만이 클라이언트측으로 다운로드됨
	if(1==1) out.print("나야");
%>
<script>
/* 처리 주체가 사용자의 컴터*/
	opener.location.href="javascript:fun();";
	self.close();
</script>