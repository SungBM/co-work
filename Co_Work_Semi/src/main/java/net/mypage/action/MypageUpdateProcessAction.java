package net.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MypageUpdateProcessAction implements Action {

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
			String id = multi.getParameter("user_id");
			String name = multi.getParameter("user_name");
			String dept = multi.getParameter("user_dept");
			String job = multi.getParameter("user_job");
			String email = multi.getParameter("user_email");
			String fax = multi.getParameter("user_fax");
			String phone = multi.getParameter("user_phone");
			String intro = multi.getParameter("user_intro");

			String img = multi.getFilesystemName("user_img");
			String card = multi.getFilesystemName("user_card");
			System.out.println("USER_IMG = " + img);
			System.out.println("USER_CARD = " + card);
			Member m = new Member();
			
			m.setUser_id(id);
			m.setUser_name(name);
			m.setUser_dept(dept);
			m.setUser_job(job);
			m.setUser_email(email);
			m.setUser_fax(fax);
			m.setUser_phone(phone);
			m.setUser_intro(intro);
			m.setUser_img(img);
			m.setUser_card(card);

			System.out.println(multi.getParameter("check"));
			if (img != null) {
				m.setUser_img(img);
			} else if (multi.getParameter("check") != "") {
				m.setUser_img(multi.getParameter("check"));
			}

			MypageDAO mydao = new MypageDAO();
			int result = mydao.update(m);

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			// 삽입이 된 경우
			if (result == 1) {
				out.println("alert('수정되었습니다.');");
				out.println("location.href='index2.jsp';");
			} else {
				out.println("alert('회원정보 수정에 실패했습니다.');");
				out.println("history.back()");
			}
			out.println("</script>");
			out.close();
			return null;
		} catch (IOException ex) {
			ex.printStackTrace();
			ActionForward forward = new ActionForward();
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "프로필 사진 업로드 실패입니다.");
			forward.setRedirect(false);
			return forward;
		} // catch end
	} // execute end
}
