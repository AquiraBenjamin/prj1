package customer.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import costomer.dao.NoticeDao;
import costomer.vo.Notice;
import customer.controller.Controller;

public class NoticeRegProcController implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("NoticeRegProcController");
		String title=request.getParameter("title");
		String content=request.getParameter("content");

		Notice n=new Notice();
		n.setTitle(title);
		n.setContent(content);
		
		NoticeDao dao=new NoticeDao();
		int af=dao.write(n);
		
		
		
		if(af>0) 
			response.sendRedirect("notice.jsp");
		 else 
			System.out.println("error");
		

	}
	
}
