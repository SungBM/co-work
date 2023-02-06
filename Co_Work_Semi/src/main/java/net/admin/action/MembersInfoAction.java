package net.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mypage.db.Member;
import net.mypage.db.MypageDAO;

public class MembersInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		MypageDAO mydao = new MypageDAO();

		List<Member> list = null;
		list = mydao.all_member_info();

		request.setAttribute("list", list);
		forward.setRedirect(false);
		forward.setPath("admin/members/membersinfo.jsp");
		return forward;

	}
}
