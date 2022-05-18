package service.board_event;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_eventDao;
import dao.MemberDao;
import model.Board_event;
import model.Member;
import service.CommandProcess;

public class ListAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board_eventDao bd = Board_eventDao.getInstance();		
		final int ROW_PER_PAGE = 10; // 한페이지 당 10개의 데이터 
		final int PAGE_PER_BLOCK = 10; //한블럭에 10개의 페이지 
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		// 시작번호	(페이지번호 - 1) * 페이지당 갯수+ 1				
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		// 끝번호 	시작번호 + 페이지당개수 - 1			
		int endRow = startRow + ROW_PER_PAGE - 1;
		List<Board_event> list = bd.list(startRow, endRow); 
		//번호를 순서대로 하기 위해서 
		int total = bd.getTotal(); 		
		int number = total - startRow + 1; // 총개수에서부터 시작  
		// (double): 나눗셈 결과를 실수로 받기 위해서
		// ceil : 자기(실수)보다 큰 정수 (2.4면 3이 된다 )
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE); //총 페이지
		// 시작페이지 = 현재페이지-(현재페이지-1) % 블록당페이지수
		int startPage = currentPage - (currentPage-1) % PAGE_PER_BLOCK;
		//마지막페이지 = 시작페이지 + 블록당페이지수 -1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		MemberDao md = MemberDao.getInstance();
		//총페이지보다 큰 endPage는 나올 수 없다 
		if(endPage > totalPage) endPage = totalPage;
		
		for(Board_event board_event:list) {
			Member member = md.select2(board_event.getId());
			if(member != null)
				board_event.setNick_name(member.getNick_name());
			else System.out.println("id = "+board_event.getId());
		}
		
		request.setAttribute("list", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("number", number);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		
		return "list";
	}

}
