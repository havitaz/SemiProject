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
    background-image: url("<%=contextPath %>/resources/images/XXXX.png");
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
                <div class="thumbnail-row">
                    <img class="thumbnail" src="<%=contextPath %>/resources/images/maxresdefault.jpg">
                    <div class="video-time">
                        명품 편집샵 직원들의 출근룩이란? 젠테 스토어 : part 2 【서울 스트릿 패션】 - EP.17
                    </div>
                    <div class="video-time">
                        14:48
                    </div>

                </div>
                
            </div>


            <div class="video-preview">
                <div class="thumbnail-row">
                    <img class="thumbnail" src="<%=contextPath %>/resources/images/maxresdefault.jpg">
                    <div class="video-time">
                        명품 편집샵 직원들의 출근룩이란? 젠테 스토어 : part 2 【서울 스트릿 패션】 - EP.17
                    </div>
                    <div class="video-time">
                        14:48
                    </div>
                </div>
              
            </div>
            <div class="video-preview">
                <div class="thumbnail-row">
                    <img class="thumbnail" src="<%=contextPath %>/resources/images/maxresdefault.jpg">
                    <div class="video-time">
                        명품 편집샵 직원들의 출근룩이란? 젠테 스토어 : part 2 【서울 스트릿 패션】 - EP.17
                    </div>
                    <div class="video-time">
                        12:14
                    </div>
                    
                </div>
              
            </div>
            <div class="video-preview">
                <div class="thumbnail-row">
                    <img class="thumbnail" src="<%=contextPath %>/resources/images/maxresdefault.jpg">
                    <div class="video-time">
                        명품 편집샵 직원들의 출근룩이란? 젠테 스토어 : part 2 【서울 스트릿 패션】 - EP.17
                    </div>
                    <div class="video-time">
                        8:06
                    </div>
                </div>
                
            </div>
        </section>

        </div>





        <div class="music-grid">
            <section>
                <h1>top 100</h1>
                <table class="top100grid">
                    <tr>
                        <td>
                            <div class="video-preview">
                                <div class="thumbnail-row">
                                    <img class="thumbnail" src="<%=contextPath %>/resources/images/cp.jpg">
                                    <div class="music-detail" align="center">
                                        Nine Tracks Mind Delux
                                        <br>
                                        Charlie Puth
                                    </div>
                                    <div class="video-time">
                                        8:06
                                    </div>
                                </div>
                        </td>
                        <td>
                            <div class="video-preview">
                                <div class="thumbnail-row">
                                    <img class="thumbnail" src="<%=contextPath %>/resources/images/justice.jpg">
                                    <div class="music-detail" align="center">
                                        Justice
                                        <br>
                                        Justin Bieber   
                                    </div>
                                    <div class="video-time">
                                        8:06
                                    </div>
                                </div>
                        </td>
                        <td>
                            <div class="video-preview">
                                <div class="thumbnail-row">
                                    <img class="thumbnail" src="<%=contextPath %>/resources/images/intentions.jpg">
                                    <div class="music-detail" align="center">
                                        intentions
                                        <br>
                                        Justin Bieber                                     
                                    </div>
                                    <div class="video-time">
                                        8:06
                                    </div>
                                </div>
                        </td>
                        <td>
                            <div class="video-preview">
                                <div class="thumbnail-row">
                                    <img class="thumbnail" src="<%=contextPath %>/resources/images/sm.jpg">
                                    <div class="music-detail" align="center">
                                        Shawn Mendes
                                        <br>
                                        Shawn Mendes
                                    </div>
                                    <div class="video-time">
                                        8:06
                                    </div>
                                </div>
                        </td>
                        <td>
                            <div class="video-preview">
                                <div class="thumbnail-row">
                                    <img class="thumbnail" src="<%=contextPath %>/resources/images/wild.jpg">
                                    <div class="music-detail" align="center">
                                        Wild
                                        <br>
                                        Troye Sivan                        
                                    </div>
                                    <div class="video-time">
                                        8:06
                                    </div>
                                </div>
                        </td>
                        <td>
                            <div class="video-preview">
                                <div class="thumbnail-row">
                                    <img class="thumbnail" src="<%=contextPath %>/resources/images/trx.jpg">
                                    <div class="music-detail" align="center">
                                        Trxye
                                        <br>
                                        Troye Sivan
                                    </div>
                                    <div class="video-time">
                                        8:06
                                    </div>
                                </div>
                        </td>
                    </tr>
                </table>
                    
                
            </section>
        </div>

    </main>


</body>
</html>