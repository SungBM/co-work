<%-- ������ ����� smtp ���� �ּҸ� ������ ���̹��� "���̵�@naver.com"���� �մϴ�. --%>
<%@ page import="net.member.action.Myinfo" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.Properties" %>

<%-- �ڹ� ���� API�� ����ϱ� ���� ���� ��Ű���� import�մϴ�. --%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%	//���� ���⿡�ٰ� ����־ ������. �ڹٿ��� jsp�ƴ�
	request.setCharacterEncoding("utf-8");  
	String sender=request.getParameter("sender");  //�� ����
	String receiver=request.getParameter("receiver"); //ȸ������ �̸���. @���� �� �ٿ���
	String subject=request.getParameter("subject"); //�̸��� ����
	String content=request.getParameter("content"); // �̸��� ������ȣ�� + �����߻��� ��
	/*
	JavaMail�� ����Ͽ� �̸����� �����ϱ� ���� 3���� ������ ������ �����ϴ�.
	1. ȣ��Ʈ�̸�, ����ڸ�, ��й�ȣ ��� ���� ȣ��Ʈ�� ��� ������ �����ϴ� Session ��ü�� ����ϴ�.
	2. �޽����� �����մϴ�.
	3. �޽����� �����ϴ�.
	*/
	//SMTP ���� �ּҸ� �����մϴ�.
	String server = "smtp.naver.com";
	int port=587;
	try{
		//���� ������ Properties ��ü�� �����մϴ�.
		Properties properties = new Properties();
		
		//SMTP ���� ���� ����
		//���̹��� ��� smtp.naver.com
		properties.put("mail.smtp.host", server);
		properties.put("mail.smtp.port", port);
		/*
		���� ������ ���� ������ �߻��� ��� �Ʒ� ������ �߰��մϴ�.
		javax.mail.authenticationfailedexception 220 ready to start tls
		properties.put("mail.smtp.ssl.trust", "smtp.naver.com");
		*/
		
		//SSL(Secure Sockets Layer)�� ���� TLS(���� ���� ����-Transport Layer Security)��
		//��Ʈ��ũ�� ���� ���۵� �� �������� ������ �������� ���� ��ȣȭ ���������Դϴ�
		//���� ���ۿ� ���Ǵ� ���������� TLSv1.2�� �����մϴ�.
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		//������ Properties��ü�� ������ ������ �ν��Ͻ��� �����մϴ�.
		//public static Session getInstance(Properties props)
		//Session Ŭ������ ������� �̸�, ��ȣ, ���� ������ ����
		//���� ������ �̿��ϴµ� �ʿ��� �̸��� ���� ������ �����մϴ�.
		Session s = Session.getInstance(properties);
		
		//������ ���ϰ� �޴� �ּҸ� �����մϴ�.
		Address sender_address=new InternetAddress(sender);
		Address receiver_address=new InternetAddress(receiver);
		
		//������ ������ ���� ������ �Է��ϱ� ���� Message��ü�� �����մϴ�.
		Message message = new MimeMessage(s);
		
		//������ ������ ������ �ѱ��� ��� ������ �ʵ��� content-type�� �����մϴ�.
		message.setHeader("content-type", "text/html;charset=euc-kr");
		
		//������ ���� �ּ� ������ �����մϴ�.
		message.setFrom(sender_address);
		
		//�޴� ���� �ּ� ������ �����մϴ�.
		//Message.RecipientType�� Message Ŭ�������� ����ϴ� ������ ������ �����մϴ�.
		//Message.RecipientType.TO : �޴� ����� �ǹ��մϴ�.
		message.addRecipient(Message.RecipientType.TO, receiver_address);
		
		//���� ������ �����մϴ�.
		message.setSubject(subject);
		
		//������ ������ �����մϴ�.
		message.setContent(content, "text/html;charset=euc-kr");
		
		//������ ��¥�� �����մϴ�.
		message.setSentDate(new java.util.Date());
		
		//public Transport getTransport(String protocol) throws NoSuchProviderException
		//������ ��������(smtp)�� �����ϴ� Transport ��ü�� �����ɴϴ�.
		//������ �����ϴ� Ŭ���� �Դϴ�.
		Transport transport=s.getTransport("smtp");
		
		//ù��° ���ڴ� ������ ȣ��Ʈ �Դϴ�.
		//�ι�° ���ڴ� ���̵�, ����° ���ڴ� ��й�ȣ�� �ǹ��մϴ�.
		transport.connect(server, Myinfo.naverid, Myinfo.naverpass);
		
		//getAllRecipients() : �޽����� ��� ������ �ּҸ� �����ɴϴ�.
		//������ �ּ� ������� �޽����� �����ϴ�.
		transport.sendMessage(message, message.getAllRecipients());
		
		//������ �����մϴ�.
		transport.close();
		
		out.println("<h3>������ ���������� ���۵Ǿ����ϴ�.</h3>");
	}catch(Exception e){
		out.println("SMTP ������ �߸� �����Ǿ��ų�, ���񽺿� ������ �ֽ��ϴ�.");
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>