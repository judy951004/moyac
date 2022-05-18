package service.board_event;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_eventDao;
import model.Board_event;
import service.CommandProcess;

public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
		}
		Board_event board_event = new Board_event();		
		String pageNum = request.getParameter("pageNum");
		String subject = request.getParameter("subject");
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		
		Board_eventDao bd = Board_eventDao.getInstance();
		int boardno1 = bd.board_newno();
		board_event.setBoardno(boardno1);
		board_event.setSubject(subject);
		board_event.setId(id);
		board_event.setContent(content);
		
		int result = bd.insert(board_event);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "write";

	}

}
