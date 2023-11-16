<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String contextPath = request.getContextPath();
    	
    	String alertMsg = (String)session.getAttribute("alertMsg"); 
    %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/header.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/style.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/sidebar.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/video.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<meta charset="UTF-8">
<title>Quokka Player</title>
<style>
body{
    margin: 0;
    color: white;
    padding-top: 80px;
    padding-left: 310px;
    padding-right: 20px;
    font-family: 'Noto Sans KR', sans-serif;
    background-image: url("<%=contextPath %>/resources/images/background.png");
    background-size: cover;
    background-repeat: no-repeat;
    background-color: rgb(255, 252, 227);

}

</style>
<body>
	<% if(alertMsg != null) { %>
		<script>
			alert("<%=alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>

	 <header class="header">

        <div class="left-section">
                <img class= "player-menu" src="<%=contextPath %>/resources/icon/menubarIcon/shuffle.png" alt="메뉴"/>
                <img class= "player-menu" src="<%=contextPath %>/resources/icon/menubarIcon/left.png" alt="메뉴"/>
                <img class= "player-menu" src="<%=contextPath %>/resources/icon/menubarIcon/play.png" alt="메뉴"/>
                <img class= "player-menu" src="<%=contextPath %>/resources/icon/menubarIcon/right.png" alt="메뉴"/>
                <img class= "player-menu" src="<%=contextPath %>/resources/icon/menubarIcon/repeat.png" alt="메뉴"/>
        </div>

        <div class="middle-section">
        
        
            <div class="player-bar"> 
                <img class="album-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 

                <div class="flex-item time">
                    0:8
                </div>       
                                
                <div class="flex-item mp_info"> 
               		 제목 - 가수
                </div>  
                                 
                <div  class="flex-item time align">
                    14:48
                </div>
                
            </div>
            
            
            
        </div>

        <div class="right-section">
            <div class="notifications-icon-container">    
            </div>
            <button class="btn-login" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
        </div>
    </header>


    <nav class="sidebar">    

        <div class="top-section">
                <img class= "logo" src="<%=contextPath %>/resources/images/logo.png" alt="로고"/>               
                <div class="Member-profile">
                    <ul class="detail-profile">
                        <li>ooo님</li>
                    </ul>
                </div>
        </div>

    </nav>


     <!-- loginModal -->
     <div class="modal" id="loginModal" style="color: black;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header-->
                <div class="modal-header">
                        <h4>
                        Quokka Player
                        <br>
                        Login
                        </h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body" align="center">
                <form action="login.me" method="post">
                    <table>
                        <tr>
                            <td>아이디</td>
                            <td><input type="text" name="memberId" required placeholder="아이디를 입력해주세요"></td>
                        </tr>
                        <tr>
                            <td>
                                비밀번호
                            </td>
                            <td><input type="password" name="memberPwd" required placeholder="비밀번호를 입력해주세요"></td>
                        </tr>
                        <tr colspan="2" align="center">
                          <td>
                            <button type="submit">로그인</button>
                          </td>
                        </tr>
                    </table>
                </form>
                </div>

                <!-- Modal footer -->
                <a href="">아이디찾기</a>
                <a href="">비밀번호찾기</a>
                <a href="">회원가입</a>
                <button class="btn-serachId" data-bs-toggle="modal" data-bs-target="#searchId">아이디찾기</a>
                <button class="btn-searchPwd" data-bs-toggle="modal" data-bs-target="#searchPwd">비밀번호찾기</a>
                <button class="btn-insertMember" data-bs-toggle="modal" data-bs-target="#insertMember">회원가입</a>
            </div>
        </div>
    </div>

     <!-- 아이디찾기modal -->
     <div class="modal" id="searchId">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header-->
                <div class="modal-header">
                    <div>
                        <h4>아이디 찾기</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="">
                        <table>

                        </table>
                    </form>
                    이메일<input type="text" name="email">
                    전화번호<input type=" text" name="phone">
                </div>

                <!-- Modal footer -->
                <button>아이디찾기</button>
            </div>
        </div>
    </div>

     <!-- 비밀번호 찾기 모달 -->
     <div class="modal" id="searchPwd">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header-->
                <div class="modal-header">
                    <div>
                        <h4>비밀번호 찾기</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="">
                        <table>
                            <tr>
                                <td>
                                    아이디<input type="text" name="MemberId">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    이메일<input type="text" name="email">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    전화번호<input type="text" name="phone">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>

                <!-- Modal footer -->
                <button type="submit">비밀번호 찾기</button>
            </div>
        </div>
    </div>

     <!-- loginModal -->
     <div class="modal" id="insertMember">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header-->
                <div class="modal-header">
                    <div>
                        <h4>회원가입</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="">
                        <table>
                            <tr>
                                <td>
                                    아이디<input type="text" name="MemberId">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    비밀번호<input type="password" name="MemberPwd">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    전화번호<input type="text" name="phone">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    이메일<input type="text" name="email">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>

                <!-- Modal footer -->
                <button type="submit">회원가입</button>
            </div>
        </div>
    </div>
</body>
</html>