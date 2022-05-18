package service.board_QnA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_QnA_Dao;
import model.Board_QnA;

import service.CommandProcess;

public class WriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int boardno=0, ref=0, re_level=0, re_step=0; // 답변글이 아니고 처음 쓰는 글
		String subject ="";
		String pageNum = request.getParameter("pageNum");
		boardno = Integer.parseInt(request.getParameter("boardno"));
		if (boardno != 0) {  // 답변글
			Board_QnA_Dao bd = Board_QnA_Dao.getInstance();
			Board_QnA board_QnA = bd.select(boardno);  // 지금 읽은글을 가져온다.(답변 대상)
			ref = board_QnA.getRef();            // 읽은글의 ref
			re_level = board_QnA.getRe_level();  //   "    re_level
			re_step  = board_QnA.getRe_step();   //   "    re_step
			subject = board_QnA.getSubject();
			request.setAttribute("subject", subject);
		}
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		request.setAttribute("id", id);
		request.setAttribute("boardno", boardno);
		request.setAttribute("ref", ref);
		request.setAttribute("re_level", re_level);
		request.setAttribute("re_step", re_step);
		request.setAttribute("pageNum", pageNum);
			
		return "writeForm";
	}

}
