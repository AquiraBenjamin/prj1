package customer.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import costomer.dao.NoticeDao;
import costomer.vo.Notice;
import customer.controller.Controller;

public class NoticeRegController implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("NoticeRegController");
		
		request.getRequestDispatcher("noticeReg.jsp").forward(request, response);
		

	}
	
}
