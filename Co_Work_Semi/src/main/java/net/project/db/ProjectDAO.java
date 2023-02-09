package net.project.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.swing.plaf.ProgressBarUI;

public class ProjectDAO {
	private DataSource ds;

	
	//생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.



	public ProjectDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		}catch(Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
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
	public int getDayCount(String date1, String date2) {
		int prog = 0;
		
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        try {
        	Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
    	    Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(date2);
    	    Date todayformat = new SimpleDateFormat("yyyy-MM-dd").parse(strToday);
    	    long diffSec = (format2.getTime() - format1.getTime()) / 1000; //초 차이
    	    long diffMin = (format2.getTime() - format1.getTime()) / 60000; //분 차이
    	    long diffHor = (format2.getTime() - format1.getTime()) / 3600000; //시 차이
    	    long all_Days_diff = diffSec / (24*60*60); //일자수 차이
    	   
    	    long today_diff_sec = (format2.getTime() - todayformat.getTime()) / 1000;
    	    long today_diff = today_diff_sec / (24*60*60);
    			        		
    	    double all_days = all_Days_diff;
    	    double today =  today_diff;
    	    prog = 100-(int)((today / all_days)*100 );
        } catch (Exception e) {
        	e.printStackTrace();
        }
	   
	   
	    
	    return prog;
	}
	public List<Project> getDeadLineProjects(int page, int limit){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String project_List_Sql = "SELECT PR.*,U.USER_IMG FROM ( SELECT * FROM (SELECT ROWNUM,P.* FROM (SELECT * FROM PROJECT ORDER BY PROJECT_END)P "
								+ "                WHERE ROWNUM <= ?) WHERE ROWNUM >= ? AND ROWNUM <= ? AND PROJECT_END < SYSDATE  )PR "
								+ "INNER JOIN USER_INFO U "
								+ "ON PR.PROJECT_ADMIN = U.USER_ID ";
		
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
				pro.setProject_prog(100);
				pro.setProject_start(rs.getString(6));
				pro.setProject_end(rs.getString(7));
				pro.setProject_priority(rs.getString(8));
				//pro.setProject_partici(Integer.parseInt(rs.getString(9)));
				pro.setProject_admin(rs.getString(10));
				pro.setProject_bookmark(rs.getString(11));
				ArrayList<Project_User> user_parti = getParticipants(rs.getInt(2));
				pro.setProject_parti(user_parti);
				pro.setProject_admin_img(rs.getString("user_img"));
				
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
	
	public List<Project> getProjectList(int page, int limit) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String project_List_Sql = "SELECT PR.*, U.USER_IMG FROM ( SELECT * FROM "
								+ "    (SELECT ROWNUM,P.* FROM (SELECT * FROM PROJECT ORDER BY PROJECT_END)P "
								+ "     WHERE ROWNUM <= ?) "
								+ "WHERE ROWNUM >= ? "
								+ "AND ROWNUM <= ? "
								+ "AND PROJECT_END > SYSDATE "
								+ "OR PROJECT_END IS NULL )PR "
								+ "INNER JOIN USER_INFO U "
								+ "ON PR.PROJECT_ADMIN = U.USER_ID ";
		
		
		List<Project> list = new ArrayList<Project>();
		List<Project> dead_list = new ArrayList<Project>();
		
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
				int prog = 0;
				if(rs.getString(7) != null ) {
					String date1 = rs.getString(6).substring(0,10); //날짜1
				    String date2 = rs.getString(7).substring(0,10); //날짜2
				
				    prog = getDayCount(date1, date2);
					pro.setProject_prog(prog);
				} else {
					pro.setProject_prog(1);
				}
				
				pro.setProject_start(rs.getString(6));
				pro.setProject_end(rs.getString(7));
				pro.setProject_priority(rs.getString(8));
				pro.setProject_partici(Integer.parseInt(rs.getString(9)));
				pro.setProject_admin(rs.getString(10));
				pro.setProject_bookmark(rs.getString(11));
				
				ArrayList<Project_User> user_parti = getParticipants(rs.getInt(2));
				pro.setProject_parti(user_parti);
				pro.setProject_admin_img(rs.getString("user_img"));
				list.add(pro);
				
			}
			dead_list = getDeadLineProjects(page,limit);
			list.addAll(dead_list);

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getProjectList() : 에러발생" + ex);
		} finally {
			all_close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	private ArrayList<Project_User> getParticipants(int pro_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Project_User> list = null;
		
		String participants_Sql = "SELECT P.USER_ID, U.USER_NAME, U.USER_IMG FROM PROJECT_USER P "
								+ "INNER JOIN USER_INFO U "
								+ "ON P.USER_ID = U.USER_ID "
								+ "WHERE PROJECT_NUM = ? ";
	
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(participants_Sql);
			pstmt.setInt(1, pro_num);
		
			rs = pstmt.executeQuery();
			list = new ArrayList<Project_User>();
			while(rs.next()) {
				Project_User user = new Project_User();
				user.setUSER_ID(rs.getString(1));
				user.setUSER_NAME(rs.getString(2));
				user.setUSER_IMG(rs.getString(3));
				
				list.add(user);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getProjectList() : 에러발생" + ex);
		} finally {
			all_close(rs, pstmt, conn);
		}
		
		return list;
	}





	public Project getDetailProject() {
		return null;
	}
	
	public int insert(Project p) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
			
		try {
			con = ds.getConnection();
			System.out.println("getConnection : insert()");
			
			pstmt = con.prepareStatement(
					"INSERT INTO PROJECT (PROJECT_NUM, PROJECT_NAME, PROJECT_PROG, PROJECT_ADMIN, PROJECT_START, "
					+ "					PROJECT_END, PROJECT_PRIORITY, PROJECT_PARTI) "
					+"VALUES (PROJECT_SEQ.NEXTVAL, ?,?,?,?,?,?,?)");
			
			
			pstmt.setString(1, p.getProject_name());
			pstmt.setInt(2, p.getProject_prog());
			pstmt.setString(3, p.getProject_admin());
			pstmt.setString(4, p.getProject_start());
			pstmt.setString(5, p.getProject_end());
			pstmt.setString(6, p.getProject_priority());
			pstmt.setInt(7, p.getProject_partici());
			result = pstmt.executeUpdate();//삽입 성공시 result는 1
			
			//primary key 제약조건 위반했을 경우 발생하는 에러
			}catch(java.sql.SQLIntegrityConstraintViolationException e) {
				result = -1;
				System.out.println("DAO:primary key 제약조건 위반.");
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
