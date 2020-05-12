package jsp.ch03;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.HangulConversion;
import com.util.HashMapBinder;

public class ParameterServlet extends HttpServlet {
	Logger logger = Logger.getLogger(ParameterServlet.class);
	@Override
	public void doGet(HttpServletRequest req
					,HttpServletResponse res) throws IOException,ServletException{
		logger.info("doGet 호출");
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.binder(pMap);
		Object keys[] = null;
		keys = pMap.keySet().toArray();
		for(int i=0;i<keys.length;i++) {
			logger.info(pMap.get(keys[i]));
		}
		
	}
	
	@Override
	public void doPost(HttpServletRequest req
					,HttpServletResponse res) throws IOException,ServletException{
		logger.info("doPost 호출");
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.binder(pMap);
		Object keys[] = null;
		keys = pMap.keySet().toArray();
		for(int i=0;i<keys.length;i++) {
			logger.info(pMap.get(keys[i]));
		}
		
	}
}
