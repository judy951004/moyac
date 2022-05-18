package service.board_QnA;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_QnA_Dao;
import dao.MemberDao;
import model.Board_QnA;
import model.Member;
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
		Board_QnA board_QnA = new Board_QnA();

		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		String subject = request.getParameter("subject");
		//id = request.getParameter("id");
		String content = request.getParameter("content");

		board_QnA.setBoardno(boardno);
		board_QnA.setSubject(subject);
		//board_QnA.setId(id);
		board_QnA.setContent(content);
		
		Board_QnA_Dao bd = Board_QnA_Dao.getInstance();
		int result  = bd.update(board_QnA);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "update";
	}

}
