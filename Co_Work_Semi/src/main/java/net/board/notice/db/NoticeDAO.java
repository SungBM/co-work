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
		
		String board_list_sql = "select * "
							+ " from (select rownum rnum, j.* "
							+ " 	  from (select board.*, nvl(cnt,0) cnt "
							+ " 			from board left outer join (select comment_board_num,count(*) cnt"
							+ "											from comm"
							+ "											group by comment_board_num)"
							+ "				on board_num=comment_board_num"
							+ "				order by BOARD_RE_REF desc,"
							+ "				BOARD_RE_SEQ asc) j "
							+ "		  where rownum<= ? "
							+ "		  ) "
							+ " where rnum>=? and rnum<=?";
		
		List<NoticeBean> list = new ArrayList<NoticeBean>();
		// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
		int startrow = (page - 1) * limit + 1;	// 읽기 시작할 row 번호(1  11 21 31 ...
		int endrow = startrow + limit - 1;		// 읽을 마지막 row 번호(10 20 30 40 ...
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, endrow);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				NoticeBean notice = new NoticeBean();
				notice.setNotice_num(rs.getInt("Notice_NUM"));
				notice.setNotice_name(rs.getString("Notice_NAME"));
				notice.setNotice_subject(rs.getString("Notice_SUBJECT"));
				notice.setNotice_content(rs.getString("Notice_CONTENT"));
				notice.setNotice_file(rs.getString("Notice_FILE"));
				notice.setNotice_re_ref(rs.getInt("Notice_RE_REF"));
				notice.setNotice_re_lev(rs.getInt("Notice_RE_LEV"));
				notice.setNotice_re_seq(rs.getInt("Notice_RE_SEQ"));
				notice.setNotice_readcount(rs.getInt("Notice_READCOUNT"));
				notice.setNotice_date(rs.getString("Notice_DATE"));
				notice.setCnt(rs.getInt("cnt"));
				list.add(notice); // 값을 담은 객체를 리스트에 저장합니다.
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getBoardList() 에러: " + ex) ;
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
	
	
}
