package service.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MedicineDao;
import model.Medicine;
import service.CommandProcess;

public class FilterSearch implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MedicineDao md = MedicineDao.getInstance();
		String color = request.getParameter("color"); // 색깔별
		String shape = request.getParameter("shape"); // 모양별
		String formulation = request.getParameter("formulation"); // 제형별
		
		final int ROW_PER_PAGE = 10; // 한 페이지에 게시글 5개 씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지 씩

		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		 // 총 게시글 수
		int total = md.getTotal();
		
		int number = total - startRow + 1;
		
		if(color == "") color = null;
		if(shape == "") shape = null;
		if(formulation == "") formulation = null;
		
		List<Medicine> list = null;
		
		List<Medicine> list_total = null;
		if(color == null && shape == null && formulation == null) {
			list_total = md.listTotal(startRow, endRow);
			total = md.getTotal();
		}
		
		// 색깔만 조회
		List<Medicine> list_color = null;
		if(color != null && shape == null && formulation == null) {
			list_color = md.list_color(startRow, endRow, color);
			total = md.getTotalColor(color);
		}
		
		// 모양만 조회
		List<Medicine> list_shape = null;
		if(color == null && shape != null && formulation == null) {
			list_shape = md.list_shape(startRow, endRow, shape);
			total = md.getTotalShape(shape);
		}
		
		// 제형만 조회
		List<Medicine> list_formulation = null;
		if(color == null && shape == null && formulation != null) {
			list_formulation = md.list_formulation(startRow, endRow, formulation);
			total = md.getTotalFormulation(formulation);
		}
		
		// 색깔, 모양만 조회
		List<Medicine> list_colorShape = null;
		if(color != null && shape != null && formulation == null) {
			list_colorShape = md.list_colorShape(startRow, endRow, color, shape);
			total = md.getTotalColorShape(color, shape);
		}
		
		// 색깔, 제형만 조회
		List<Medicine> list_colorForm = null;
		if(color != null && shape == null && formulation != null) {
			list_colorForm = md.list_colorForm(startRow, endRow, color, formulation);
			total = md.getTotalColorForm(color, formulation);
		}
		
		// 모양, 제형만 조회
		List<Medicine> list_shapeForm = null;
		if(color == null && shape != null && formulation != null) {
			list_shapeForm = md.list_ShapeForm(startRow, endRow, shape, formulation);
			total = md.getTotalShapeForm(shape, formulation);
		}
		
		// 색깔, 모양, 제형 조회
		List<Medicine> list_filter = null;
		if(color != null && shape != null && formulation != null) {
			list_filter = md.list_All(startRow, endRow, color, shape, formulation);
			total = md.getTotalAll(color, shape, formulation);
		}
		
		if (list_total != null) list = list_total;
		if (list_color != null) list = list_color;
		if (list_shape != null) list = list_shape;
		if (list_formulation != null) list = list_formulation;
		if (list_colorShape != null) list = list_colorShape;
		if (list_colorForm != null) list = list_colorForm;
		if (list_shapeForm != null) list = list_shapeForm;
		if (list_filter != null) list = list_filter;
		
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수

		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지
		
		if (endPage > totalPage) endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
		
		
		request.setAttribute("color", color);
		request.setAttribute("shape", shape);
		request.setAttribute("formulation", formulation);
		request.setAttribute("list", list);
		request.setAttribute("number", number);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);

		return "filterSearch";
	}

}
