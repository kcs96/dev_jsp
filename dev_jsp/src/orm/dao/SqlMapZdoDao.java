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

public class SqlMapZdoDao {
	Logger logger = Logger.getLogger(SqlMapEmpDao.class); 
	SqlSessionFactory sqlMapper = null;
	public List<Map<String,Object>> getZdoList(){
		logger.info("zdo 호출 성공");
		//logger.debug("debug");
		//logger.warn("warn");
		//logger.error("error");
		//logger.fetal("");
		List<Map<String,Object>> zdolist = null;
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSec = sqlMapper.openSession();
			zdolist = sqlSec.selectList("getZdoList");
			System.out.println("조회한 로우 수 : "+zdolist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return zdolist;
		}
	
	public List<Map<String,Object>> getSiGuList(Map<String,Object> pMap){
		logger.info("getSiGuList 호출 성공");
		List<Map<String,Object>> slist = null;
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSec = sqlMapper.openSession();
			slist = sqlSec.selectList("getSiGuList", pMap);
			System.out.println("조회한 로우 수 : "+slist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return slist;
		}
	
	public List<Map<String,Object>> getDongList(Map<String,Object> pMap){
		logger.info("getDongList 호출 성공");
		List<Map<String,Object>> dlist = null;
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSec = sqlMapper.openSession();
			dlist = sqlSec.selectList("getDongList",pMap);
			System.out.println("조회한 로우 수 : "+dlist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dlist;
		}
	
	public List<Map<String,Object>> getZipcodeList(Map<String,Object> pMap){
		System.out.println(pMap.get("address"));
		logger.info("getZipcodeList 호출 성공");
		List<Map<String,Object>> dlist = null;
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSec = sqlMapper.openSession();
			dlist = sqlSec.selectList("getZipcodeList",pMap);
			System.out.println("조회한 로우 수 : "+dlist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dlist;
	}
	
	public static void main(String[] args) {
		SqlMapZdoDao eDao = new SqlMapZdoDao();
		
		List<Map<String,Object>> bList = null;
		Map<String,Object> pMap = new HashMap<>();
		pMap.put("address", "안양시 만안구");
		bList=eDao.getZipcodeList(pMap);
	}
}
