<%@page import="java.sql.ResultSet"%>
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
<%
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pass=request.getParameter("password");

//db connection
Class.forName("oracle.jdbc.driver.OracleDriver");

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url,user,pw);

//execute
String sql="select pwd from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.executeQuery();

//comparing the pw from form you wrote and db and checking the existance of id
String ypass="";
int x=-1;
String msg="";
if(rs.next()){
	ypass=rs.getString("pwd");// password in datebase
	if(ypass.equals(pass)) //if the pw from both form and db matches
		x=1;//login succeed
	else
		x=0;//password incorrect : pw from form and db don't match
}else{
	x=-1;//no id
}
System.out.println("xxxxxxxx : "+x);
// changing the directory depending on the circumstance
if(x==1){
	session.setAttribute("sessionID", id);//sets an attribution to keep on loged in status
	msg="../mainForm.jsp";
}else if(x==0){
	msg="loginForm.jsp?msg=0";
}else{
	msg="loginForm.jsp?msg=-1";
}
response.sendRedirect(msg);


%>

</body>
</html>