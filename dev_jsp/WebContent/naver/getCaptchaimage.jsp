<%@page import="java.io.IOException"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String clientId = "XeCAKY5ka_TAL3YrjirD"; //애플리케이션 클라이언트 아이디값";
	String clientSecret = "2qe1ZGw0yn"; //애플리케이션 클라이언트 시크릿값";
	
	String key = "owOUjpiKMqnB9beO"; // https://openapi.naver.com/v1/captcha/nkey 호출로 받은 키값
	String apiUrl = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
	
	Map<String, String> requestHeaders = new HashMap<>();
	requestHeaders.put("X-Naver-Client-Id", clientId);
	requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	
	 URL url = new URL(apiUrl);
	 HttpURLConnection con = (HttpURLConnection)url.openConnection();
	 try {
         con.setRequestMethod("GET");
         for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
             con.setRequestProperty(header.getKey(), header.getValue());
         }
         int responseCode = con.getResponseCode();
         String responseBody=null;
         if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
        	   int read;
               byte[] bytes = new byte[1024];
               // 랜덤한 이름으로  파일 생성
               String filename = Long.valueOf(new Date().getTime()).toString();
               File f = new File(filename + ".jpg");
               try(OutputStream outputStream = new FileOutputStream(f)){
                   f.createNewFile();
                   while ((read = con.getInputStream().read(bytes)) != -1) {
                       outputStream.write(bytes, 0, read);
                   }
                   responseBody= "이미지 캡차가 생성되었습니다.";
               } catch (IOException e) {
            	   responseBody= "이미지 캡차 파일 생성에 실패 했습니다.";
               }
               
	 	    out.println(responseBody);
         }
	 }catch(Exception e){
		 
	 }
	 %>
