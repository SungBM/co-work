package net.admin.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
			pstmt = con.prepareStatement("select * from company_info where user_id = ?");
			pstmt.setString(1, user_id);
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

	public int create(String id, String value, String change) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();

			// 원문글의 BOARD_RE_REF 필드는 자신의 글번호 입니다.
			String sql = "insert into COMPANY_INFO(" + value + ", user_id) values(?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, change);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("데이터 삽입이 모두 완료되었습니다.");
			}
		} catch (Exception ex) {
			System.out.println("company_create() 에러 : " + ex);
			ex.printStackTrace();
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
	}

	public int dept_create(String value, String change, String company_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();

			// 원문글의 BOARD_RE_REF 필드는 자신의 글번호 입니다.
			String sql = "insert into COMPANY_DEPT(" + value + ", COMPANY_NAME) values(?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, change);
			pstmt.setString(2, company_name);
			result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("데이터 삽입이 모두 완료되었습니다.");
			}
		} catch (Exception ex) {
			System.out.println("dept_create() 에러 : " + ex);
			ex.printStackTrace();
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
	}

	public int job_create(String value, String change, String company_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();

			// 원문글의 BOARD_RE_REF 필드는 자신의 글번호 입니다.
			String sql = "insert into COMPANY_JOB(" + value + ", COMPANY_NAME) values(?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, change);
			pstmt.setString(2, company_name);
			result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("데이터 삽입이 모두 완료되었습니다.");
			}
		} catch (Exception ex) {
			System.out.println("dept_create() 에러 : " + ex);
			ex.printStackTrace();
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
	}

	public int update(String value, String change, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "update company_info set " + value + " = ? where USER_ID=?";
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			System.out.println(id);
			pstmt.setString(1, change);
			pstmt.setString(2, id);
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

	public boolean update1(String value, String change, String company, String def) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "update company_dept " + 
						 "set dept_name = ? " + 
						 "where dept_name = ? and company_name = ?";
			
			System.out.println(change);
			System.out.println(def);
			System.out.println(company);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, change);
			pstmt.setString(2, def);
			pstmt.setString(3, company);
			result = pstmt.executeUpdate();
			System.out.println("dept update 결과 " + result);
			if (result == 1) {
				System.out.println("정상 수정 완료");
				return true;
			}
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
		return false;
	} // update end

}
