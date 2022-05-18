package service.board_event;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_eventDao;
import model.Board_event;
import service.CommandProcess;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//HttpSession session = request.getSession();
		//String id = (String) session.getAttribute("id");
		Board_event board_event = new Board_event();

		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		String subject = request.getParameter("subject");
		//id = request.getParameter("id");
		String content = request.getParameter("content");

		board_event.setBoardno(boardno);
		board_event.setSubject(subject);
		//board_event.setId(id);
		board_event.setContent(content);
		
		Board_eventDao bd = Board_eventDao.getInstance();
		int result  = bd.update(board_event);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "update";
	}

}
