<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
 <% 
    String contextPath = request.getContextPath();
 
 	String alertMsg = (String)session.getAttribute("alertMsg");
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
<% if(alertMsg != null) { %>
		<script>
			alert("<%=alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
    <div class="memberInput" align="center">
    	<p class="h1-style" style="color: black;" align="center">비밀번호찾기</p>
    	<button type="button" class="btn-close" onclick="closeMenu()"></button>
        <br><br>
        <form action="searchPwd.me" id="memberInfo">

            <div class="inputGroup-table">
               <p class="p-style2">아이디</p>
               <input class="input-table" type="text" id="memberId" name="memberId" placeholder="내용을 입력해주세요">
               <p class="p-style2">핸드폰 번호</p>
               <input class="input-table" type="text" id="phone" name="phone" placeholder="내용을 입력해주세요">
               <p class="p-style2">이메일</p>
               <input class="input-table" type="text" id="email" name="email" placeholder="내용을 입력해주세요">
               <img class="memberIcon" src="<%=contextPath%>/resources/images/login.jpg" style="position: absolute; right: 25px; bottom: 0px;" />
            <br><br>
            <button type="submit" id="btn-member">비밀번호찾기</button>
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