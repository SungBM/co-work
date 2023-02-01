package net.mypage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String user_id = request.getParameter("user_id");
		MypageDAO mydao = new MypageDAO();
		Member m = mydao.member_info(user_id);
		
		if(m == null) {
			forward.setPath("error/error.jsp");
			forward.setRedirect(false);
			request.setAttribute("message", "아이디에 해당하는 정보가 없습니다.");
			return forward;
		}
		System.out.println(m.getUser_id());
		
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		request.setAttribute("memberinfo", m);
		return forward;
	}
}