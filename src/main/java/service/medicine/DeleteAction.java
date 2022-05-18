package service.medicine;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_eventDao;
import dao.MedicineDao;
import service.CommandProcess;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int me_no = Integer.parseInt(request.getParameter("me_no"));
		String pageNum = request.getParameter("pageNum");
		String search = request.getParameter("search");
		String color = request.getParameter("color");
		String shape = request.getParameter("shape");
		String formulation = request.getParameter("formulation");
		if(search != null || search != "") {
			request.setAttribute("search", search);
		}
		if(color != null || color != "" || shape != null || shape != "" || formulation != null || formulation != "") {
			request.setAttribute("color", color);
			request.setAttribute("shape", shape);
			request.setAttribute("formulation", formulation);
		}
		MedicineDao md = MedicineDao.getInstance();
		int result = md.delete(me_no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "delete";
	}

}
