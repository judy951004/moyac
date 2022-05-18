package service.reply;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.ReplyLikesDao;
import dao.Reply_eventDao;
import model.Member;
import model.Reply_event;
import service.CommandProcess;

public class ReplyList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String idSession = (String) session.getAttribute("id");
		int boardno = Integer.parseInt(request.getParameter("boardno"));

		Reply_eventDao rd = Reply_eventDao.getInstance();
		Reply_event reply_event = new Reply_event();
		reply_event.setBoardno(boardno);

		
		
		//닉네임을 얻어오기위해
		MemberDao md = MemberDao.getInstance();
		List<Reply_event> list = rd.select(reply_event);
		for(Reply_event reply: list) {
			Member member = md.select(reply.getId());
			reply.setNick_name(member.getNick_name());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd E a HH:mm:ss");
			String reg_date = simpleDateFormat.format(reply.getReg_date());
			request.setAttribute("reg_date", reg_date);
			/*-----------댓글 추천유무 구현-----------------*/
			int reply_no = reply.getReply_no();
			ReplyLikesDao rld = ReplyLikesDao.getInstance();
			int replylike = rld.select(idSession, reply_no);
			if (replylike > 0) { // 좋아요 한 게시글이면
				reply.setLikesConfirm(1); 

			} else if (replylike == 0) { // 좋아요 한 게시글이 아니면
				reply.setLikesConfirm(0);;
			}
			/*-----------댓글 추천유무 구현 끝-----------------*/
		}
		int pageNum= Integer.parseInt(request.getParameter("pageNum"));
		
		
		request.setAttribute("pageNum",pageNum); 
		
		request.setAttribute("list", list);
		return "replyList";
	}

}
