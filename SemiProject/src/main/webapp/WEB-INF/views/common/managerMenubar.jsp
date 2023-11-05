<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/header.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/manager/style_manager.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/manager/sidebar_manager.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/video.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/manager/managermusic.css">
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

ul{
	 margin-inline-end: 5px;
}

</style>
<body>
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
                <div class="video-time">
                    <!-- 14:48 -->
                </div>
            </div>
        </div>

        <div class="right-section">
            <div class="notifications-icon-container">    
            </div>
            <button class="btn-login">로그아웃</button>
        </div>

    </header>


    <nav class="sidebar">

        <div class="top-section" style="margin-top: 20px;">
            <img class= "logo" style="margin-bottom: 10px;" src="<%=contextPath %>/resources/images/logo.png" alt="로고"/> 
                
                
                <div class="manager-profile" align="center">
                    <ul class="profileImg">
                        <img class= "pro_admin" src="<%=contextPath %>/resources/images/admin.png" alt="관리자"/>               
                      </ul>

                    <ul class="detail-profile">
                        <li>관리자 님</li>
                    </ul>
					<ul class="profile-button">
						<button class="music-btn">노래관리</button>
						<button class="member-btn">회원관리</button>
					</ul>
                </div>


        </div>
    </nav>
</body>
</html>