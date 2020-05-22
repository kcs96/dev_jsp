package com.mvc2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class PriceController implements Controller{
	Logger logger = Logger.getLogger(PriceController.class);
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("process 호출 성공");
		String reqStr = req.getParameter("");
		
		return "주문관리에 대한 리턴값 입니다.";
	}
	

}
