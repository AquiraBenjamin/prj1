package customer.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import costomer.dao.NoticeDao;
import costomer.vo.Notice;
import customer.controller.Controller;

public class NoticeDelProcController implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("NoticeDelProcController");
		
		request.setCharacterEncoding("utf-8");
		
		String seq=request.getParameter("c");
		
		NoticeDao dao=new NoticeDao();
		int del=dao.delete(seq);
		
		response.sendRedirect("notice.jsp");
		

	}
	
}
