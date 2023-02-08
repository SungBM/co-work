package net.member.action;

import java.io.IOException;
import java.sql.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class send implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "alfoclsrn9");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		Authenticator auth = new MyAuthentication();
		
		Session session = Session.getDefaultInstance(props, auth);
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			
			InternetAddress from = new InternetAddress("보내는 사람");
			
			msg.setFrom(from);
			
			String email = request.getParameter("receiver");
			
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			msg.setSubject("비밀번호 인증번호", "utf-8");
			
			String code = request.getParameter("code_check");
			
			request.setAttribute("code", code);
			msg.setText(code, "utf-8");
			
			msg.setHeader("content-Type", "text/html");
			
			javax.mail.Transport.send(msg);
			System.out.println("보내짐");
		}catch(AddressException addr_e) {
			addr_e.printStackTrace();
		}catch(MessagingException msg_e) {
			msg_e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("인증번호확인하는페이지");
		rd.forward(request, response);
	}
	
	class MyAuthentication extends Authenticator{
		
		PasswordAuthentication pa;
		
		public MyAuthentication() {
			
			String id = "dabin2807";
			String pw = "ekqlsgyqls25#";
			
			pa = new PasswordAuthentication(id, pw);
		}
		
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}

}
