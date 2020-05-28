<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
  
  <title>Login Demo - Kakao JavaScript SDK</title>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
 </head>
 
 <body>
 <div>
 	아이디 : <input type="text"><br>
 	비번 : <input type="text">
 </div>
  <a id="kakao-login-btn"></a>
  
  <script type='text/javascript'>
    //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('a504f44e2e00c626834e279270699688');
   
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     success: function(authObj) {
    	 Kakao.API.request({
    		    url: '/v2/user/me',
    		    success: function(response) {
    		        var email = JSON.stringify(response.kakao_account['email']);
    		        alert(response.properties.nickname+"님 환영합니다.");
    		        location.href="result.jsp?name="+response.properties.nickname+"&email="+email;
    		    },
    		    fail: function(error) {
    		        console.log(error);
    		    }
    		});
     },
     fail: function(err) {
     alert(JSON.stringify(err));
     }
   });
    //
  </script>
 </body>
</html>