<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/header.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/style.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/sidebar.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/video.css">
</head>
<meta charset="UTF-8">
<title>Quokka Player</title>
<style>
body{
    margin: 0;
    color: white;
    padding-top: 80px;
    padding-left: 250px;
    padding-right: 20px;
    font-family: 'Noto Sans KR', sans-serif;
    background-size: cover;
    background-repeat: no-repeat;
}
</style>
<body>
	
	 <header class="header">

        <div class="left-section">
                <img class= "hamburger-menu" src="<%=contextPath %>/resources/icon/shuffle.png" alt="메뉴"/>
                <img class= "hamburger-menu" src="<%=contextPath %>/resources/icon/left.png" alt="메뉴"/>
                <img class= "hamburger-menu" src="<%=contextPath %>/resources/icon/play.png" alt="메뉴"/>
                <img class= "hamburger-menu" src="<%=contextPath %>/resources/icon/right.png" alt="메뉴"/>
                <img class= "hamburger-menu" src="<%=contextPath %>/resources/icon/repeat.png" alt="메뉴"/>
        </div>

        <div class="middle-section">
            <!-- <div class="search-button">
                <img class="search-icon" src="assets/images/thumbnails/temp.jpg">
                <div class="tooltip">검색</div>
            </div> -->

            <div class="search-bar">
                <img class="search-icon" src="<%=contextPath %>/resources/images/temp.jpg">
            </div>

  
            <button class="voice-search-button">
                <img class="voice-search-icon" src="<%=contextPath %>/resources/icon/vol.png">
                <div class="tooltip">음성으로 검색</div>
            </button>
        </div>


        <div class="right-section">
            <div class="notifications-icon-container">
             
            </div>
            <!-- <img class="current-user-picture" src="assets/images/avatars/avatar-1.png"> -->
            <button class="btn-login">로그아웃</button>
        </div>
    </header>



    <nav class="sidebar">

        <div class="top-section" style="margin-top: 20px;">
                <img class= "logo" style="margin-bottom: 10px;" src="<%=contextPath %>/resources/images/logo.png" alt="로고"/> 
                
                
                <div class="Member-profile">
                    <ul class="detail-profile">
                        <li>'관리자'님</li>
                        <li>
                            <button style="background: rgb(58, 36, 14);
                                           color: white;
                                           border-radius: 20px;
                                           margin-top: 5px;
                                           border-style: none;
                                           cursor: pointer;
                                           font-size: 15px;">노래관리</button>
                        </li>
                        <li>
                            <button style="background: rgb(58, 36, 14);
                                           color: white;
                                           border-radius: 20px;
                                           margin-top: 5px;
                                           border-style: none;
                                           cursor: pointer;
                                           font-size: 15px;">회원관리</button>
                        </li>
                    </ul>
                </div>
        </div>
    </nav>


</body>
</html>