package jsp.ch17;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
				    	// /ch17/shopping2.do
@WebServlet(urlPatterns="/ch17/shopping.do")
public class FrontServlet extends HttpServlet {
	Logger logger = Logger.getLogger(FrontServlet.class);
	public void doService(HttpServletRequest req,
	 	      HttpServletResponse res) throws ServletException, IOException {
		//url pattern -> shopping.do?mode=order
		String mode = req.getParameter("mode");
		//주문관리인지?
		if("order".equals(mode)) {
			System.out.println("주문관리");
			logger.info("주문관리");
			res.sendRedirect("./orderList.jsp");
		}
		//회원관리인지?
		else if("member".equals(mode)) {
			System.out.println("회원관리");
			logger.info("회원관리");
		}
	}
	@Override
	public void doGet(HttpServletRequest req,
			 	      HttpServletResponse res) throws ServletException, IOException {
		doService(req,res);
	}
	@Override
	public void doPost(HttpServletRequest req,
	 	      HttpServletResponse res) throws ServletException, IOException {
		doService(req,res);
	}
	
	
}
