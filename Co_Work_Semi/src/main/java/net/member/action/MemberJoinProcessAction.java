package net.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.Member;
import net.member.db.MemberDAO;

public class MemberJoinProcessAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String ID = request.getParameter("ID");
		String PASSWORD = request.getParameter("PASSWORD");
		String PASSWORD_CH = request.getParameter("PASSWORD_CH");
		String EMAIL = request.getParameter("EMAIL");
		int CODE = Integer.parseInt(request.getParameter("CODE"));
		String NAME = request.getParameter("NAME");
		
		Member m = new Member();
		m.setID(ID);				m.setPASSWORD(PASSWORD);		m.setPASSWORD_CH(PASSWORD_CH);
		m.setEMAIL(EMAIL);			m.setCODE(CODE);			m.setNAME(NAME);
		
		MemberDAO mdao = new MemberDAO();
		int result = mdao.insert(m);
		
		//result=0;
		if(result==0) {
			System.out.println("회원 가입 실패입니다.");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("massage", "회원가입 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(result == 1) { //삽입이 된 경우
			out.println("alert('회원 가입을 축하합니다.');");
			out.println("location.href='login.net';");
		}else if(result == -1) {
			out.println("alert('아이디가 중복되었습니다. 다시 입력하세요');");
			//새로고침되어 이전에 입력한 데이터가 나타나지 않습니다.
			//out.println("location.href='join.net';);
			out.println("history.back();");  // 비밀번호를 제외한 다른 데이터는 유지 되어 있습니다. 비밀번호는 type이 pass라 지워짐.
		}
		out.println("</script>");
		out.close();
		return null;  //getWriter로 응답 보내서 리턴 null
	}
}