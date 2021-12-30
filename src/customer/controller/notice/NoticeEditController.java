package customer.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import costomer.dao.NoticeDao;
import costomer.vo.Notice;
import customer.controller.Controller;

public class NoticeEditController implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("NoticeEditController");
		String seq=request.getParameter("c");
		//System.out.println("seq : "+seq);
		NoticeDao dao=new NoticeDao();
		Notice n=dao.getNotice(seq);
		//System.out.println("content : "+n.getContent());
		
		//save notice to request
				request.setAttribute("n", n);
				//sending to noticeDetail.jsp and forward the request
				request.getRequestDispatcher("noticeEdit.jsp").forward(request, response);
		

	}
	
}
