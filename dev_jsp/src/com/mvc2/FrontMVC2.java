package com.mvc2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class FrontMVC2 extends HttpServlet{
	Logger logger = Logger.getLogger(FrontMVC2.class);
	
	public void doService(HttpServletRequest req,
	 	      HttpServletResponse res) throws ServletException, IOException {
		logger.info("doService 호출 성공");
		
		String requestURI =req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = 
					requestURI.substring(contextPath.length()+1);
		Controller controller = null;
		logger.info("command"+command);
		//insert here - 인스턴스화 and process call 해야한다.
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
