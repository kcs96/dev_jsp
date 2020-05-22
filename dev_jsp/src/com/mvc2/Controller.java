package com.mvc2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException;
}
