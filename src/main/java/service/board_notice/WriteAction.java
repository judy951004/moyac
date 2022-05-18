package service.board_notice;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_noticeDao;
import model.Board_notice;
import service.CommandProcess;

public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
		}
		Board_notice board_notice = new Board_notice();		
		String pageNum = request.getParameter("pageNum");
		String subject = request.getParameter("subject");
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		
		Board_noticeDao bd = Board_noticeDao.getInstance();
		int boardno1 = bd.board_newno();
		board_notice.setBoardno(boardno1);
		board_notice.setSubject(subject);
		board_notice.setId(id);
		board_notice.setContent(content);
		
		int result = bd.insert(board_notice);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "write";

	}

}
