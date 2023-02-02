package net.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String USER_ID = "";
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("USER_ID")) {
					USER_ID=cookies[i].getValue();
				}
			}
		}
		
		request.setAttribute("id", USER_ID); 			//전달되어온 리퀘스트에 셋어트리븉로 담음
		ActionForward forward=new ActionForward();  
		forward.setRedirect(false);					//request가 계속 살아있어야 된다.=주소변경없이 JSP페이지로 이동=디스패쳐방식이다.
		forward.setPath("co_work/loginForm.jsp"); 	//이동할 곳
		return forward;								//이 정보를 담아서 리턴.
	}
}