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
    	<h1 style="color: black;" align="center">회원가입</h1>
        <br><br>
        <form action="insert.me" method="post" id="memberInfo">
            <table class="input-table">
                <tr>
                    <td>아이디</td>
                    <td><input type="text" id="memberId" name="memberId" required></td>
                    <td><button type="button" onclick="idCheck()">중복확인</button></td>
                </tr>
                <tr>
                    <td>비밀번호 </td>
                    <td><input type="password" id="memberPwd" name="memberPwd" required></td>
                </tr>
                <tr><td>핸드폰 번호</td>
                    <td><input type="text" id="phone" name="phone"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" id="email" name="email"></td>
                </tr>
            </table>
            <br><br>
            <button type="submit" id="btn-member">회원가입</button>
        </form>
    </div>
    
    <script>

            function idCheck() {
            	
                const idInput = document.querySelector("#memberInfo input[name=memberId]");
                console.log(idInput.value);

                $.ajax({
                    url: "idCheck.me",
                    data: {
                        "checkId" : idInput.value
                    },
                    success: function(result){
						if(result == "NNNNY" ) {
							if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")) {
								let submitBtn = document.querySelector("#memberInfo button[type=submit]");
								submitBtn.removeAttribute("disabled");
								
								idInput.setAttribute("readonly", true);
							} else {
								idInput.focus();
							}
						} else {
							alert("이미 존재하거나 탈퇴한 회원입니다.");
							idInput.focus();
						}
                    },
                    error: function(){
                        console.log("아이디 중복체크용 ajax통신실패");
                    }
                })
            }
        </script>
</body>
</html>