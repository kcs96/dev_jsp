package forward;

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
	public List<Map<String,Object>> deptList(int deptno){
		logger.info("deptList 호출 성공");
		List<Map<String,Object>> dlist = null;
		try {
			SqlSession sqlSec = dbMyb.openSession();
			dlist = sqlSec.selectList("deptList",deptno);
			System.out.println("조회한 로우 수 : "+dlist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dlist; 
	}
	public static void main(String[] args) {
		DeptDao eDao = new DeptDao();
		List<Map<String,Object>> deptList =eDao.deptList(10);
	}
}
