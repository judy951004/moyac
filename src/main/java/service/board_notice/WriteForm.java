package service.board_notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandProcess;

public class WriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int boardno=0;
		String pageNum = request.getParameter("pageNum");
		boardno = Integer.parseInt(request.getParameter("boardno"));
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		request.setAttribute("id", id);
		request.setAttribute("boardno", boardno);
		request.setAttribute("pageNum", pageNum);
			
		return "writeForm";
	}

}
