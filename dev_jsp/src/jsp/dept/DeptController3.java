package jsp.dept;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.HashMapBinder;

import jsp.ch17.MVCServlet;

@WebServlet(urlPatterns="/dept/deptList.km")
public class DeptController3 extends HttpServlet {
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
	
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pMap = new HashMap<>();
		Map<String,Object> rMap = hmb.binder(pMap);
		List<Map<String,Object>> rlist = null;
		rlist=dDao.deptList(rMap);
		req.setAttribute("rlist", rlist);
		ActionForward af = new ActionForward();
		af.setRedirect(false);
		af.setPath("jsonDeptList.jsp");
		if(af != null)
		af.actions(req, res);
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

