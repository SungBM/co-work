package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	private DataSource ds;
	
	//생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public UserDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}

	public int isId(String USER_ID, String USER_PASSWORD) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int result=-1; //DB에 해당 id가 없습니다.
		try {
			con = ds.getConnection();
			
			String sql = "SELECT ID FROM USER_INFO WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, USER_ID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 0;   //DB에 해당 id가 있습니다.
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if(pstmt != null)
					pstmt.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}try {
			if(con != null)
				con.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int isId(String USER_ID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try {
			con = ds.getConnection();
			
			String sql = "select id from member where id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, USER_ID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 0;   //DB에 해당 id가 있습니다.
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if(pstmt != null)
					pstmt.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}try {
			if(con != null)
				con.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
		}
}