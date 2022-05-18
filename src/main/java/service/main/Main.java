package service.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandProcess;

public class Main implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String nick_name_session = (String)session.getAttribute("nick_name_session");
		request.setAttribute("id", id);
		request.setAttribute("nick_name_session", nick_name_session);
		
		
		return "moyac_main";
	}

}
