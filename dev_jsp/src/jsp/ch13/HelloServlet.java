package jsp.ch13;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req
					,HttpServletResponse res)throws IOException, ServletException{
		//<input type="text" id="mem_id" name="mem_id">
		//$("#mem_id") => id
		res.setContentType("text/html;charset=UTF-8");
		String mem_id = req.getParameter("mem_id");
		PrintWriter out = res.getWriter();
		out.print(mem_id);
	}
}
