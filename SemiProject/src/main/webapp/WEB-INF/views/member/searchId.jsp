<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchMember</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <link rel="stylesheet" href="<%=contextPath %>/resources/css/member/member.css">
</head>
<body>
	<jsp:include page="../common/menubar-test.jsp"/>
    <div class="memberInput" align="center">
    	<h1 style="color: black;" align="center">아이디 찾기</h1>
        <br><br>
        <form action="searchId.me" id="memberInfo">
            <table class="input-table">
                <tr>
                    <td>핸드폰 번호</td>
                    <td><input type="text" id="phone" name="phone" required></td>
                </tr>
                <tr>
                    <td> 이메일 </td>
                    <td><input type="text" id="email" name="email" required></td>
                </tr>
            </table>
            <br><br>
            <button type="submit" id="btn-member">아이디찾기</button>
        </form>
    </div>
</body>
</html>