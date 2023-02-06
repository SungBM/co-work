package net.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.UserDAO;

public class MemberLoginProcessAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		ActionForward forward = new ActionForward();
		String USER_ID = request.getParameter("id");
		String USER_PASSWORD = request.getParameter("pass");
		UserDAO mdao = new UserDAO();
		int result = mdao.isId(USER_ID, USER_PASSWORD);
		System.out.println("결과는 " + result);
		
		//로그인 성공
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", USER_ID);
			
			String IDStore = request.getParameter("remember-check");
			Cookie cookie = new Cookie("id", USER_ID);
			
			//아이디 기억하기를 체크한 경우
			if(IDStore != null && IDStore.equals("store")) {
				//cookie.setMaxAge(60*60*24); 쿠키의 유효시간 24시간으로 설정
				cookie.setMaxAge(2*60);
				//클라이언트로 쿠키값을 전송합니다.
				response.addCookie(cookie);
				System.out.println("쿠키확인");
			}else {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			forward.setRedirect(true);
			forward.setPath("co_work/index2.jsp");  //메인 페이지로 이동
			return forward;
		} else {
			String message = "비밀번호가 일치하지 않습니다.";
			if(result == -1)
				message = "아이디가 존재하지 않습니다.";
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("location.href='login.net';");
			out.println("</script>");
			out.close();
			return null;
		}
	}
}
