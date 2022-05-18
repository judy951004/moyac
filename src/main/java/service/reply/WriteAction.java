package service.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_eventDao;
import dao.Reply_eventDao;
import model.Board_event;
import model.Reply_event;
import service.CommandProcess;

public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String idSession = (String) session.getAttribute("id");
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		String reply_content = request.getParameter("reply_content");
		Board_eventDao bd = Board_eventDao.getInstance();

		Reply_event reply_event = new Reply_event();
		reply_event.setContent(reply_content);
		reply_event.setId(idSession);
		reply_event.setBoardno(boardno);

		Reply_eventDao rd = Reply_eventDao.getInstance();
		int result = rd.insert(reply_event);
		
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boardno", boardno);
		return "write";
	}

}
