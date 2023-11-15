<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    	String contextPath = request.getContextPath();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar-test.jsp"/>
	
	<h1 align="center" style="color:red"><%=request.getAttribute("errorMsg")  %></h1>
</body>
</html>