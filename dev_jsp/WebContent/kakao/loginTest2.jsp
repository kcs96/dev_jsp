<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao JavaScript SDK</title>
    <script src="../js/kakao.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('a504f44e2e00c626834e279270699688');             // 2)
	
    function kakaoLogin(){
        Kakao.Auth.login({ 
            success: function() { 
                  // 3. 회원정보 추출 (사용자 API)
                  Kakao.API.request({ 
                	    /* scope: 'email', */
                        url: '/v2/user/me', 
                        success: function(res) {                                   
                              var email = res.kakao_account.email;
                              var name = res.properties.nickname;
                              alert(email+name);
                       }, 
                       fail: function(error) { 
                             console.log(JSON.stringify(error)); 
                       } 
                   }); 
          }, 
          fail: function(err) { 
                console.log(JSON.stringify(err)); 
          } 
        });
    }
</script>

</head>
<body>
	<button onClick="kakaoLogin()">카카오로그인</button>
</body>
</html>
