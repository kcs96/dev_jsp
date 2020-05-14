package jsp.dept;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.util.DBMyBatisMgr;

public class DeptDao {
	Logger logger = Logger.getLogger(DeptDao.class); 
	SqlSessionFactory sqlMapper = null;
	DBMyBatisMgr dbMyb = DBMyBatisMgr.getInstance();
	public List<Map<String,Object>> deptList(Map<String,Object> pMap){
		logger.info("deptList 호출 성공");
		List<Map<String,Object>> plist = null;
		try {
			SqlSession sqlSes = dbMyb.openSession();
			//커넥션 얻기 성공==>sqlses
			plist = sqlSes.selectList("deptList",pMap);
			System.out.println("조회한 로우 수 : "+plist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return plist;
	}
	public static void main(String[] args) {
		DeptDao eDao = new DeptDao();
		Map<String,Object> rMap = new HashMap<String, Object>();
		rMap.put("deptno", 10);
		List<Map<String,Object>> deptList =eDao.deptList(rMap);
	}
}
