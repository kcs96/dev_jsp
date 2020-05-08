package com.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DBConnetionMgr {
		
	Connection			con		= null; //전역변수 선언하기 -클래스 전역에서 사용가능함.
	//오라클 서버에 쿼리문을 전달하고 너가 좀 처리해 줄래
	PreparedStatement	patmt	= null;
	//오라클에는 일꾼이 살고 있는데 이름은 옵티마이저라고 함.
	//데이터를 찾을 때는 커서를 움직이면서 조회결과가 존재하는지 확인하고 그 로우에 있는 값들을
	//RAM메모리 영역에 올린다. 커서를 조작하면서 해당 로우에 있는 값을 꺼낼 수 있다.
	ResultSet			rs		= null;
	
	
	public static final String _DRIVER
		= "oracle.jdbc.driver.OracleDriver";
	//물리적으로 떨어져 있는 오라클 서버에 URL 정보 추가
	public static final String _URL 
		= "jdbc:oracle:thin:@192.168.0.252:1521:orcl11";
	public static final String _USER = "scott";
	public static final String _PW = "tiger";
	
	private static DBConnetionMgr dbmgr = null;
	private DBConnetionMgr() {	}
	//싱글톤 패턴
	public static DBConnetionMgr getInstance() {
		if(dbmgr==null) {
			dbmgr = new DBConnetionMgr();
		}
		return dbmgr;
	}
	
	public Connection getConnection() {  //꼭 예외처리를 해야한다. 왜? JDBCTest 클래스를 못찾아갈수있으니까
		//오라클 회사 정보를 수집함
		try {
			Class.forName(_DRIVER);
			con = DriverManager.getConnection(_URL,_USER,_PW);

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 클래스 이름을 찾을 수 없어요.");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("예외가 발생했음. 정상적으로 처리가 안됨.");
		}
		System.out.println("getConnection호출 성공");
		return con;
	}
	
	/* DBConnectionMgr은 여러 업무에서 공통으로 사용하는 클래스 입니다.
	 * 사용한 자원(Conntion, PreparedStatement, ResultSet)은 반드시 반납을 하도록 합니다.
	 * 동시 접속자 수가 많은 시스템에서 자원사용은 곧 메모리랑 직결되므로
	 * 서버가 다운되거나 시스템 장애 발생에 원인이 됩니다.
	 */
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
	
	public static void main(String[] args) {
		DBConnetionMgr.getInstance().getConnection();
	}
	
	
}
