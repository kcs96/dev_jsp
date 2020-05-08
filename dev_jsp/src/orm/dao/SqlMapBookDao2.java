package orm.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import com.util.DBMyBatisMgr;

public class SqlMapBookDao2 {
	Logger logger = Logger.getLogger(SqlMapEmpDao.class); 
	SqlSession sqlSec = null;
	DBMyBatisMgr dbmgr = DBMyBatisMgr.getInstance();
	List<Map<String,Object>> elist = null;
	
	public List<Map<String,Object>> bookList(Map<String,Object> pMap){
			sqlSec = dbmgr.openSession();
			elist = sqlSec.selectList("bookList",pMap);
			return elist;
		}
	
	public static void main(String[] args) {
		SqlMapBookDao2 eDao = new SqlMapBookDao2();
		List<Map<String,Object>> empList =eDao.bookList(null);
	}
}
