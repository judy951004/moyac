package service.board_QnA;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_QnA_Dao;
import dao.MemberDao;
import dao.QnALikesDao;
import dao.Reply_eventDao;
import model.Board_QnA;
import model.Member;
import model.Reply_event;
import service.CommandProcess;

public class Content implements CommandProcess {

	@SuppressWarnings("null")
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String idSession = (String) session.getAttribute("id");
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		Board_QnA_Dao bd = Board_QnA_Dao.getInstance();
		bd.read_cntUpdate(boardno); // 조회수 증가
		Board_QnA board_QnA = bd.select(boardno);
		String id = board_QnA.getId();

		MemberDao md = MemberDao.getInstance();
		Member member = md.select2(id);
		String nick_name = member.getNick_name();
		// 날짜형태 바꾸기
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd E a HH:mm:ss");
		String reg_date = simpleDateFormat.format(board_QnA.getReg_date());

		/*-----------이 회원이 이 게시판에 좋아요를 했는지 확인-----------------*/
		QnALikesDao qld = QnALikesDao.getInstance();
		String imgSrc = "";
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id"); 
			int qnalikes = qld.select(id, boardno);
			if (qnalikes > 0) { // 좋아요 한 게시글이면
				imgSrc = "../../images/heart.png";

			} else if (qnalikes == 0) { // 좋아요 한 게시글이 아니면
				imgSrc = "../../images/empty_heart.png";
			}
		}
		/*-----------좋아요 구현 끝-----------------*/
		
		
		
		request.setAttribute("id", id);
		request.setAttribute("reg_date", reg_date);
		request.setAttribute("nick_name", nick_name);
		request.setAttribute("board_QnA", board_QnA);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("imgSrc", imgSrc);
		
		return "content";
	}

}
