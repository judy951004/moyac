package service.board_notice;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_noticeDao;
import dao.MemberDao;
import dao.NoticeLikesDao;
import model.Board_notice;
import model.Member;
import service.CommandProcess;

public class Content implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		Board_noticeDao bd = Board_noticeDao.getInstance();
		bd.read_cntUpdate(boardno); // 조회수 증가
		Board_notice board_notice = bd.select(boardno);
		id = board_notice.getId();

		MemberDao md = MemberDao.getInstance();
		Member member = md.select2(id);
		String nick_name = member.getNick_name();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd E a HH:mm:ss");
		String reg_date = simpleDateFormat.format(board_notice.getReg_date());
		
		// noticelikes에 회원이 좋아요한 게시글 있는지 조회
		NoticeLikesDao nld = NoticeLikesDao.getInstance();
		String imgSrc = "";
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			int noticelikes = nld.select(id, boardno);
			if (noticelikes > 0) { // 좋아요 한 게시글이면
				imgSrc = "../../images/heart.png";

			} else if (noticelikes == 0) { // 좋아요 한 게시글이 아니면
				imgSrc = "../../images/empty_heart.png";
			}
		}

		request.setAttribute("id", id);
		request.setAttribute("nick_name", nick_name);
		request.setAttribute("board_notice", board_notice);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("imgSrc", imgSrc);
		request.setAttribute("reg_date",reg_date);
		return "content";
	}

}
