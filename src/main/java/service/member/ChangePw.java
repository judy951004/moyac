package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class ChangePw implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pw = request.getParameter("password");
		String id = request.getParameter("id");
		
		Member member = new Member();
		member.setPassword(pw);
		member.setId(id);
		
		MemberDao md = MemberDao.getInstance();
		int result = md.updatePw(member);
		request.setAttribute("result", result);
		
		return "changePw";
	}

}
