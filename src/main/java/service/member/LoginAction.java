package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class LoginAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		String nick_name = null;
		int result = 0;
		// 암호가 다르다
		if (member == null || member.getDel().equals("y")) {
			result = -1;
		} // 없다
		else if (member.getPassword().equals(password)) {
			nick_name = member.getNick_name();
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("nick_name_session", nick_name);
			result = 1; // 일치)
		}

		request.setAttribute("result", result);
		return "login";
	}

}
