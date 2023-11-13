<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/header.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/style.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/sidebar.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/video.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    
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

  .minusPlayList {
    width: 24px;
    height: 24px;
    cursor: pointer;
    position: relative;
    left: 25px;
	box-sizing: border-box;
}

/*
 details {
	background:rgba(133, 90, 71, 0.8);
	border-radius: 10px;
	color: white;
	margin-top: 5px;
	margin-left: 3px;
	margin-right: 3px;
 }
 summary {
	font-size: 19px;
	font-weight:700;
	margin-top: 3px;
	height: 40px;
 }
*/ 
.sidebar-list{
	margin-top: 1px;
	margin-bottom: 0px;
	list-style: none;
	height: 40px;
	border: 1px solid rgba(51, 51, 51, 0.5);
	border-left: none;
	border-right: none;
	background:  rgba(51, 51, 51, 0.7);
	color: white;
	display: flex;
	cursor: pointer;
 }
 .sidebar-list:hover{
	background: rgba(107, 106, 106, 0.256);
	border-bottom: 1px solid rgba(51, 51, 51, 0.5);
 }
 .pltitle{
	display: flex;
	flex-direction: row;
	font-weight: bold;
	margin-top: 5px;
	align-items: center;
	justify-content: center;
	position: relative;
	right: 45px;
 }
 .accordion-body{

	list-style: none;
	padding: 0;
 }


 .accordion {
	--bs-accordion-bg: none;
	--bs-accordion-border-color: rgba(51, 51, 51, 0.8);
	border-radius: 5px;

	background:rgba(133, 90, 71, 0.8);
	--bs-accordion-active-bg: none;
	--bs-accordion-btn-focus-box-shadow: rgb(51, 51, 51); ;
 }

 .accordion-button{
	font-weight: 600;
	color: white;
	font-size: 13px;
 }


 .pl-thumb {
	position: relative;
    height: 40px;
    width: 40px;
    right: -1px;
    top: -1px;
	margin-right: 3px;
}

.accordion-button:not(.collapsed) { /*눌렸을떄*/
    color: rgba(255, 255, 255, 0.9);
}

.pl-musician{
	display: flex;
	flex-direction: column-reverse;
	left: -83px;
    position: relative;
    font-size: 12px;
    color: rgba(152, 152, 152, 0.792);

}

.pl-title {
	font-size: 14px;
}

.playList{
	overflow-y: auto;
	height: 100%;
	width: 100%;
}
 
.playList::-webkit-scrollbar {
  width: 0px;  /* 스크롤바의 너비 */
}
/*
.accodient-box::-webkit-scrollbar-thumb {
  height: 30%;  스크롤바의 길이 
  background: #848484;  스크롤바의 색상 
  border-radius: 10px;
}
*/
 /*
.accodient-box::-webkit-scrollbar-track {
  background: #84848447;  스크롤바 뒷 배경 색상
}
*/
.volume{
	display: flex;
	margin-left: 10px;
	align-items: center;
	accent-color: rgb(133, 90, 71);
}

.vol-btn{
	width: 35px;
	cursor: pointer;
}

.form-range-thumb-active-bg{
	tint-color($component-active-bg, 70%);
}   

</style>

</head>
<meta charset="UTF-8">
<title>Quokka Player</title>
<body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	<jsp:include page="../common/menubar-test.jsp"/>

    <main>
        <h1 class="main-title" style="color: black;">지금 듣기</h1><br>

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





        <div class="music-grid" onclick="location.href='list.mu?cpage=1';" style="cursor: pointer;">
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
	
</body>
</html>