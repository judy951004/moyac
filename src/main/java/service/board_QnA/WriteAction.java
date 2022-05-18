package service.board_QnA;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_QnA_Dao;
import model.Board_QnA;
import service.CommandProcess;

public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
		}
			
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		String pageNum = request.getParameter("pageNum");
		String subject = request.getParameter("subject");
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		
		Board_QnA_Dao bd = Board_QnA_Dao.getInstance();
		//제일 큰 boardno보다 1 큰 숫자 가져옴 
		int boardno1 = bd.board_newno();
		
		Board_QnA board_QnA = new Board_QnA();	
		board_QnA.setBoardno(boardno1);
		board_QnA.setRe_level(re_level);
		board_QnA.setRe_step(re_step);
		board_QnA.setSubject(subject);
		board_QnA.setId(id);
		board_QnA.setContent(content);
		
		if (boardno == 0) {
			//boardno == 0일때 즉 list에서 쓰는 글일 때 ref에 제일 큰 boardno보다 1 큰 숫자 가져옴 
			board_QnA.setRef(boardno1);	
		}else {
			//boardno == 0이 아닐 때 즉 답변글일 때 지금 쓴 글의 ref에 답변당할 글의 ref를 넣어준다
			board_QnA.setRef(ref);
			//답변 당할 글과 ref가 같은 글들 중, 게시판 상에서 답변당할 글 보다 아래에 있는 글은 re_step을 1올려주는 메소드(db를 건드린다)
			bd.replyupdate(board_QnA);
			//그 후 re_level을 답변당할 글보다 1 올린다
			//re_step도 답변당할 글보다 1올린다 그래야 그 아래 가니까 
			board_QnA.setRe_level(board_QnA.getRe_level()+1);
			board_QnA.setRe_step(board_QnA.getRe_step()+1);	
			
			Board_QnA board_QnA_origin = bd.select(boardno);
			board_QnA.setSubject(board_QnA_origin.getSubject() +" => "+ subject);
		}		
			
		int result = bd.insert(board_QnA);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "write";

	}

}
