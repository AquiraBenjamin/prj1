<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>jstl7_choose.jsp</h2>
<%
int ranNum=(int)(Math.random()*10);
String grade="a"+ranNum;
System.out.println("grade : "+grade);

%>
<c:set value="<%=grade %>" var="grade" ></c:set>
<c:choose>
	<c:when test="${grade=='a1' }">
		your grade is A1
	</c:when>
	<c:when test="${grade=='a2' }">
		your grade is A2
	</c:when>
	<c:when test="${grade=='a3' }">
		your grade is A3
	</c:when>
	<c:when test="${grade=='a4' }">
		your grade is A4
	</c:when>
	<c:otherwise>
	 	your grade is: etc
	</c:otherwise>
</c:choose>



</body>
</html>