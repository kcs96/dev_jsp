<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function pass(jumsu){
		if(jumsu>=60){
			//합격페이지로
			location.href="testOK.jsp"
		}
		else{
			//불합격페이지로
			location.href="testNO.jsp"
		}
	}
</script>
<%
	Cookie[] cookies = request.getCookies();//쿠키값을 얻어올땐 배열로 받아야한다.
	String h_no=null;
	String[] users = new String[4];
	
	if(cookies!=null &&cookies.length >0){
		for(int i=0;i<cookies.length;i++){
			if("c_hno".equals(cookies[i].getName())){
				h_no=cookies[i].getValue();
			}else if("c_test1".equals(cookies[i].getName())){
				users[0] = cookies[i].getValue();
			}else if("c_test2".equals(cookies[i].getName())){
				users[1] = cookies[i].getValue();
			}else if("c_test3".equals(cookies[i].getName())){
				users[2] = cookies[i].getValue();
			}else if("c_test4".equals(cookies[i].getName())){
				users[3] = cookies[i].getValue();
			}
			
		}
	}
	out.print("h_no :"+h_no);
	out.print("<br>");
	String daps[] = {"1","1","2","3"};
	int count =0;  //맞춘 개수 함수
	int jumsu = 0;
		for(int i =0;i<users.length;i++){
			for(int j=0; j<daps.length;j++){
				if(daps[i].equals(users[j])){
					if(i==j){
						count++;
						jumsu+=25;
					}
				}
			}
		}
		out.print("맞춘 문제 수 :"+count+"<br>");
		out.print("내 점수는 :"+jumsu+"<br>");
		String result=null;
%>
<button onClick="pass(<%=jumsu %>)">합|불 판정하기</button>
