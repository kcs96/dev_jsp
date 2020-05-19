package jsp.ch09;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chap9/ch09/loginServlet.do")
public class LoginServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
		
		String menu = null;
		menu = req.getParameter("menu");
		if(menu == null) {
			String mem_id = req.getParameter("mem_id");
			String mem_pw = req.getParameter("mem_pw");
			//db연동을 했다고 가정함.id와pw를 비교해 김유신을 구해온것임.
			Cookie c_name = new Cookie("c_name","김유신");
			c_name.setPath("/");
			c_name.setMaxAge(-1); //음수 시 브라우저가 끊어질 시 바로 삭제됨
			res.addCookie(c_name);
			res.sendRedirect("main.jsp");
		}else if("logout".equals(menu)) {
			Cookie[] cookies = req.getCookies();//쿠키값을 얻어올땐 배열로 받아야한다.
			String h_no=null;
			String[] users = new String[4];
			
			if(cookies!=null &&cookies.length >0){
				for(int i=0;i<cookies.length;i++){
					if("c_name".equals(cookies[i].getName())){
						
					}
		}
	}
}
	}
}
