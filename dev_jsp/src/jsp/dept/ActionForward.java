package jsp.dept;

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
	
	
}
