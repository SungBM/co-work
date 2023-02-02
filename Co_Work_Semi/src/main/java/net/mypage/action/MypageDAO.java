package net.mypage.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MypageDAO {
	private DataSource ds;

	public MypageDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB연결 실패 : " + ex);
		}
	}

	public Member member_info(String user_id) {
		Member m = new Member();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
//			pstmt = con.prepareStatement("select * from user_info user_id = ?");
			pstmt = con.prepareStatement("select * from USER_INFO WHERE user_id = 'HTA1'");
//			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m = new Member();
				m.setUser_id(rs.getString("user_id"));
//				m.setUser_id("HTA1");
				m.setUser_password(rs.getString("user_password"));
				m.setUser_dept(rs.getString("user_dept"));
				m.setUser_job(rs.getString("user_job"));
				m.setUser_email(rs.getString("user_email"));
				m.setUser_name(rs.getString("user_name"));
				m.setUser_fax(rs.getString("user_fax"));
				m.setUser_phone(rs.getString("user_phone"));
				m.setUser_intro(rs.getString("user_intro"));
				m.setUser_img(rs.getString("user_img"));
				m.setUser_card(rs.getString("user_card"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("memInfo() 에러 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}
		return m;
	} // member_info end

	public int update(Member m) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "update user_info "
					+ "	  set user_name=?, user_dept=?, user_job=?, user_email=?, user_fax=?, user_phone=?, user_intro=?, user_img=?, user_card=? "
					+ "	  where USER_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUser_name());
			pstmt.setString(2, m.getUser_dept());
			pstmt.setString(3, m.getUser_job());
			pstmt.setString(4, m.getUser_email());
			pstmt.setString(5, m.getUser_fax());
			pstmt.setString(6, m.getUser_phone());
			pstmt.setString(7, m.getUser_intro());
			pstmt.setString(8, m.getUser_img());
			pstmt.setString(9, m.getUser_card());
			pstmt.setString(10, "HTA1");
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}
		return result;
	} // update end
}
