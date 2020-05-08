package jsp.ch17;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
public class MVCServlet extends HttpServlet {
	ServletConfig config = null;
	Logger logger = Logger.getLogger(MVCServlet.class);
	public void init(ServletConfig config) throws ServletException{
		this.config=config;
		this.init();
	}
	public void doService(HttpServletRequest req,
	 	      HttpServletResponse res) throws ServletException, IOException {
		logger.info("doService 호출 성공");
		String uri = req.getRequestURI();  // member/memberList.kosmo
		String context = req.getContextPath(); //server.xml의 context path
		logger.info("url:"+uri);
		logger.info("context:"+context);
		String command = uri.substring(context.length()+1);
		logger.info("command:"+command);
		
		int end = command.lastIndexOf('.');
		command = command.substring(0,end);
		String imsi[] = null;
		imsi = command.split("/");
		/*
		for(String val : imsi) {
			logger.info(val);
		}
		*/
		
		MemberController memCtrl = new MemberController();
		OrderController orderCtrl = new OrderController();
		GoodsController goodCtrl = new GoodsController();
		
		if("member".equals(imsi[0])) {
			memCtrl.execute(req,res);
		}
		else if("order".equals(imsi[0])) {
			orderCtrl.execute(req,res);
		}
		else if("goods".equals(imsi[0])) {
			goodCtrl.execute(req,res);
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
