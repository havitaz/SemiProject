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
<jsp:include page="../common/menubar-test.jsp"/>
<style>
body {
 		 	background: url(/SemiProject/resources/icon/menubarIcon/error.png) no-repeat center center fixed;
    		background-size: cover;
  }
 .error{
   top: 220px;
    left: 800px;
    position: absolute;
    color: #000000;
    font-weight: 600;
 }
  
</style>
</head>
<body>
	
	
	<h1 class="error" align="center" ><%=request.getAttribute("errorMsg")  %></h1>
</body>
</html>