<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.MalformedURLException"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String clientId = "XeCAKY5ka_TAL3YrjirD";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "2qe1ZGw0yn";//애플리케이션 클라이언트 시크릿값";
	
	String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
	String key = request.getParameter("key"); // 캡차 키 발급시 받은 키값
	String value = request.getParameter("input"); // 사용자가 입력한 캡차 이미지 글자값
	String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value=" + value;
	
	Map<String, String> requestHeaders = new HashMap<>();
	requestHeaders.put("X-Naver-Client-Id", clientId);
	requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	
	
	//String responseBody = get(apiURL, requestHeaders);
	 HttpURLConnection con = null;
	 try {
            URL url = new URL(apiURL);
            con =  (HttpURLConnection)url.openConnection();
        } catch (IOException e) {
        	 out.print("오류");
        }
	 String result ="";
	  try {
          con.setRequestMethod("GET");
          for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
              con.setRequestProperty(header.getKey(), header.getValue());
          }
	
          int responseCode = con.getResponseCode();
          
          if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
           //   return readBody(con.getInputStream());
        	  InputStreamReader streamReader = new InputStreamReader(con.getInputStream());
			
              try (BufferedReader lineReader = new BufferedReader(streamReader)) {
                  StringBuilder responseBody = new StringBuilder();

                  String line;
                  while ((line = lineReader.readLine()) != null) {
                      responseBody.append(line);
                  }

                  result= responseBody.toString().substring(10, 11);
                  
              } catch (IOException e) {
                  throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
              }
          
          } else { // 에러 발생
        	 	 result="오류";
          }
      } catch (IOException e) {
          throw new RuntimeException("API 요청과 응답 실패", e);
      } finally {
          con.disconnect();
      }
	  if(result.equals("t")){
	 	 out.print("일치!!");
	  }
	  else if(result.equals("f")){
		 out.print("불일치!!");
	  }else{
		  out.print("오류발생");
	  }
	
	 
%>