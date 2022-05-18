package service.medicine;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_QnA_Dao;
import dao.BookmarkDao;
import dao.QnALikesDao;
import model.Board_QnA;
import service.CommandProcess;

public class Bookmark implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		// 약품 me_no 가져옴
		int me_no = Integer.parseInt(request.getParameter("me_no"));
	
		// 회원이 북마크한 약품인지 조회
		BookmarkDao bd = BookmarkDao.getInstance();
		int bookmark = bd.select(id, me_no);
		
		String imgSrc ="";
		
		if (bookmark > 0) { // 북마크한 약품이면
			bd.delete(id, me_no); // bdlikes 테이블에서 데이터 삭제  
			imgSrc = "../../images/bookmark_off.png";

		} else if (bookmark == 0) { // 북마크한 약품이 아니면 
			bd.insert(id, me_no); // bookmark 테이블에 데이터 추가
			imgSrc = "../../images/bookmark_on.png";
		}			
		
		request.setAttribute("imgSrc", imgSrc);
		return "bookmark";
	}

}
