package customer.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import costomer.dao.NoticeDao;
import costomer.vo.Notice;
import customer.controller.Controller;

public class NoticeEditProcController implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("NoticeEditProcController");
		String seq=request.getParameter("c");
		String title=request.getParameter("title");
		String content=request.getParameter("content");

		Notice n=new Notice();
		n.setSeq(seq);
		n.setTitle(title);
		n.setContent(content);
		
		NoticeDao dao=new NoticeDao();
		int af=dao.update(n);
		
		//updated record on database with other details along with columns this controller didn't  receive from noticeEdit like writer
		n=dao.getNotice(seq);
		
		
		request.setAttribute("n", n);	
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
		

	}
	
}
