package com.mvc2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class MemberController implements Controller{
	Logger logger = Logger.getLogger(MemberController.class);
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("process 호출 성공");
		return null;
	}
	

}
