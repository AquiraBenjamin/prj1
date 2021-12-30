<%@page import="costomer.dao.NoticeDao"%>
<%@page import="costomer.vo.Notice"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>noticeEditProc.jsp</h3>
<%
// gets the values via noticeEdit which got the values from dao and sendRedirect to the notice.jsp depending on the success of update
request.setCharacterEncoding("utf-8");


String seq=request.getParameter("c");
String title=request.getParameter("title");
String content=request.getParameter("content");

//put the values above on Notice object
Notice n=new Notice();
n.setSeq(seq);
n.setTitle(title);
n.setContent(content);

NoticeDao dao=new NoticeDao();
//int af=dao.update(n);

//sending by variable
int af=dao.update2(seq,title,content);

if(af>0)
	response.sendRedirect("noticeDetail.jsp?c="+seq);
else
	out.write("fix error");



%>

</body>
</html>