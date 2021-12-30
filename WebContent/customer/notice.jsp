<%@page import="costomer.vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function clearVal(){
	var inputVal=document.getElementById("q");
	inputVal.value='';
}

</script>
</head>
<body>
<h3>Notice.jsp</h3>

<form action="notice.do" method="get">
	<select name="f" >
		<option ${param.f=="title"?"selected":"" } value="title">title</option>
		<option ${param.f=="content"?"selected":"" } value="content">content</option>
	</select>
	<input type="text" name="q" value="${query }" id="q" onclick="clearVal();" />
	<input type="submit" value="search" />


</form>

<table width="500" border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
<%

/* List<Notice> list=(List<Notice>)request.getAttribute("list");
for(Notice n:list){
	pageContext.setAttribute("n", n); */

%>
<c:forEach items="${list }" var="n">
	<tr>
		<td>${n.seq }</td>
		<td><a href="noticeDetail.do?c=${n.seq }">${n.title }</a></td>
		<td>${n.writer }</td>
		<td>${n.regdate }</td>
		<td>${n.hit }</td>
	</tr>
	
</c:forEach>

   


	
</table>

<a href="noticeReg.do">write</a>

</body>
</html>
