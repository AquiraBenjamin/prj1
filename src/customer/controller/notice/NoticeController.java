package customer.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import costomer.dao.NoticeDao;
import costomer.vo.Notice;
import customer.controller.Controller;

public class NoticeController implements Controller{
	
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("NoticeController");
		//search
		String field=request.getParameter("f");
		System.out.println("field : "+field);
		if(field==null || field.equals(""))
			field="title";
		
		String query=request.getParameter("q");
		System.out.println("q : "+query);
		if(query==null || query.equals(""))
			query="";
		
		NoticeDao dao=new NoticeDao();
		List<Notice> list=dao.noticeSelAll(field,query);
		
		//saving List<Notice> on request
		request.setAttribute("list", list);
		request.setAttribute("query", query);
		request.getRequestDispatcher("notice.jsp").forward(request, response);
	}
	
}
