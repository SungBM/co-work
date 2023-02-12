package net.mypage.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.mypage.db.Member;

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
			pstmt = con.prepareStatement("select * from user_info user_id = ?");
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m = new Member();
				m.setUser_id(rs.getString("user_id"));
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
			System.out.println("member_info() 에러 : " + ex);
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
			System.out.println("update() 오류");

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

	public int isId(String user_id, String user_password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1; // 패스워드가 다릅니다.
		try {
			con = ds.getConnection();

			String sql = "SELECT user_id, user_password from user_info where user_id = ? and user_password = ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, user_id);
			pstmt.setString(2, user_password);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (rs.getString(2).equals(user_password)) {
					result = 1; // 아이디와 비밀번호 일치
				} else {
					result = 0; // 비밀번호가 일치하지 않는 경우.
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("isId() 오류");

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
		return result;
	}

	public int passwordchange(String user_id, String user_password1) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "update user_info set user_password = ? WHERE USER_ID = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_password1);
			pstmt.setString(2, user_id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("passwordchange() 오류");
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
	} // passwordchange end

}
