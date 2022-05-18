package service.myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String idSession = (String) session.getAttribute("id");
		MemberDao md = MemberDao.getInstance();

		// 관리자는 탈퇴할 일반회원 아이디
		int result = 0;
		if (idSession.equals("admin")) {
			String id = request.getParameter("id");
			result = md.delete(id);
		} else {
			if (idSession != null) {
				String id = (String) session.getAttribute("id");
				result = md.delete(id);
				if (result > 0)
					session.invalidate();
			}
		}
		request.setAttribute("idSession", idSession);
		request.setAttribute("result", result);
		return "delete";
	}

}
