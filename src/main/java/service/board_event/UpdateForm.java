package service.board_event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_eventDao;
import model.Board_event;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		Board_eventDao bd = Board_eventDao.getInstance();
		Board_event board_event = bd.select(boardno);
		
		request.setAttribute("id", id);		
		request.setAttribute("board_event", board_event);
		request.setAttribute("pageNum", pageNum);
		
		return "updateForm";
	}

}
