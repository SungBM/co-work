package net.board.notice.db;

public class NoticeBean {
	private int		notice_num;			//글번호
	private	String	notice_title;		//글 제목
	private	String	notice_reg_date;	//작성일
	private	String	notice_content;		//글 내용
	private	String	notice_file;		//첨부될 파일의이름
	private int		notice_readcount;	//글의 조회수
	private	String	user_id;			//글 작성자
	private int cnt;
	public int getnotice_num() {
		return notice_num;
	}
	public void setnotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getnotice_title() {
		return notice_title;
	}
	public void setnotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getnotice_reg_date() {
		return notice_reg_date;
	}
	public void setnotice_reg_date(String notice_reg_date) {
		this.notice_reg_date = notice_reg_date.substring(0,10);//년-월-일 시:분:초 => 년-월-일
	}
	public String getnotice_content() {
		return notice_content;
	}
	public void setnotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getnotice_file() {
		return notice_file;
	}
	public void setnotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public int getnotice_readcount() {
		return notice_readcount;
	}
	public void setnotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
		
}