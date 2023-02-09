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
		UserDAO udao = new UserDAO();

		List<UserInfo> list = null;
		list = udao.all_member_info();

		request.setAttribute("list", list);
		forward.setRedirect(false);
		forward.setPath("main/index2.jsp");
		return forward;

	}
}
