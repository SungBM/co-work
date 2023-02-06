package net.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.admin.db.CompanyDAO;

public class CompanyupdateProcess implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String realFolder = "";

		// webapp아래에 꼭 폴더 생성하세요
		String saveFolder = "image";
		int fileSize = 5 * 1024 * 1024;
		// 실제 저장 경로 지정
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);
		System.out.println("realFolder = [" + realFolder);
		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "utf-8",
					new DefaultFileRenamePolicy());
			HttpSession session = request.getSession();

			String value = multi.getParameter("value");
			String change = multi.getParameter(value);
			String id = (String) session.getAttribute("id");

			// 수정 버튼 클릭 할 때 진행.
			CompanyDAO cdao = new CompanyDAO();
			int result = cdao.update(value, change, id);
			response.setContentType("text/html;charset=utf-8");
			System.out.println(result);
			PrintWriter out = response.getWriter();
			
			if (result == 1) {
				out.println("<script>");
				out.println("alert('" + dc(value) + " 수정되었습니다.');");
				out.println("location.href='index2.jsp'");
			} else {
				out.println("alert('회원정보 수정에 실패했습니다.');");
				out.println("history.back()");
			}
			out.println("</script>");
			out.close();
			return null;
			// 삽입이 된 경우

		} catch (IOException ex) {
			ex.printStackTrace();
			ActionForward forward = new ActionForward();
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "프로필 사진 업로드 실패입니다.");
			forward.setRedirect(false);
			return forward;
		} // catch end
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
