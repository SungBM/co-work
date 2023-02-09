package net.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.admin.db.Company;
import net.admin.db.CompanyDAO;
import net.mypage.db.Dept;
import net.mypage.db.Job;
import net.mypage.db.Member;
import net.mypage.db.MypageDAO;

public class MypageUpdateProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();

		String value = request.getParameter("value");
		String change = request.getParameter("val3");
		String id = request.getParameter("user_id");
		CompanyDAO cdao = new CompanyDAO();

		if (value.equals("user_img") || value.equals("user_card")) {
			String realFolder = "";
			// webapp아래에 꼭 폴더 생성하세요
			String saveFolder = "image";
			int fileSize = 5 * 1024 * 1024;
			// 실제 저장 경로 지정
			ServletContext sc = request.getServletContext();
			realFolder = sc.getRealPath(saveFolder);
			System.out.println("realFolder = [" + realFolder + "]");
			try {
				MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "utf-8",
						new DefaultFileRenamePolicy());
				value = multi.getParameter("value");
				change = multi.getParameter(value);
				id = multi.getParameter("user_id");
				// 이미지 교체 진행

				if (change != null) {
					change = multi.getFilesystemName(value);

				} else if (multi.getParameter("check") != "") {
					change = multi.getFilesystemName("check");
				}

				MypageDAO mydao = new MypageDAO();
				int result = mydao.update(value, change, id);

				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();

				if (result == 1) {
					out.println("<script>");
					out.println("alert('" + dc(value) + " 수정되었습니다.');");
					out.println("location.href='index2.jsp';");
				} else {
					out.println("alert('회원정보 수정에 실패했습니다.');");
					out.println("history.back()");
				}
				out.println("</script>");
				out.close();
				return null;
			} catch (

			IOException ex) {
				ex.printStackTrace();
				forward = new ActionForward();
				forward.setPath("error/error.jsp");
				request.setAttribute("message", "프로필 사진 업로드 실패입니다.");
				forward.setRedirect(false);
				return forward;
			} // catch end
		} else {
			MypageDAO mydao = new MypageDAO();
			int result = mydao.update(value, change, id);

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();

			if (result == 1) {
				Member m = mydao.member_info(id);
				Company c = cdao.company_info(id);
				List<Dept> d = mydao.dept(c.getCompany_name());
				List<Job> j = mydao.job(c.getCompany_name());

				request.setAttribute("memberinfo", m);
				request.setAttribute("dept", d);
				request.setAttribute("job", j);
				forward.setRedirect(false);
				forward.setPath("mypage/mypage.jsp");
				return forward;

			} else {
				out.println("alert('회원정보 수정에 실패했습니다.');");
				out.println("history.back()");
			}
			out.println("</script>");
			out.close();
			return null;

		}
	} // execute end

	public String dc(String value) {
		String v1 = "";
		switch (value) {
		case "user_name":
			v1 = "이름";
			return v1;
		case "user_dept":
			v1 = "부서";
			return v1;
		case "user_job":
			v1 = "직함";
			return v1;
		case "user_email":
			v1 = "이메일 주소";
			return v1;
		case "user_fax":
			v1 = "팩스";
			return v1;
		case "user_phone":
			v1 = "연락처";
			return v1;
		case "user_intro":
			v1 = "자기소개";
			return v1;
		case "user_img":
			v1 = "프로필 사진";
			return v1;
		case "user_card":
			v1 = "명함";
			return v1;
		}
		return v1;
	}

}
