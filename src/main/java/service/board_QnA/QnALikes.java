package service.board_QnA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_QnA_Dao;
import dao.QnALikesDao;
import model.Board_QnA;
import service.CommandProcess;

public class QnALikes implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
				// 세션으로 로그인한 id 가져오기
				HttpSession session = request.getSession();
				String id = (String) session.getAttribute("id");

				// 게시판 boardno 받아오기
				int boardno = Integer.parseInt(request.getParameter("boardno"));
			
				// 회원이 좋아요한 게시글 있는지 조회
				QnALikesDao qld = QnALikesDao.getInstance();
				int qnalikes = qld.select(id, boardno);
				
				// 보내줄 변수 생성
				String imgSrc = "";
				int likes = 0;

				// likes 변경하기 위해 객체 추가
				Board_QnA_Dao bd = Board_QnA_Dao.getInstance();
				
				if (qnalikes > 0) { // 좋아요 한 게시글이 있으면
					qld.delete(id, boardno); // eventlikes 테이블에서 데이터 삭제 
					bd.likesMinus(boardno); // likes - 1
					imgSrc = "../../images/empty_heart.png";

				} else if (qnalikes == 0) { // 좋아요 한 게시글이 없으면
					qld.insert(id, boardno); // eventlikes 테이블에 데이터 추가
					bd.likesPlus(boardno); // likes + 1
					imgSrc = "../../images/heart.png";
				}			
				
				// Board_QnA 테이블의 현재 likes 조회
				Board_QnA board_QnA = bd.select(boardno);
				likes = board_QnA.getLikes();
				
				request.setAttribute("likes", likes);
				request.setAttribute("imgSrc", imgSrc);

				return "qnALikes";
			}

}
