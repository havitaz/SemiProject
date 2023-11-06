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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <link rel="stylesheet" href="<%=contextPath %>/resources/css/member/member.css">
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="memberInput" align="center">
    	<h1 style="color: black;" align="center">비밀번호찾기</h1>
        <br><br>
        <form id="memberInfo">
            <table class="input-table">
                <tr>
                    <td>
                        아이디
                    </td>
                    <td>
                        <input type="text" id="memberId">
                    </td>
                </tr>
                <tr>
                    <td>
                        핸드폰 번호
                    </td>
                    <td>
                        <input type="text" id="phone">
                    </td>
                </tr>
                <tr>
                    <td>
                        이메일
                    </td>
                    <td>
                        <input type="text" id="email">
                    </td>
                </tr>
            </table>
            <br><br>
            <button type="submit" id="btn-member">비밀번호찾기</button>
        </form>
    </div>
</body>
</html>