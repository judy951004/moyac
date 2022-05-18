package service.medicine;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import dao.MedicineDao;
import dao.QnALikesDao;
import model.Medicine;
import service.CommandProcess;

public class Medicine_Info implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String me_no = request.getParameter("me_no");
		String pageNum = request.getParameter("pageNum");
		String search = request.getParameter("search");
		String shape = request.getParameter("shape");
		String color = request.getParameter("color");
		String formulation = request.getParameter("formulation");
		String adminConfirm = request.getParameter("adminConfirm");
		String bookmarkConfirm = request.getParameter("bookmarkConfirm");
		
		if(bookmarkConfirm != null || bookmarkConfirm != "") {
			request.setAttribute("bookmarkConfirm", bookmarkConfirm);
		}
		
		if(adminConfirm != null || adminConfirm != "") {
			request.setAttribute("adminConfirm", adminConfirm);
		}
		
		if(search != null || search != "") {
			request.setAttribute("search", search);
		}
		
		BookmarkDao bd = BookmarkDao.getInstance();
		String imgSrc = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id"); 
			int me_noInt = Integer.parseInt(me_no); 
			int bookmark = bd.select(id, me_noInt);
			if (bookmark > 0) { // 북마크 한 약품이면
				imgSrc = "../../images/bookmark_on.png";

			} else if (bookmark == 0) { // 북마크 한 약품이 아니면
				imgSrc = "../../images/bookmark_off.png";
			}
		}
		
		
		MedicineDao md = MedicineDao.getInstance();
		Medicine medicine = md.select(me_no);	
		request.setAttribute("imgSrc",imgSrc);
		request.setAttribute("medicine", medicine);
		request.setAttribute("shape", shape);
		request.setAttribute("color", color);
		request.setAttribute("formulation", formulation);
		request.setAttribute("pageNum", pageNum);
		return "medicine_info";
		
	}
	
}
