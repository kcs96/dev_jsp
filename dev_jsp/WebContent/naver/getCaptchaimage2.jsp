<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.io.*" %> 
<%@ page trimDirectiveWhitespaces="true" %>  
<%
	String clientId = 
		"5NNeHasY7KCWoMGm0suJ"; //애플리케이션 클라이언트 아이디값";
	String clientSecret = 
		"4zvlywLkoc"; //애플리케이션 클라이언트 시크릿값";	
	String key = null;
	try{
		String code = "0";//키발급시 0, 캡챠이미지 비교시 1로 셋팅
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code="+code ;
        URL url = new URL(apiURL);
        HttpURLConnection con = 
        		(HttpURLConnection)url.openConnection();
	    con.setRequestMethod("GET");
        con.setRequestProperty("X-Naver-Client-Id", clientId);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        //여기까지가 네이버 서버에 나의 요청을 전달하기 끝
        //응답상태 코드 받기
        int responseCode = con.getResponseCode();//200, 204, 302, 404
        BufferedReader br = null;
        //네이버 서버에서 요청에 대한 응답을 성공처리
        if(200==responseCode){//나의 요청을 네이버가 듣고 처리해주었음.
        	br = new BufferedReader(
        			new InputStreamReader(
        					con.getInputStream()));
        }else{
        	br = new BufferedReader(
        			new InputStreamReader(
        					con.getInputStream()));        	
        }
        String inputLine=null;
        StringBuilder res = new StringBuilder();
        while((inputLine = br.readLine())!=null){
        	res.append(inputLine);
        }
        br.close();
        key = res.toString();
        //out.print("key:"+key);
        key = key.substring(8,24);
        //out.print("key2:"+key);
        String apiURL2 = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key="+key;//{"key":"fefsdfdsfsdfwer"}
        //아래 코드가 어렵다. 안해본 사람
        out.print(apiURL2);
	}catch(Exception e){
		e.printStackTrace();
	}
%>







