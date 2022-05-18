package service.member;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class FindPw implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = "moyamoyacJ4@gmail.com";//@@
        String pw = "!@#$qwerQ";//@@
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", 465); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		String userId = request.getParameter("id");
		String email = request.getParameter("email");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.findPassword(userId, email);
		
		Random r = new Random();
		int num = r.nextInt(999999);	//랜덤 난수 생성
		
		if(member != null) {
			String setfrom = "moyamoyacJ4@gmail.com";
			String tomail = member.getEmail();
			String title = "[모야모약] 비밀번호 변경 인증 이메일 입니다.";
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
			+ "모먀모약 비밀번호 변경 인증번호는 " + num + " 입니다." + System.getProperty("line.separator");
			
			
			Session session = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(id, pw);
				}
			});
	        try {
	        	MimeMessage msg = new MimeMessage(session);
	        	msg.setFrom(new InternetAddress(setfrom));
	        	msg.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
	        	msg.setSubject(title);
	        	msg.setText(content);
	        	
	        	Transport.send(msg);
	        	System.out.println("message sent successfully..");
	        } catch (AddressException e) {
	            e.printStackTrace();
	        } catch (MessagingException e) {
	        	e.printStackTrace();
	        }
		}
		request.setAttribute("num", num);
		request.setAttribute("member", member);
		System.out.println(member);
		return "findPw";
	}

}
