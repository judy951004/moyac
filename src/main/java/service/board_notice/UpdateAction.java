package service.board_notice;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_noticeDao;
import model.Board_notice;
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
		Board_notice board_notice = new Board_notice();

		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		String subject = request.getParameter("subject");
		//id = request.getParameter("id");
		String content = request.getParameter("content");

		board_notice.setBoardno(boardno);
		board_notice.setSubject(subject);
		//board_notice.setId(id);
		board_notice.setContent(content);
		
		Board_noticeDao bd = Board_noticeDao.getInstance();
		int result  = bd.update(board_notice);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "update";
	}

}
