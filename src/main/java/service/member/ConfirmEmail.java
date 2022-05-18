package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class ConfirmEmail implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String msg="";
		MemberDao md = MemberDao.getInstance();
		Member member = md.selectEmail(email);
		if(member==null) msg="1";
		else msg = "0";
		request.setAttribute("msg", msg);
		return "confirmEmail";
	}

}
