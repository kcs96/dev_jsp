<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String s_name  = (String)session.getAttribute("s_name");//session에서 얻어오는것은 object이다.
   out.print("세션에서 가져온 값" + s_name);//null이 찍힘 아무것도 없어서
   if(s_name == null) {
   
%>
<script type="text/javascript">
<!--
   alert("로그인을 하셔야합니다.");
--> //null 이면 주석으로 처리해달라
</script>
<%
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style type="text/css">
      div#d_resList {
         border: thin dotted red;
         padding: 5px;
         text-align: left;
      }
   </style>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA-FKKja8sdfgMggjEvEa5agaP6D9wBd6s"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
   <script type="text/javascript">
   //쿠키 정보를 담을 전역변수 선언하기
      var s_name = null;
      function login(){
         var u_id = $("#tb_id").val();
          var u_pw = $("#tb_pw").val();
          //사용자가 입력한 아이디와 비번 확인하기
          //alert("사용자가 입력한 아이디:"+u_id+", 비번:"+u_pw);
         //$("#f_login").attr("action","loginAction.jsp");//자바코드를 사용함.
         //$("#f_login").submit();
         fetch("/ch10/login.do?mem_id="+u_id+"&mem_pw="+u_pw,{
            method: "GET"
//         }).then(res => res.text()).then(res => console.log(res));
         }).then(res => res.text()).then(function(text){
            //alert("text: "+text);
            if("비밀번호가 틀립니다." ==text.trim()){//비밀번호가 틀립니다.
               alert("비밀번호가 틀립니다.");
               $("#d_login").show();
               $("#d_logout").hide();
            }
            else if("아이디가 존재하지 않습니다." ==text.trim()){//비밀번호가 틀립니다.
               alert("비밀번호가 틀립니다.");
               $("#d_login").show();
               $("#d_logout").hide();
            }
            else{
               s_name = text.trim();
               alert("c__name:" +s_name);
               //로그인 화면은 숨기기
               $("#d_login").hide();
               //로그아웃 화면을 보여주기
               $("#d_logout").show();
               $("#logok").text(s_name+"님");
               //식당 목록을 보여주기
               $('#d_resList').show();                        
            }
         });
      }
      function logout(){
         location.href ="logut.jsp";
         u_id = $("#tb_id").textbox('setValue','');
         u_pw = $("#tb_pw").textbox('setValue','');
         $('#d_login').show();
         $('#d_logout').hide();
         $('#d_resList').hide();         
      }
      function like(u_num){
         $.ajax({
            url:'likeAction.jsp?res_num='+u_num
            ,method: 'get'
            ,success:function(data){
               if(data==1){
                  fetch('jsonMapList.jsp',{
                    method:"post" 
                  }).then(res => res.text()).then(function(text){
                     var imsi = text.trim();
                     alert("imsi==>"+ imsi);
                     var resDoc = JSON.parse(imsi);
                     var resList = '<table>';
                     for(var i=0;i<resDoc.length;i++){
                        resList += '<tr><td>';
                        resList += resDoc[i].res_name+'<br>';
                        resList += '<img src=like.png width=20 height=20/>'+resDoc[i].res_like;
                        resList += '&nbsp;&nbsp;&nbsp;';
                        resList += '<img src=hate.png width=20 height=20/>'+resDoc[i].res_hate;
                        resList += '</td></tr>';
                     }
                     resList += '</table>';
                     $("#d_resList").html(resList);
                  });///end of fetch
               }//////오라클 서버에 반영이 되었을때
            }//////////end of success
         });///////////end of ajax
      }/////////////////end of like
      function hate(u_num){
         $.ajax({
            url:'hateAction.jsp?res_num='+u_num
               ,method: 'get'
               ,success:function(data){
                  if(data==1){
                     fetch('jsonMapList.jsp',{
                       method:"post" 
                     }).then(res => res.text()).then(function(text){
                        var imsi = text.trim();
                        alert("imsi==>"+ imsi);
                        var resDoc = JSON.parse(imsi);
                        var resList = '<table>';
                        for(var i=0;i<resDoc.length;i++){
                           resList += '<tr><td>';
                           resList += resDoc[i].res_name+'<br>';
                           resList += '<img src=like.png width=20 height=20/>'+resDoc[i].res_like;
                           resList += '&nbsp;&nbsp;&nbsp;';
                           resList += '<img src=hate.png width=20 height=20/>'+resDoc[i].res_hate;
                           resList += '</td></tr>';
                        }
                        resList += '</table>';
                        $("#d_resList").html(resList);
                     });///end of fetch
                  }//////오라클 서버에 반영이 되었을때
               }//////////end of success            
         })
      }
   </script>
</head>
<body>
<script type="text/javascript">
//DOM구성이 완료 되었을때 - 크롬브라우저가 mapDesign2.html문서에 들어있는 태그들에 대한 스캔이 완료
   $(document).ready(function (){
      if(s_name !=null && s_name.length() > 0){//쿠키값이 존재하니? 네:로그인을 했어요, 아니:로그인 안했음.
         $('#d_login').hide();
         $('#d_logout').show();
         $('#d_resList').show();            
      }else{
         $('#d_login').show();
         $('#d_logout').hide();
         $('#d_resList').hide();            
      }
   });
