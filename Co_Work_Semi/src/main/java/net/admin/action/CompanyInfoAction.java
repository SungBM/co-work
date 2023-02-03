package net.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CompanyInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		String user_id = (String) session.getAttribute("user_id");
		String user_id = "HTA1";

		CompanyDAO mydao = new CompanyDAO();
		Company m = mydao.company_info(user_id);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("company/companyinfo.jsp");
		request.setAttribute("companyinfo", m);
		return forward;
	}

}
