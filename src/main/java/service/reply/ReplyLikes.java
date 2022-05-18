package service.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_QnA_Dao;
import dao.QnALikesDao;
import dao.ReplyLikesDao;
import dao.Reply_eventDao;
import model.Board_QnA;
import model.Reply_event;
import service.CommandProcess;

public class ReplyLikes implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
				HttpSession session = request.getSession();
				String id = (String) session.getAttribute("id");
				int reply_no = Integer.parseInt(request.getParameter("reply_no"));
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				
				ReplyLikesDao rld =  ReplyLikesDao.getInstance();
				int replylikes = rld.select(id, reply_no);
				
				Reply_eventDao rd = Reply_eventDao.getInstance();
				int result = 0;
				if (replylikes == 0) { // 회원이 추천을 하지 않았다면
					rld.insert(id, reply_no); 
					rd.likesPlus(reply_no); // likes + 1
					result = 1;
				}
				if (replylikes != 0) { // 회원이 추천을 했다면
					rld.delete(id, reply_no); 
					rd.likesMinus(reply_no); // likes - 1
				}
				
				// Reply_event 테이블의 현재 likes 조회
				Reply_event reply_event = rd.select2(reply_no);
				int boardno = reply_event.getBoardno();
				System.out.println(pageNum);
				request.setAttribute("reply_no", reply_no);
				request.setAttribute("pageNum",pageNum);
				request.setAttribute("boardno",boardno);
				request.setAttribute("result",result);
				return "replyLikes";
			}

}
