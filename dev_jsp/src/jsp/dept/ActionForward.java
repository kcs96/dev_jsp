package jsp.dept;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionForward {
	private String path = null; //URL정보 req.getRequestURI()
	private boolean isRedirect = true; //true:redirect, false:forward
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	public void actions(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException {
		if(isRedirect==true) {
			//redirect
			res.sendRedirect(path);
		}else if(isRedirect==false){
			//forward 
			RequestDispatcher view = req.getRequestDispatcher(path);
			view.forward(req, res);
		}
	}
}
