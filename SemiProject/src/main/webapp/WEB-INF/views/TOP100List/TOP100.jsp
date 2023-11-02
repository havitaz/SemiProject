<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/mainheader.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/style.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/mainsidebar.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/video.css">
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
    background-image: url("<%=contextPath %>/resources/images/XXXX.png");
    background-size: cover;
    background-repeat: no-repeat;
}

</style>
<body>
	
<<<<<<< HEAD
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
                                
                
                <div class="video-time">
                    14:48
                </div>
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
            <button class="btn-login">로그인</button>
        </div>





    </header>



    <nav class="sidebar">


        
        <div class="top-section">
                <img class= "logo" src="<%=contextPath %>/resources/images/logo.png" alt="로고"/> 
                
                
                <div class="Member-profile">
                    <ul class="detail-profile">
                        <li>ooo님</li>
                        <li><a href="">마이페이지</a></li>
                        <li>aaa@naver.com</li>
                        <li>010-xxxx-xxxx</li>
                    </ul>
                </div>
        </div>



        <div>
            <ul class="playlist">
                <h3>재생목록</h3> <button type="menu">></button>
                <li></li>
            </ul>
        </div>



    </nav>




	 <main>
        <h1 class="main-title">지금 듣기</h1><br>

        



        <div>

        <section class="video-grid">

            <div class="video-preview">
                <div>
                    <iframe width="360" height="250" src="https://www.youtube.com/embed/MIbt_Yn_rdw?si=tUN--4rIUsdwL8n4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    <iframe width="360" height="250" src="https://www.youtube.com/embed/WbhK3wMXluE?si=VoVFHuxVVkT45X83" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    <iframe width="360" height="250" src="https://www.youtube.com/embed/L6-uJLteKek?si=8h3XxMeaBk3dIpwQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    <iframe width="360" height="250" src="https://www.youtube.com/embed/2fDzCWNS3ig?si=S4pcMem377qQq5pU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
                
            </div>



                
            
        </section>

        </div>





        <div class="music-grid">
            <div>
                <div class="top100part">
                <h1>쿼카 플레이어
                    <br>top 100
                </h1>
                <div class="top100info">
                    총 100곡!
                    <br><br><br>
                    플레이버튼
                </div>

            </div>
            </div>
            <div>
                <table>
                    <tr height="120">
                        <th><img class="thumbnail" src="<%=contextPath %>/resources/images/cp.jpg"/></th>
                        <td>Nine Tracks Mind Delux<br>Charlie Puth</td>
                    </tr>
                    <tr>
                        <th><img class="thumbnail" src="<%=contextPath %>/resources/images/cp.jpg"/></th>
                        <td>Nine Tracks Mind Delux<br>Charlie Puth</td>
                    </tr>
                    <tr>
                        <th><img class="thumbnail" src="<%=contextPath %>/resources/images/cp.jpg"/></th>
                        <td>Nine Tracks Mind Delux<br>Charlie Puth</td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <th><img class="thumbnail" src="<%=contextPath %>/resources/images/cp.jpg"/></th>
                        <td>Nine Tracks Mind Delux<br>Charlie Puth</td>
                    </tr>
                    <tr>
                        <th><img class="thumbnail" src="<%=contextPath %>/resources/images/cp.jpg"/></th>
                        <td>Nine Tracks Mind Delux<br>Charlie Puth</td>
                    </tr>
                    <tr>
                        <th><img class="thumbnail" src="<%=contextPath %>/resources/images/cp.jpg"/></th>
                        <td>Nine Tracks Mind Delux<br>Charlie Puth</td>
                    </tr>
                </table>
            </div>
        </div>

    </main>


=======
	<table id="top100">
		<thead>
			<tr height="60;">
				<th colspan="2" >(앨범커버)노래</th>
				<th width="17%">| 아티스트</th>
				<th width="17%">| 장르</th>
				<th width="6%">| 재생시간</th>
				<th width="6%">재생</th>
				<th width="6%">담기</th>
				<th width="6%">MV</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><img src="resources/icon/musicAlbumCover/LoveLee.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Love Lee</td>
				<td>악동뮤지션</td>
				<td>댄스, 포크/블루스</td>
				<td>03:00</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr>
				<td><img src="resources/icon/musicAlbumCover/LoveLee.jpg"></td>
				<td style="text-align: left;">Love Lee</td>
				<td>악동뮤지션</td>
				<td>댄스, 포크/블루스</td>
				<td>03:00</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr>
				<td><img src="resources/icon/musicAlbumCover/LoveLee.jpg"></td>
				<td style="text-align: left;">Love Lee</td>
				<td>악동뮤지션</td>
				<td>댄스, 포크/블루스</td>
				<td>03:00</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr>
				<td><img src="resources/icon/musicAlbumCover/LoveLee.jpg"></td>
				<td style="text-align: left;">Love Lee</td>
				<td>악동뮤지션</td>
				<td>댄스, 포크/블루스</td>
				<td>03:00</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
		</tbody>
	</table>
>>>>>>> ad51b6bdb1f2aa6812e7b88d0ca0af3530fbc512
</body>
</html>