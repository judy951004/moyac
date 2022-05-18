package service.board_QnA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_QnA_Dao;
import model.Board_QnA;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		Board_QnA_Dao bd = Board_QnA_Dao.getInstance();
		Board_QnA board_QnA = bd.select(boardno);
		
		request.setAttribute("id", id);		
		request.setAttribute("board_QnA", board_QnA);
		request.setAttribute("pageNum", pageNum);
		
		return "updateForm";
	}

}
