package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class AdminBoard implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "adminBoard";
	}

}
