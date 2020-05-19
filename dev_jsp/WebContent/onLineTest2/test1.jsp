<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //쿠키를 쓴다면 여기에 사용한다.
    String h_no = request.getParameter("h_no");
    Cookie c_hno = new Cookie("c_hno", h_no);
    c_hno.setMaxAge(60*60);
	response.addCookie(c_hno);
	
    String h_name = request.getParameter("h_name");
    Cookie c_hname = new Cookie("c_hname", h_name);
    c_hname.setMaxAge(60*60);
	response.addCookie(c_hname);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제1</title>
<%@ include file="../common/jEasyUICommon.jsp"%>
<script type="text/javascript">
   //수험자가 선택한 답안을 
   function test(dap){
      //alert("당신이 선택한 답안은"+dap+" 입니다.");
         for(var i=0;i<document.f_test.cb.length;i++){
            if(dap == i) {
               document.getElementById("f_test1").cb[i].checked = 1;
            }else {
               document.getElementById("f_test1").cb[i].checked = 0;
            }
         }
   }   
   //다음문제로 넘길 때
   function next(){
      //수험자가 입력한 답안 저장하기
      var temp = 1;
      for(var i=0;i<document.getElementById("f_test1").cb.length;i++){
         if(document.getElementById("f_test1").cb[i].checked==1){
            document.getElementById("f_test1").htest1.value = temp;
         }
         else{
            temp = temp + 1;
         }
      }
       document.getElementById("f_test1").submit();
   }
</script>
</head>
<body>
<!--document -- 아들이 html임 form태크로 묶어놈 그리고 checkbox로 해놨음 
checkbox는 체크할수도있고 안할수도있다. true,false로 제어해야되고 이안에 체크된애들이  form태그로 넘어가는거다.
  다음문제에서 푸는사람의 답을 가져온다. 수험자 몰래 숨겨서 id로 접근하자  
  -->
<form id="f_test1" method="get" action="test2.jsp">
<input type="hidden" name="htest1">
문제1
서블릿 메소드의 호출 순서로 맞는 것은? <br>
<input id="chk" name="cb" type="checkbox" onChange="test(0)">
① init() - service() - destroy() <br>
<input id="chk" name="cb" type="checkbox" onChange="test(1)">
② service() - destroy() - init() <br>
<input id="chk" name="cb" type="checkbox" onChange="test(2)">
③ destroy() - init() - service() <br>
<input id="chk" name="cb" type="checkbox" onChange="test(3)">
④ doGet() - destroy() - init() - service()
</form>
<br>
<button onClick="next()">다음문제</button>
</body>
</html>