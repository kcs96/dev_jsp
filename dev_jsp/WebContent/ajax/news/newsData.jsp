<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//디클러레이션- 전역변수이다.
//싱글톤으로 관리(서블릿-newsData_jsp.java=>HttpServlet-이 객체는 계속 유지됨-새로고침을 당해도.)
	int x = 1;//전역변수이다.
	public String newsList(String news[]){
		//자바성능튜닝팀 지적사항 - 삼성 SDS -지방공개정보시스템
		StringBuilder sb = new StringBuilder();
		sb.append("<table width='500px' border='1'>");
		sb.append("<tr><td>"+news[0]+" > "+news[1]+"</td></tr>");
		sb.append("</table>");
		return sb.toString();
	}
%>    
<%
	//int x = 1;//지역변수이다.
//스크립틀릿- 메소드 선언불가
	String news1[] = {"연합뉴스","교회·식당·투표…첫 증상 발현 후 9일간 일상생활"};
	String news2[] = {"연합뉴스","초등 1∼3학년 오늘 온라인개학…초중고 540만명 원격수업 시대"};
	String news3[] = {"연합뉴스","CGV 여의도, 대면 최소화 '언택트시네마'로 재탄생"};
	String news4[] = {"연합뉴스","사회적 거리두기 완화됐지만... 국립문화예술시설 '휴관'"};
	String news5[] = {"연합뉴스","'페스트' 알베르 까뮈, 교보문고 '올해의 아이콘' 선정"};
	//화면에 내보내 질 코드 담기
	String datas = "";
	switch(x){
	case 1:
		datas= newsList(news1);
		x++;
		break;
	case 2:
		datas= newsList(news2);
		x++;
		break;
	case 3:
		datas= newsList(news3);
		x++;
		break;
	case 4:
		datas= newsList(news4);
		x++;
		break;
	case 5:
		datas= newsList(news5);
		x=1;
		break;
	}
	out.clear();
	out.print(datas);
%>