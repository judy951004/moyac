package service.board_notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_noticeDao;
import model.Board_notice;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		Board_noticeDao bd = Board_noticeDao.getInstance();
		Board_notice board_notice = bd.select(boardno);
		
		request.setAttribute("id", id);		
		request.setAttribute("board_notice", board_notice);
		request.setAttribute("pageNum", pageNum);
		
		return "updateForm";
	}

}
