<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar-test.jsp"/>
	
	<div class="memberInput" align="center">
        <form action="" id="memberInfo">
            <table class="input-table">
            	<tr>
            		<td>아이디</td>
            	</tr>
                <tr>
                    <td>${loginUser.memberId }</td>
                </tr>
                <tr>
                	<td>핸드폰번호</td>
                </tr>
                <tr>
                	<td>${loginUser.phone}</td>
                </tr>
                <tr>
                	<td>이메일</td>
                </tr>
                <tr>
                    <td>${loginUser.email}</td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>