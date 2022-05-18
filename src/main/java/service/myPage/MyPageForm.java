package service.myPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_QnA_Dao;
import dao.BookmarkDao;
import dao.MemberDao;
import dao.Reply_eventDao;
import model.Board_QnA;
import model.Bookmark;
import model.Member;
import model.Reply_event;
import service.CommandProcess;

public class MyPageForm implements CommandProcess {
	

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String deleteConfirm = request.getParameter("deleteConfirm");
		System.out.println(deleteConfirm);
		String id = (String) session.getAttribute("id");
		if(deleteConfirm == null || deleteConfirm == "") { System.out.println("dd");	}
		else {
			int me_no = Integer.parseInt(request.getParameter("me_no"));
			BookmarkDao bd = BookmarkDao.getInstance();
			bd.delete(id, me_no);
			int result = 1;
			request.setAttribute("result",result);
			System.out.println(result);
		}
		
		if (session.getAttribute("id") != null) {

			// 로그인 한 회원 정보 가져오기
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(id);

//			내가 쓴 QnA 
			Board_QnA_Dao bd = Board_QnA_Dao.getInstance();
			int total = bd.getTotalMyQnA(id); // 총 게시글 수

			List<Board_QnA> list = bd.myQnAList(id); 

			request.setAttribute("member", member);
			request.setAttribute("list", list);
			request.setAttribute("total", total);
			
//			내가 쓴 이벤트 댓글
			Reply_eventDao rd = Reply_eventDao.getInstance();

			int total1 = rd.getTotalMyReply(id); // 총 게시글 수

			List<Reply_event> list1 = rd.myReplyList(id);

			request.setAttribute("list1", list1);
			request.setAttribute("total1", total1);
			
//			즐겨찾기 목록
			BookmarkDao bmd = BookmarkDao.getInstance();
			
			int total2 = bmd.getTotalMyBookmark(id);
			List<Bookmark> list2 = bmd.myBookmarkList(id); 
			
			request.setAttribute("list2", list2);
			request.setAttribute("total2", total2); 
		}
		return "myPageForm";
	}
}
