package net.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mypage.db.Dept;
import net.mypage.db.Job;
import net.mypage.db.MypageDAO;

public class DeptJobUpdateProcess implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		MypageDAO mydao = new MypageDAO();
		Dept d = new Dept();
		Job j = new Job();
		System.out.println(request.getParameter("value"));
		System.out.println(request.getParameter("dept_name"));

		// 글 내용을 불러와서 boarddata객체에 저장합니다.

		// 글 내용 불러오기 실패한 경우입니다.
//		if (boarddata == null) {
//			System.out.println("(수정)상세보기 실패");
//			forward = new ActionForward();
//			forward.setRedirect(false);
//			request.setAttribute("message", "게시판 수정 상세 보기 실패입니다.");
//			forward.setPath("error/error.jsp");
//			return forward;
//		}

		// 수정 폼 페이지로 이동할 때 원문 글 내용을 보여주기 때문에 boarddata 객체를
		// request 객체에 저장합니다.
//		request.setAttribute("boarddata", boarddata);
		forward.setRedirect(false);
		// 글 수정 폼 페이지로 이동하기 위해 경로를 설정하빈다.
		forward.setPath("admin/company/companyinfo.jsp");
		return forward;
	}
}