package net.board.notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
	private DataSource ds;
	
	// 생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public NoticeDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	//검색하기(NoticeListAction)

	
	//글 갯수 구하기(NoticeListAction)
	public int getListCount() {
		Connection con = null;
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from Notice");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCount() 에러: " + ex);
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
		return x;
	}
	
	//글 목록(NoticeListAction)
	public List<NoticeBean> getNoticeList(int page, int limit){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// page : 페이지
		// limit : 페이지 당 목록의 수
		// board_re_ref desc, board_re_seq asc에 의해 정렬한 것을
		// 조건절에 맞는 rnum의 범위 만큼 가져오는 쿼리문입니다.
		
		String notice_list_sql = "select * "
							+ " from (select rownum rnum, j.* "
							+ " 	  from (select NOTICE.*, nvl(cnt,0) cnt "
							+ " 			from NOTICE left outer join (select COMM_NUM,count(*) cnt"
							+ "											from COMM"
							+ "											group by COMM_NUM)"
							+ "				on NOTICE_NUM=COMM_NUM"
							+ "				order by NOTICE_RE_REF desc,"
							+ "				NOTICE_RE_SEQ asc) j "
							+ "		  where rownum<= ? "
							+ "		  ) "
							+ " where rnum>=? and rnum<=?";
		
		List<NoticeBean> list = new ArrayList<NoticeBean>();
		// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
		int startrow = (page - 1) * limit + 1;	// 읽기 시작할 row 번호(1  11 21 31 ...
		int endrow = startrow + limit - 1;		// 읽을 마지막 row 번호(10 20 30 40 ...
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(notice_list_sql);
			pstmt.setInt(1, endrow);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				NoticeBean notice = new NoticeBean();
				notice.setNotice_num(rs.getInt("notice_num"));
				notice.setNotice_name(rs.getString("notice_name"));
				notice.setNotice_subject(rs.getString("notice_subject"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_file(rs.getString("notice_file"));
				notice.setNotice_re_ref(rs.getInt("notice_re_ref"));
				notice.setNotice_re_lev(rs.getInt("notice_re_lev"));
				notice.setNotice_re_seq(rs.getInt("notice_re_seq"));
				notice.setNotice_readcount(rs.getInt("notice_readcount"));
				notice.setNotice_reg_date(rs.getString("notice_reg_date"));
				notice.setCnt(rs.getInt("cnt"));
				list.add(notice); // 값을 담은 객체를 리스트에 저장합니다.
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getNoticeList() 에러: " + ex) ;
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
		return list;
	}// getBoardList()메서드 end

	public boolean noticeInsert(NoticeBean noticedata) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		try	{
			con = ds.getConnection();
			
			String max_sql = "(select nvl(max(notice_num),0)+1 from notice)";
			
			// 원문글의 NOTICE_RE_REF 필드는 자신의 글번호 입니다.
			String sql = "insert into notice "
						+ "(NOTICE_NUM,		NOTICE_NAME,		NOTICE_SUBJECT,"
						+ " NOTICE_CONTENT,	NOTICE_FILE,		NOTICE_RE_REF,"
						+ " NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_READCOUNT)"
						+ "values(" + max_sql + ",?,?,"
						+ "		  ?,?," +	max_sql + ","
						+ "		  ?,?,?)";
			
			// 새로운 글을 등록하는 부분입니다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, noticedata.getNotice_name());
			pstmt.setString(2, noticedata.getNotice_subject());
			pstmt.setString(3, noticedata.getNotice_content());
			pstmt.setString(4, noticedata.getNotice_file());
			
			// 원문의 경우 NOTICE_RE_LEV, NOTICE_RE_SEQ 필드 값은 0 입니다.
			pstmt.setInt(5, 0); // NOTICE_RE_LEV 필드
			pstmt.setInt(6, 0); // NOTICE_RE_SEQ 필드
			pstmt.setInt(7, 0); // NOTICE_READCOUNT 필드
			
			result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("데이터 삽입이 모두 완료되었습니다.");
				return true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("noticeInsert() 에러: " + ex);
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
		return false;
	}//	noticeInsert()메서드 end

	public void setReadCountUpdate(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "update notice "
				   + "set NOTICE_READCOUNT=NOTICE_READCOUNT+1 "
				   + "where NOTICE_NUM = ?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("setReadCountUpdate() 에러: " + ex) ;
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
	}

	public NoticeBean getDetail(int num) {
		NoticeBean notice = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from notice where NOTICE_NUM = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				notice = new NoticeBean();
				notice.setNotice_num(rs.getInt("NOTICE_NUM"));
				notice.setNotice_name(rs.getString("NOTICE_NAME"));
				notice.setNotice_subject(rs.getString("NOTICE_SUBJECT"));
				notice.setNotice_content(rs.getString("NOTICE_CONTENT"));
				notice.setNotice_file(rs.getString("NOTICE_FILE"));
				notice.setNotice_re_ref(rs.getInt("NOTICE_RE_REF"));
				notice.setNotice_re_lev(rs.getInt("NOTICE_RE_LEV"));
				notice.setNotice_re_seq(rs.getInt("NOTICE_RE_SEQ"));
				notice.setNotice_readcount(rs.getInt("NOTICE_READCOUNT"));
				notice.setNotice_reg_date(rs.getString("NOTICE_REG_DATE"));
			}
		} catch (Exception ex) {
			System.out.println("getDetail() 에러: " + ex) ;
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
		return notice;
	}// getDetail()메서드 end
	
	
	
}//CLASS END