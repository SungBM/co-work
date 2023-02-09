package net.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.db.Company;
import net.admin.db.CompanyDAO;
import net.mypage.db.Dept;
import net.mypage.db.Job;
import net.mypage.db.MypageDAO;

public class DeptJobUpdateProcess implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		ActionForward forward = new ActionForward();
		String value = request.getParameter("value");
		String change = request.getParameter(value);
		String def = request.getParameter("def");

		CompanyDAO mydao = new CompanyDAO();
		MypageDAO mdao = new MypageDAO();

		// 글 내용 불러오기 실패한 경우입니다.
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("id");
		Company m = mydao.company_info(user_id);
		mydao.dept_update(value, change, m.getCompany_name(), def);

		List<Dept> d = mdao.dept(m.getCompany_name());
		List<Job> j = mdao.job(m.getCompany_name());


		forward = new ActionForward();
		forward.setRedirect(true);
		request.setAttribute("companyinfo", m);
		request.setAttribute("dept", d);
		request.setAttribute("job", j);
		forward.setPath("companyinfo.com");
		return forward;
	}
}