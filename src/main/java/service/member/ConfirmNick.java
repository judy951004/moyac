package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class ConfirmNick implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String nick_name = request.getParameter("nick_name");
		String msg="";
		MemberDao md = MemberDao.getInstance();
		Member member = md.selectNic(nick_name);
		if(member==null) msg="1";
		else msg = "0";
		request.setAttribute("msg", msg);
		System.out.println("msg = "+msg);
		return "confirmNick";
	}

}
