package net.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mypage.db.Dept;
import net.mypage.db.Job;
import net.mypage.db.Member;
import net.mypage.db.MypageDAO;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		ActionForward forward = new ActionForward();
		String user_id = request.getParameter("user_id");
		String user_password = request.getParameter("user_password");
		System.out.println(user_id);
		
		MypageDAO mydao = new MypageDAO();
		if (user_password != null) {
			int result = mydao.isId(user_id, user_password); // id, password 1차 확인
			if (result == 1) {
				Member m = mydao.member_info(user_id);
				List<Dept> d = mydao.dept("CO-WORK");
				List<Job> j = mydao.job("CO-WORK");

				request.setAttribute("memberinfo", m);
				request.setAttribute("dept", d);
				request.setAttribute("job", j);
				forward.setRedirect(false);
				forward.setPath("mypage/mypage.jsp");
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
		} else {
			Member m = mydao.isId(user_id);
			List<Dept> d = mydao.dept("CO-WORK");
			List<Job> j = mydao.job("CO-WORK");

			request.setAttribute("memberinfo", m);
			request.setAttribute("dept", d);
			request.setAttribute("job", j);
			forward.setRedirect(false);
			forward.setPath("mypage/mypage.jsp");
			return forward;
		}
	}
}