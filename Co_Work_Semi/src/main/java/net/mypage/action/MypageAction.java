package net.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		ActionForward forward = new ActionForward();
//		String user_id = request.getParameter("user_id");
		String user_id = "HTA1";
		String user_password = request.getParameter("user_password");

		MypageDAO mydao = new MypageDAO();
		int result = mydao.isId(user_id, user_password); // id, password 1차 확인
		if (result == 1) {
			Member m = mydao.member_info(user_id);
//			HttpSession session = request.getSession();

			if (m == null) {
				forward.setPath("error/error.jsp");
				forward.setRedirect(false);
				request.setAttribute("message", "아이디에 해당하는 정보가 없습니다.");
				return forward;
			}
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 페이지로 이동합니다.');");
			out.println("</script>");
			forward.setPath("mypage.jsp");
			forward.setRedirect(false);
			request.setAttribute("memberinfo", m);
			return forward;
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.');");
			out.println("location.href='index2.jsp';");
			out.println("</script>");
			out.close();
			return null;
		}
	}
}