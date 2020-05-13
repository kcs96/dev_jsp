package forward;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jsp.ch17.MVCServlet;



public class DeptController  extends HttpServlet {
	ServletConfig config = null;
	Logger logger = Logger.getLogger(MVCServlet.class);
	DeptDao dDao = new DeptDao();
	public void init(ServletConfig config) throws ServletException{
		this.config=config;
		this.init();
	}
	public void doService(HttpServletRequest req,
	 	      HttpServletResponse res) throws ServletException, IOException {
		logger.info("doService 호출 성공");
		int deptno = Integer.parseInt(req.getParameter("deptno"));
		List<Map<String,Object>> rlist =dDao.deptList(deptno);
		req.setAttribute("rlist", rlist);
		RequestDispatcher view = req.getRequestDispatcher("/forward/deptlist.jsp");
		view.forward(req, res);
	}  
	
	@Override
	public void doGet(HttpServletRequest req,
			 	      HttpServletResponse res) throws ServletException, IOException {
		logger.info("doGet 호출 성공");
		doService(req,res);
	}
	@Override
	public void doPost(HttpServletRequest req,
	 	      HttpServletResponse res) throws ServletException, IOException {
		logger.info("doPost 호출 성공");
		doService(req,res);
	}
	
	
}
