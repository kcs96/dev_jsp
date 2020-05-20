package com.map;

import java.sql.CallableStatement; //오라클 회사가 지원함.
import java.sql.Connection;
import java.sql.JDBCType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnetionMgr;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;
import oracle.jdbc.oracore.OracleType;

public class RestaurantDao {
	DBConnetionMgr dbMgr = DBConnetionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	CallableStatement cstmt = null;
	//
	OracleCallableStatement ocstmt = null;
	
	/************************************************************
	 * 프로시저를 활용하여 로그인 처리하기
	 * @param mem_id : 사용자가 입력한 아이디
	 * @param mem_pw : 사용자가 입력한 비번
	 * @return msg : proc_login2020(u_id IN varchar2, u_pw IN varchar2, msg OUT varchar2);
	 *************************************************************/
	public String login(String mem_id, String mem_pw) {
		String msg = null;
		int result=0;
		try {
			con = dbMgr.getConnection();
			cstmt = con.prepareCall("{ call proc_login2020(?,?,?)}");
			cstmt.setString(1, mem_id);//메소드의 파라미터로 사용자가 입력한 아이디로 받아옴.
			cstmt.setString(2, mem_pw);//
			cstmt.registerOutParameter(3, OracleTypes.VARCHAR); //OUT속성일 때만
			//cstmt.execute();//반환타입 boolean
			result=cstmt.executeUpdate(); //반환타입 int
			msg = cstmt.getString(3);
			System.out.println("result :"+result+", msg:"+msg);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return msg;
	}
	
	
	public List<Map<String,Object>> procRestList(){
		  List<Map<String,Object>> rList = null;
	      StringBuilder sql = new StringBuilder();
	      try {
	    	 //오라클사가 배포하는 드라이버 클래스를 스캔함. 
	    	 con = dbMgr.getConnection(); //물리적으로 떨어져 있는 서버에 연결통로  확보
	    	 //DML를 요청할 땐 PreparedStatement
	    	 //프로시저를 요청할땐 CallableStatement
	         cstmt = con.prepareCall("{ call proc_restaurant(?)}");
	         cstmt.registerOutParameter(1, OracleTypes.CURSOR);
	         cstmt.execute();//오라클에 살고 있는 옵티마이저에게 처리해주세요.
	         ocstmt = (OracleCallableStatement)cstmt;
	         //프로시저의 OUT속성을 지정함.
	         rs = ocstmt.getCursor(1);
	         rList = new ArrayList<>();
	         Map<String,Object> rmap = null;
	         while(rs.next()) {
	        	 rmap = new HashMap<>();
	        	 rmap.put("res_num", rs.getInt("res_num"));
	        	 rmap.put("res_name", rs.getString("res_name"));
	        	 rmap.put("res_tel", rs.getString("res_tel"));
	        	 rmap.put("res_addr", rs.getString("res_addr"));
	        	 rmap.put("res_hate", rs.getInt("res_hate"));
	        	 rmap.put("res_like", rs.getInt("res_like"));
	        	 rmap.put("res_photo", rs.getString("res_photo"));
	        	 rmap.put("res_info", rs.getString("res_info"));
	        	 rmap.put("res_time", rs.getString("res_time"));
	        	 rmap.put("lat", rs.getDouble("lat"));
	        	 rmap.put("lng", rs.getDouble("lng"));
	        	 rList.add(rmap);
	         }
	      } catch (SQLException se) {
	         System.out.println("[[query]]"+ sql.toString());
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return rList;
	}
	
	
	public List<Map<String,Object>> restList() {
	      List<Map<String,Object>> rList = null;
	      StringBuilder sql = new StringBuilder();
	      sql.append("SELECT res_num, res_name, res_tel, res_addr, res_hate");
	      sql.append("       res_like,res_photo,res_info,res_time,");
	      sql.append("       lat,lng");
	      sql.append(" FROM restaurant");
	      try {
	         con = dbMgr.getConnection();
	         pstmt = con.prepareStatement(sql.toString());
	         rs = pstmt.executeQuery();
	         Map<String,Object> rmap = null;
	         while(rs.next()) {
	        	 rmap = new HashMap<>();
	        	 rmap.put("res_num", rs.getInt("res_num"));
	        	 rmap.put("res_name", rs.getString("res_name"));
	        	 rmap.put("res_tel", rs.getString("res_tel"));
	        	 rmap.put("res_addr", rs.getString("res_addr"));
	        	 rmap.put("res_hate", rs.getInt("res_hate"));
	        	 rmap.put("res_like", rs.getInt("res_like"));
	        	 rmap.put("res_photo", rs.getString("res_photo"));
	        	 rmap.put("res_info", rs.getString("res_info"));
	        	 rmap.put("res_time", rs.getString("res_time"));
	        	 rmap.put("lat", rs.getDouble("lat"));
	        	 rmap.put("lng", rs.getDouble("lng"));
	        	 rList.add(rmap);
	         }
	      } catch (SQLException se) {
	         System.out.println("[[query]]"+ sql.toString());
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return rList;
	   }
	
	public List<Map<String,Object>> mapRestList() {
		List<Map<String,Object>> mrList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select res_num,res_name,res_tel,res_photo,lat,lng, res_like, res_hate from resturant");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			  rs = pstmt.executeQuery();
		         Map<String,Object> rmap = null;
		         while(rs.next()) {
		        	 rmap = new HashMap<>();
		        	 rmap.put("res_num", rs.getInt("res_num"));
		        	 rmap.put("res_name", rs.getString("res_name"));
		        	 rmap.put("res_tel", rs.getString("res_tel"));
		        	 rmap.put("res_photo", rs.getString("res_photo"));
		        	 rmap.put("lat", rs.getDouble("lat"));
		        	 rmap.put("lng", rs.getDouble("lng"));
		        	 rmap.put("res_like", rs.getInt("res_like"));
		        	 rmap.put("res_hate", rs.getInt("res_hate"));
		        	 mrList.add(rmap);
		        	 
		         }
		      } catch (SQLException se) {
		         System.out.println("[[query]]"+ sql.toString());
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      return mrList;
		}
	
	
	public int restINS(Map<String,Object> pMap) {
		int result =0;
		StringBuilder sql = new StringBuilder();
			sql.append("insert into resturant(res_num, res_name, res_tel, res_addr");
			sql.append(",res_hate,res_like,res_photo");
			sql.append(",res_info,res_time,lat,lng)");
			sql.append(" values(seq_restaurant_num.nextval");
			sql.append(",?,?,?,0,0,?,?,?,?,?)");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			int i= 0;
			pstmt.setString(++i, pMap.get("res_name").toString());
			pstmt.setString(++i, pMap.get("res_tel").toString());
			pstmt.setString(++i, pMap.get("res_addr").toString());
			pstmt.setString(++i, pMap.get("res_photo").toString());
			pstmt.setString(++i, pMap.get("res_info").toString());
			pstmt.setString(++i, pMap.get("res_time").toString());
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lat").toString()));
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lng").toString()));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[query]:"+sql.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static void main(String[] args) {
		 RestaurantDao rd = new RestaurantDao();
		// List<Map<String,Object>> mrList= rd.procRestList();
		// System.out.println(mrList.size());
		 String msg = rd.login("test", "123");
		 System.out.println("msg:"+msg);
	}
}
