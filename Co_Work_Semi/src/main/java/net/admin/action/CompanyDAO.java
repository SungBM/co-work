package net.admin.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.mypage.action.Member;

public class CompanyDAO {
	private DataSource ds;

	public CompanyDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB연결 실패 : " + ex);
		}
	}

	public Company company_info(String user_id) {
		Company c = new Company();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
//			pstmt = con.prepareStatement("select * from company_info where user_id = ?");
			pstmt = con.prepareStatement("select * from company_info where user_id = 'HTA1'");
//			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				c = new Company();
				c.setCompany_name(rs.getString(1));
				c.setCompany_url(rs.getString(2));
				c.setCompany_logo(rs.getString(3));
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
		return c;
	} // company_info end
	
	

}
