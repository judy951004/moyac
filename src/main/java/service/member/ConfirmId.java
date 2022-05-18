package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class ConfirmId implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String msg="";
		MemberDao md = MemberDao.getInstance();
		Member member = md.select2(id);
		if (member==null) {
			msg="1";
		}
		else {
			msg = "0";
		}
		request.setAttribute("msg", msg);
		System.out.println("msg = "+msg);
		return "confirmId";
	}

}