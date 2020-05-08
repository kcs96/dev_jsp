package ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class BoardAction extends HttpServlet {
	Logger logger = Logger.getLogger(BoardAction.class);
	@Override
	public void doGet(HttpServletRequest req,
			 	      HttpServletResponse res) throws ServletException, IOException {
		logger.info("doGet 호출");
		String mem_id = getInitParameter("mem_id");
		logger.info("mem_id:"+ mem_id);
		ServletContext ctx = this.getServletContext();
		String driver = ctx.getInitParameter("driver");
		String user = ctx.getInitParameter("user");
		res.setContentType("text/html;charset=UTF-8");
		logger.info("driver:"+driver);
		logger.info("user:"+user);
		
		PrintWriter out = res.getWriter();
		out.print("서블릿에서 전송한 정보");
	}
	@Override
	public void doPost(HttpServletRequest req,
	 	      HttpServletResponse res) throws ServletException, IOException {
		logger.info("doPost 호출");
	}
}
