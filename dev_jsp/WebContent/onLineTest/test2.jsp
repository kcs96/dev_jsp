<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   //이전문제로 이동하기
   function prev(){
	   //이렇게 이동하기는 redirect의 특징(유지가안됨,주소가 바뀜,get방식)
	   location.href="test1.jsp";
   }
   //다음문제로 넘길 때
   function next(){
      //수험자가 입력한 답안 저장하기
      var temp = 1;
      for(var i=0;i<document.getElementById("f_test1").cb.length;i++){
         if(document.getElementById("f_test1").cb[i].checked==1){
            document.getElementById("f_test1").htest2.value = temp;
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
<form id="f_test1" method="get" action="test3.jsp">
<input type="hidden" name="htest1" value="<%=request.getParameter("htest1")%>">
<input type="hidden" name="htest2">
문제2
조회한 결과를 DB서버에서 가져온 후 결과를 List에 담았다.<br>
이것을 화면단에 출력하고자 할 때 사용할 메소드 이름은 무엇인지 고르시오.<br>
<input id="chk" name="cb" type="checkbox" onChange="test(1)">
① forward(request, response)<br>
<input id="chk" name="cb" type="checkbox" onChange="test(2)">
② sendRedirect("페이지 이름")<br>
<input id="chk" name="cb" type="checkbox" onChange="test(3)">
③ toString()<br>
<input id="chk" name="cb" type="checkbox" onChange="test(4)">
④ print()<br>
</form>
<br>
<button onClick="prev()">이전문제</button>
<button onClick="next()">다음문제</button>
</body>
</html>