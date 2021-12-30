<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>jstl1.jsp</h2>

<%-- <c:forTokens items="name1,name1,name1,name1,name1" delims=",">
loop <br />
</c:forTokens> --%>

<%-- <c:forTokens var="name" items="name1,name2,name3,name4,name5" delims=",">
${name } <br />
</c:forTokens> --%>

<%-- <c:forTokens var="name" items="name1,name2,name3,name4,name5" delims="," varStatus="st">
index:${st.index } <br />
current:${st.current } <br />
count:${st.count } <br />
first:${st.first } <br />
last:${st.last } <br />
begin:${st.begin } <br />
end:${st.end } <br />
step:${st.step } <br />
<hr />
</c:forTokens> --%>

<%-- <c:forTokens var="name" items="name1,name2,name3,name4,name5" delims="," 
begin="1" end="3" step="2"  varStatus="st">
index:${st.index } <br />
current:${st.current } <br />
count:${st.count } <br />
first:${st.first } <br />
last:${st.last } <br />
begin:${st.begin } <br />
end:${st.end } <br />
step:${st.step } <br />
<hr />
</c:forTokens> --%>

<%-- <c:forTokens var="name" items="name1/20,name2/21,name3/22,name4/23,name5/24" delims=",/" 
  varStatus="st">
index:${st.index } <br />
current:${st.current } <br />
count:${st.count } <br />
first:${st.first } <br />
last:${st.last } <br />
begin:${st.begin } <br />
end:${st.end } <br />
step:${st.step } <br />
<hr />
</c:forTokens> --%>

<c:forTokens var="name" items="name1/20,name2/21,name3/22,name4/23,name5/24" delims=",/" 
 step="2" varStatus="st">
index:${st.index } <br />
current:${st.current } <br />
count:${st.count } <br />
first:${st.first } <br />
last:${st.last } <br />
begin:${st.begin } <br />
end:${st.end } <br />
step:${st.step } <br />
<hr />
</c:forTokens>

</body>
</html>