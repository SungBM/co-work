package net.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.db.CompanyDAO;

public class CompanycreateProcess implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String value = request.getParameter("value");
		String change = request.getParameter(value);

		// 수정 버튼 클릭 할 때 진행.
		CompanyDAO cdao = new CompanyDAO();
		int result = cdao.create(id, value, change);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
//
		if (result == 1) {
			out.println("<script>");
			out.println("alert('" + dc(value) + " 생성 되었습니다.');");
			out.println("location.href='index2.jsp'");
		} else {
			out.println("alert('회원정보 수정에 실패했습니다.');");
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();
		return null;
		// 삽입이 된 경우
	} // execute end

	public String dc(String value) {
		String v1 = "";
		switch (value) {
		case "company_name":
			v1 = "회사명";
			break;
		case "company_url":
			v1 = "회사 전용 URL";
			break;
		case "company_logo":
			v1 = "로고";
			break;
		}
		return v1;
	}
}
