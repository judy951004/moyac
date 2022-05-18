package service.board_QnA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_QnA_Dao;
import service.CommandProcess;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");

		Board_QnA_Dao bd = Board_QnA_Dao.getInstance();
		int result = bd.delete(boardno);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		request.setAttribute("boardno", boardno);
		
		return "delete";
	}

}
