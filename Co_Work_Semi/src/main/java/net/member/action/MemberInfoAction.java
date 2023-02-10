package net.member.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.UserDAO;
import net.member.db.UserInfo;

public class MemberInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String USER_ID = request.getParameter("USER_ID");
		UserDAO udao = new UserDAO();
		UserInfo m = udao.userinfo(USER_ID);
		
		if(m==null) {
			forward.setPath("error/error.jsp");
			forward.setRedirect(false);
			request.setAttribute("message", "아이디에 해당하는 정보가 없습니다.");
			return forward;
		}

		forward.setPath("main/index2.jsp");
		forward.setRedirect(false);
		request.setAttribute("memberinfo", m);
		return forward;

	}
}
