<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
 <% 
    	String contextPath = request.getContextPath();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../common/menubar-test.jsp"/>
<link rel="stylesheet" href="<%=contextPath %>/resources/css/member/member.css">
</head>
<body>
	<div class="memberInput" align="center">
       <p class="h1-style" style="color: black;" align="center">마이페이지</p>
    	<button type="button" class="btn-close" onclick="closeMenu()"></button>
        <br><br>
        <form id="close-btn" action="enrollForm.me" method="post" id="memberInfo">
			 <div class="inputGroup-table">
            	<p class="p-style">아이디</p>
				<input class="input-table" type="text" id="memberId" name="memberId" value="${loginUser.memberId }" readonly>
				<p class="p-style">핸드폰번호</p>
				<input class="input-table" type="text" id="phone" name="phone" value="${loginUser.phone}" required>
				<p class="p-style">이메일</p>	
				<input class="input-table" type="text" id="email" name="email" value="${loginUser.email}" required>
				<img class="memberIcon" src="<%=contextPath%>/resources/images/login.jpg" style="position: absolute; right: 25px; bottom: 0px;" />
		</div>
		<div>
			<button type="submit" id="btn-member">수정하기</button>
		</div>
	   </form>
    </div>
    
    <script>
	    function closeMenu(){
        location.href="backPage.me"
      }
	</script>
    
</body>
</html>