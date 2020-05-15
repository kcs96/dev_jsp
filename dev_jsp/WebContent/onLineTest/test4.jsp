<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제4</title>
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
	   location.href="test3.jsp";
   }
   //다음문제로 넘길 때
   function next(){
      //수험자가 입력한 답안 저장하기
      var temp = 1;
      for(var i=0;i<document.getElementById("f_test1").cb.length;i++){
         if(document.getElementById("f_test1").cb[i].checked==1){
            document.getElementById("f_test1").htest4.value = temp;
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
<form id="f_test1" method="get" action="send.jsp">
<input type="hidden" name="htest1" value="<%=request.getParameter("htest1")%>">
<input type="hidden" name="htest2" value="<%=request.getParameter("htest2")%>">
<input type="hidden" name="htest3" value="<%=request.getParameter("htest3")%>">
<input type="hidden" name="htest4">
문제4 <br>
Bean의 Scope에 대한 설명으로 틀린 것은?  <br>
<input id="chk" name="cb" type="checkbox" onChange="test(0)">
① page: 기본값이며 그 페이지 내에서만 접근할 수 있다. <br>
<input id="chk" name="cb" type="checkbox" onChange="test(1)">
② request: forward, include에서 사용가능하다. <br>
<input id="chk" name="cb" type="checkbox" onChange="test(2)">
③ session: 사용자가 로그인 하면 시간에 제약없이 무한히 유지된다. <br>
<input id="chk" name="cb" type="checkbox" onChange="test(3)">
④ application: 서버를 재기동하기 전까지는 시간에 제약없이 무한히 유지된다. <br>

</form>
<br>
<button onClick="prev()">이전문제</button>
<button onClick="next()">답안지 제출</button>
</body>
</html>