</script>
<table border="1" align="center" width="900" height="600">
   <tr>
      <td width="700">
      <div id="d_map" style="width:695px; height:600px;"></div>
      </td>
      <td width="200" valign="top">
<!--======================== 로그인 화면 시작 ======================-->      
      <div id="d_login">
         <form id="f_login">
         <table width="100%" border="0" borderColor="blue">
            <tr>
               <td>
               <input id="tb_id" name="mem_id" class="easyui-textbox" prompt="아이디" data-options="iconCls:'icon-man'" style="width:110px">
               </td>
               <td rowspan="2">
               <a id="btn" style="height:60px" href="javascript:login()" class="easyui-linkbutton">로그인</a>               
               </td>
            </tr>
            <tr>
               <td>
               <input id="tb_pw" name="mem_pw" class="easyui-passwordbox" prompt="비밀번호" iconWidth="28" style="width:110px;padding:10px">
               </td>
            </tr>
         </table>
         </form>
      </div>
<!--====================== 로그인 화면  끝  ======================-->      
<!--======================== 로그아웃 화면 시작 ======================-->      
      <div id="d_logout">
         <form id="f_logout">
         <table width="100%" border="0" borderColor="blue">
            <tr>
               <td style="width:110px">
                  <span id="logok"></span>
               </td>
               <td>
               <a id="btn_logout" style="height:30px"
                  href="javascript:logout()" class="easyui-linkbutton">로그아웃</a>
               </td>
            </tr>
         </table>
         </form>
      </div>
<!--====================== 로그 아웃 화면  끝  ======================-->      
<!--###################### 식당 목록 시작  ######################-->
   <div id="d_resList">식당목록</div>
<!--###################### 식당 목록  끝    ######################-->
   
   <script type="text/javascript">
      $(document).ready(function(){
         $("#d_login").show();
         $("#d_logout").hide();
      
      var map = new google.maps.Map(document.getElementById('d_map'),{
          zoom: 14
          ,center: new google.maps.LatLng(37.478513,126.877800)
          ,mapTypeId: google.maps.MapTypeId.ROADMAP
      });////////////end of map
      var infowindow = new google.maps.InfoWindow();//말풍선을 클릭했을 때 열리는 창
      var marker;//5개가 출력(json으로 스캔-jsonMapList.jsp)
      var i;//마커 생성시 부여한 인덱스값 0~4
      $.ajax({
         url: 'jsonMapList.jsp'
         ,dataType: 'json'
         ,success:function(data){
            //alert(data);
            //$("#d_map").text(data);[object Object]
            //insert here
            var result = JSON.stringify(data);//직관적인 정보로 변환(구조체-덩어리)-알아봄.
            //$("#d_map").text(result);
            var jsonDoc = JSON.parse(result);//배열로 전환-다시 객체화처리됨.(배열)
            for(var i=0;i<jsonDoc.length;i++){
               //alert(jsonDoc[i].res_name);//배열.속성이름으로 꺼낸다.
               marker = new google.maps.Marker({
                 id: i//0,1,2,3,4 - 마커의 인덱스 정보
                 //포지션값도 배열로 변경됨.
                ,position: new google.maps.LatLng(jsonDoc[i].lat,jsonDoc[i].lng)
                 ,map: map//지도는 하나
                 ,title: jsonDoc[i].res_name// 마커가 5개이므로 식당이름 5개 분류
               });////////////////end of marker
               //마커 5개가 for문 안에서 객체 생성되니까 이벤트도 안에서 건다.
               google.maps.event.addListener(marker, 'click',(function(marker,i){
               //addListener 함수의 리턴값이 변수가 아닌 함수임.
               //자바스크립트에서는 값에 싱글 쿼테이션이나 더블 쿼테이션이 없으면 변수로 취급하여
               //undefine XXXX오류 메시지 출력
                  return function() {//함수의 결과는 윈도우창을 열어줌.(click된 마커마다 다르게)
                     var content = '<b>식당이름 : '+jsonDoc[i].res_name+'</b>';
                     content += '<br>';
                     content += '<b>전화번호 : '+jsonDoc[i].res_tel+'</b>';
                     content += '<br>';
                     content += '좋아요<a href="javascript:like('+jsonDoc[i].res_num+')"><img src=like.png width=20 height=20/></a>';
                     content += '&nbsp;&nbsp;';                     
                     content += ',싫어요<a href="javascript:hate('+jsonDoc[i].res_num+')"><img src=hate.png width=20 height=20/></a>';
                     infowindow.setContent(content);
                     infowindow.open(map,marker);
                  }//end of 반환함수
               })(marker,i));////////////end of addLitener
               //마커를 생성했을때 click이벤트 처리하기
               if(marker){//자바스크립트 에서는 0이 아니면 모두 true
                  marker.addListener('click', function(){
                    map.setZoom(16);//상세보기 처리(14->15)
                    map.setCenter(this.getPosition());
                  });
               }/////////////////////////end of if
            }///////////////end of for
         }///////////////////end of success
      });////////////////////end of ajax
      });////////////////////end of ready
   </script>
</body>
</html>












