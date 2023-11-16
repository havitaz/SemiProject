<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<% 
	String contextPath = request.getContextPath();
	String albumPath = "resources/icon/musicAlbumCover/";
%>

<%
    // 현재 시간을 가져오기
    LocalDateTime now = LocalDateTime.now();

    // 날짜 및 시간 형식 지정
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String formattedDateTime = now.format(formatter);
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/header.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/style.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/sidebar.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/video.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>

 body {
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
  
  .musRec{
  color: white;
  text-decoration-line: none
  }
</style>

</head>
<meta charset="UTF-8">
<title>Quokka Player</title>
<body>
		<jsp:include page="../common/menubar-test.jsp"/>


    <main>
        <h1 class="main-title" style="color: black;">지금 듣기</h1><br>

        <div>

        <section class="video-grid">

            <div class="video-preview">
                <div>
                    <iframe class="video-mv" width="360" height="250" src="https://www.youtube.com/embed/MIbt_Yn_rdw?si=tUN--4rIUsdwL8n4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    <iframe class="video-mv" width="360" height="250" src="https://www.youtube.com/embed/WbhK3wMXluE?si=VoVFHuxVVkT45X83" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    <iframe class="video-mv" width="360" height="250" src="https://www.youtube.com/embed/L6-uJLteKek?si=8h3XxMeaBk3dIpwQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    <iframe class="video-mv" width="360" height="250" src="https://www.youtube.com/embed/2fDzCWNS3ig?si=S4pcMem377qQq5pU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
                
            </div>



                
            
        </section>

        </div>




		<c:choose>
		  <c:when test="${ empty loginUser }">
	        <div class="music-grid" style="cursor: pointer;" onclick="alert('로그인 후 이용해 주세요.')">	          
	            <div>
	                <div class="top100part">
	                <div class="speech-bubble">
	                <!-- 추천 곡 정보와 같은 대화 말풍선의 내용을 추가하세요 -->
	                <u><a class="musRec" href="#">이번 주 추천 곡</a></u>
	                <u><a class="musRec" href="#">쿼카가 추천하는 8곡과<br> 새로 들어온 노래 15곡!</a></u>
	            	</div>
	                <h1 class="top100-h1">쿼카 플레이어
	                    <br>top 100
	                </h1>
	                <div class="top100info">
	                	<br><br>
	                    총 6곡!
	                    <br><br>
	                    <%= formattedDateTime %>
	                    <br><br><br>
	                    <img class="top100play-btn" src="<%=contextPath%>/resources/icon/menubarIcon/play.png"/>
	                </div>
			
	            </div>
	            </div>
	            <div>
	               <div id="top100List">
	               
	               </div>
	 
	            </div>
	        </div>
	      </c:when>
	      <c:otherwise>
	      		<div class="music-grid" onclick="location.href='list.mu?cpage=1';" style="cursor: pointer;">
	            <div>
	                <div class="top100part">
	                <div class="speech-bubble">
	                <!-- 추천 곡 정보와 같은 대화 말풍선의 내용을 추가하세요 -->
	                <u><a class="musRec" href="newList.mu">쿼카가 추천하는 6곡!</a></u>
	                <u><a class="musRec" href="newList.mu">쿼카가 추천하는 8곡과<br> 새로 들어온 노래 15곡!</a></u>
	                <!--<p style="color:white ">쿼카가 추천하는 6곡!</p>-->
	            	</div>
	                <h1 class="top100-h1">쿼카 플레이어
	                    <br>top 100
	                </h1>
	                <div class="top100info">
	                	<br><br>
	                    총 6곡!
	                    <br><br>
	                    <%= formattedDateTime %>
	                    <br><br><br>
	                    <img class="top100play-btn" src="<%=contextPath%>/resources/icon/menubarIcon/play.png"/>
	                </div>
			
	            </div>
	            </div>
	            <div>
	               <div id="top100List">
	               
	               </div>
	 
	            </div>
	        </div>
	      </c:otherwise>
        </c:choose>
        <script>
            $(function(){
                top100List();
            })
            function top100List(){
                $.ajax({
                    url:"top100list.bo",
                    success: function(data){
                        drawTop100List(data);
                    },
                    error: function(data){
                        console.log("top100 ajax 실패");
                    }
                })
            }

            function drawTop100List(data) {
                for (let rowData of data) {
                    const tr = document.createElement('div');
                    const MusArt = rowData.musArt.length > 12 ? rowData.musArt.substring(0, 7) + '...' : rowData.musArt;
                    const MusName = rowData.musName.length > 12 ? rowData.musName.substring(0, 7) + '...' : rowData.musName;

                    tr.innerHTML = "<div><img src='" + rowData.filePath + rowData.changeName + "'>" +
                        "<div>" + "<p>" + MusArt + "</p>" +
                        "<p>" + MusName + "</p>" + "</div>" + "</div>";

                    document.querySelector("#top100List").appendChild(tr);
                }
            }
        </script>
    </main>
	
</body>
</html>