package service.board_event;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_eventDao;
import dao.EventLikesDao;
import dao.MemberDao;
import dao.ReplyLikesDao;
import dao.Reply_eventDao;
import model.Board_event;
import model.Member;
import model.Reply_event;
import service.CommandProcess;

public class Content implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNumber = request.getParameter("pageNum");
		Board_eventDao bd = Board_eventDao.getInstance();
		bd.read_cntUpdate(boardno); // 조회수 증가
		Board_event board_event = bd.select(boardno);
		String id = board_event.getId();
		if(pageNumber == null || pageNumber.equals("")) {
			pageNumber = "1";	
		}
		int pageNum = Integer.parseInt(pageNumber);
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select2(id);
		String nick_name = member.getNick_name();
		

		/* --------댓글 수정 구현 -------- */
		String update_content =request.getParameter("update_content");
		if (update_content != "" && update_content != null) {
			int reply_no = Integer.parseInt(request.getParameter("reply_no"));
			Reply_event reply_event_update = new Reply_event();

			reply_event_update.setContent(update_content);
			reply_event_update.setReply_no(reply_no);

			Reply_eventDao rd = Reply_eventDao.getInstance();
			rd.update(reply_event_update);
		}	
		/*-----------댓글 수정 구현 끝-----------------*/
		/* --------댓글 삭제 구현 -------- */
		String delete= request.getParameter("delete");
		if(delete != "" && delete != null) {
			int reply_no = Integer.parseInt(request.getParameter("reply_no"));
			Reply_eventDao rd = Reply_eventDao.getInstance();
			rd.delete(reply_no);
		}
		/*-----------댓글 삭제 구현 끝-----------------*/
		/*-----------이 회원이 이 게시판에 좋아요를 했는지 확인-----------------*/
		EventLikesDao eld = EventLikesDao.getInstance();
		String imgSrc = "";
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			int eventlikes = eld.select(id, boardno);
			if (eventlikes > 0) { // 좋아요 한 게시글이면
				imgSrc = "../../images/heart.png";

			} else if (eventlikes == 0) { // 좋아요 한 게시글이 아니면
				imgSrc = "../../images/empty_heart.png";
			}
		}
		/*-----------이 회원이 이 게시판에 좋아요를 했는지 확인끝-----------------*/
		
		/* 날짜 보기좋게 변경 */
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd E a HH:mm:ss");
		String reg_date = simpleDateFormat.format(board_event.getReg_date());
		/* 날짜 보기좋게 변경 */

		
		request.setAttribute("reg_date", reg_date);
		request.setAttribute("id", id);
		request.setAttribute("boardno", boardno);
		request.setAttribute("nick_name", nick_name);
		request.setAttribute("board_event", board_event);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("imgSrc", imgSrc);
		

		return "content";
	}

}
