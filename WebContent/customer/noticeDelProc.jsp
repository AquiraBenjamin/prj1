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
request.setCharacterEncoding("utf-8");
String seq=request.getParameter("c");
String title=request.getParameter("title");
String content=request.getParameter("content");

String sql="delete from notices where seq=?";

Class.forName("oracle.jdbc.driver.OracleDriver");

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url,user,pw);

//execute
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, seq);
pstmt.executeUpdate();

response.sendRedirect("notice.jsp");
%>

</body>
</html>