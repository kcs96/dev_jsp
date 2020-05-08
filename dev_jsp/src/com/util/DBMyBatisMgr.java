package com.util;

import java.io.Reader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class DBMyBatisMgr {
	
	public static String resource = "orm/mybatis/Configuration.xml";
	private static SqlSession sqlSec = null;
	private static DBMyBatisMgr dbmgr = null;
	private static SqlSessionFactory sqlMapper = null;
	private static Reader reader = null;
	private DBMyBatisMgr() { }  //new DBMyBatisMgr() 을 막는다.
	//싱글톤 패턴
	public static DBMyBatisMgr getInstance() {
		if(dbmgr==null) {
			try {
				dbmgr = new DBMyBatisMgr();
				reader = Resources.getResourceAsReader(resource);
				sqlMapper =  new SqlSessionFactoryBuilder().build(reader);
			} catch (Exception e) {
				System.out.println("getInstance 호출 실패");
			}
		}
		return dbmgr;
	}
	
	public SqlSession openSession() {
		try {
			sqlSec = sqlMapper.openSession();
		} catch (Exception e) {
			System.out.println("openSeesion을 가져오는데 실패하였습니다.");
		}
		return sqlSec;
	}
	
	public void freeConnection(Connection con
							, PreparedStatement pstmt
							, ResultSet rs) {
		try {
		//사용자원의 생성 역순으로 반환할것!
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
			if(con!=null) {
				con.close();
			}
		}catch (Exception e){
			System.out.println("Exception : "+e.toString());
		}
		
	}
	
	public void freeConnection(Connection con
			, CallableStatement cstmt
			, ResultSet rs) {
		try {
		//사용자원의 생성 역순으로 반환할것!
		if(rs!=null) {
		rs.close();
		}
		if(cstmt!=null) {
		cstmt.close();
		}
		if(con!=null) {
		con.close();
		}
		}catch (Exception e){
		System.out.println("Exception : "+e.toString());
		}
		}
	
	public void freeConnection(Connection con
			, CallableStatement cstmt) {
		try {
		//사용자원의 생성 역순으로 반환할것!
			if(cstmt!=null) {
			cstmt.close();
			}
			if(con!=null) {
			con.close();
			}
		}catch (Exception e){
		System.out.println("Exception : "+e.toString());
		}
		}
	
}
