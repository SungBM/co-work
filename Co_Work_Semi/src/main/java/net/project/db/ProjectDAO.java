package net.project.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProjectDAO {
	private DataSource ds;

	public ProjectDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB연결 실패 : " + ex);
		}
	}

	public void close(PreparedStatement pstmt, Connection conn) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.setAutoCommit(true);
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void all_close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.setAutoCommit(true);
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public int getListCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select count(*) from project");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.getStackTrace();
			System.out.println("getListCount() 에러 :" + ex);
		} finally {
			all_close(rs, pstmt, conn);
		}
		return x;
	}

	public List<Project> getProjectList(int page, int limit) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String project_List_Sql =   "SELECT * FROM (SELECT ROWNUM,P.* FROM (SELECT * FROM PROJECT ORDER BY PROJECT_END)P "
								+ "WHERE ROWNUM <= ?) WHERE ROWNUM >= ? AND ROWNUM <= ?";
		
		List<Project> list = new ArrayList<Project>();
		int startrow = (page -1 ) * limit + 1;
		int endrow = startrow + limit -1;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(project_List_Sql);
			pstmt.setInt(1, endrow);
			pstmt.setInt(2,startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Project pro = new Project();
				pro.setRow_num(rs.getInt(1));
				pro.setProject_num(rs.getInt(2));
				pro.setProject_name(rs.getString(3));
				pro.setProject_state(rs.getString(4));
				pro.setProject_prog(Integer.parseInt(rs.getString(5)));
				pro.setProject_start(rs.getString(6));
				pro.setProject_end(rs.getString(7));
				pro.setProject_priority(rs.getString(8));
				pro.setProject_partici(Integer.parseInt(rs.getString(9)));
				pro.setProject_admin(rs.getString(10));
				pro.setProject_bookmark(rs.getString(11));
				pro.setProject_parti(rs.getString(12));
				
				list.add(pro);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getProjectList() : 에러발생" + ex);
		} finally {
			all_close(rs, pstmt, conn);
		}
		
		return list;
		}

	public int insert(Project p) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			con = ds.getConnection();
			System.out.println("getConnection : insert()");
			
			pstmt = con.prepareStatement(
					"INSERT INTO PROJECT (PROJECT_NAME, PROJECT_PROG, PROJECT_ADMIN, PROJECT_START, "
					+ "					PROJECT_PRIORITY, PROJECT_PARTICI) "
					+"VALUES (?,?,?,?,?,?)");
			
			pstmt.setString(1, p.getProject_name());
			pstmt.setInt(2, p.getProject_partici());
			pstmt.setString(3, p.getProject_admin());
			result = pstmt.executeUpdate();//삽입 성공시 result는 1
			
			//primary key 제약조건 위반했을 경우 발생하는 에러
			}catch(java.sql.SQLIntegrityConstraintViolationException e) {
				result = -1;
				System.out.println("프로젝트명 중복 에러입니다.");
			}catch (Exception e) {
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
					} catch (Exception ex) {
					ex.printStackTrace();
					}
				}
				return result;		
			}//insert end		
	}
