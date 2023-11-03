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
    padding-top: 80px;
    padding-left: 310px;
    padding-right: 20px;
    font-family: 'Noto Sans KR', sans-serif;
    background-image: url("<%=contextPath %>/resources/images/background.png");
    background-size: cover;
    background-repeat: no-repeat;
    background-color: rgb(255, 252, 227);

}
.createPlayList {
    justify-content: center;
  }
 
  ul{
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 5px;
    margin-inline-end: -25px;
    padding-inline-start: 40px;
}
  .addPlayList {
    width: 24px;
    height: 24px;
    cursor: pointer;
}

  .removePlayList {
    width: 15px;
    height: 15px;
    cursor: pointer;
}
.profile-button{
	width: auto;
    align-items: center;
    justify-content: center;
    display: flex;
    flex-direction: column;
    padding: unset;
    padding-left: 26px;
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
                    14:48
                </div>
            </div>
        </div>

        <div class="right-section">
            <div class="notifications-icon-container">    
            </div>
            <button class="btn-login">로그인</button>
        </div>

    </header>


    <nav class="sidebar">    

        <div class="top-section">
                <img class= "logo" src="<%=contextPath %>/resources/images/logo.png" alt="로고"/>               
                <div class="Member-profile">
	                <ul class="profileImg">
	                  <img class= "pro_admin" src="<%=contextPath %>/resources/images/admin.png" alt="로고"/>               
	                </ul>
                    <ul class="detail-profile">
                        <li>ooo님</li>
                        <li>010-xxxx-xxxx</li>
                        <li>a@naver.com</li>
                    </ul>
					<ul class="profile-button">
						<button class="a_button">회원관리</button>
						<button class="a_button">노래관리</button>
					</ul>
                </div>

        </div>
        
        
		<div class="playList" align="center">
			<div class="createPlayList">
				<h1>
					재생목록 생성
					<img class="addPlayList" src="<%=contextPath %>/resources/icon/TOP100Icon/add_icon.png" alt="메뉴"/>
				</h1>
			</div>
			
			
			<details>
			  <summary>
			  재생목록 N 					
			  <img class="removePlayList" src="<%=contextPath %>/resources/icon/TOP100Icon/minus.png" alt="메뉴"/>
			 </summary>
			  <!-- 반복문 -->
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			</details>
			
			<details>
			  <summary>
			  재생목록 N 					
			  <img class="removePlayList" src="<%=contextPath %>/resources/icon/TOP100Icon/minus.png" alt="메뉴"/>
			 </summary>
			  <!-- 반복문 -->
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			  <p>제목 가수 이름 등등</p>
			</details>
			
		</div>

    </nav>
</body>
</html>