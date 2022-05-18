package service.board_event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_eventDao;
import dao.MedicineDao;
import service.CommandProcess;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int boardno = Integer.parseInt(request.getParameter("board_no"));
		String pageNum = request.getParameter("pageNum");

		Board_eventDao bd = Board_eventDao.getInstance();
		int result = bd.delete(boardno);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		request.setAttribute("boardno", boardno);
		
		return "delete";
	}
}
