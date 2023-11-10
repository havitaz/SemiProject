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

</style>

</head>
<meta charset="UTF-8">
<title>Quokka Player</title>
<body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>



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
            
            
            
           	    <c:choose>
              		<c:when test="${ !empty loginUser }">
              		
              		                <img class="album-thumb" src="<%=contextPath %>/resources/images/default-albumArt.png"> 

					                <div class="flex-item time">
					                    00:00
					                </div>       
					                                
					                <div class="flex-item mp_info"> 
					               		 ---- ---- ----
					                </div>  
					                                 
					                <div  class="flex-item time align">
					                    00:00
					                </div>
              		
              		
              		                    
            		</c:when>
            		<c:otherwise>
            		
            		
            		              	<img class="album-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 

					                <div class="flex-item time">
					                    00:00
					                </div>       
					                                
					                <div class="flex-item mp_info"> 
					               		 {musName} - {musArt}
					                </div>  
					                                 
					                <div  class="flex-item time align">
					                    00:00
					                </div>
              		
            		
            		</c:otherwise>
            	</c:choose>	
            
            

                
                
                
                
                
                
            </div>
            
            
            
			<div class="volume">
			
			<!-- 
             	    <c:choose>
                		<c:when test="${ empty loginUser }">              
              				  <img id="vol-btn" class="vol-btn" src="<%=contextPath %>/resources/icon/menubarIcon/mute.png"/>   
              				  <button onclick="changeImage()">toggle</button>          
                		</c:when>
                		                		               		
                		<c:otherwise>	
              				  <img class="vol-btn" src="<%=contextPath %>/resources/icon/menubarIcon/vol.png"/>                         		
                	    </c:otherwise>  
					</c:choose>
                 -->
            	<img id="vol" class="vol-btn" onclick="changeImage()" src="<%=contextPath %>/resources/icon/menubarIcon/mute.png"/>   
				<input type="range" id="volumeRange" min="0" max="100" step="0.5" oninput="changeVolume()">
			</div>
			
			
			<script>
			  function changeImage() {
			    let volCheck = document.getElementById("vol");
			    
			    // 현재 이미지의 파일명을 추출
			    let currentImage = volCheck.src.substring(volCheck.src.lastIndexOf('/') + 1);
			    
			    if (currentImage === "mute.png") {
			      // 현재가 mute 이미지면 vol 이미지로 변경
			      volCheck.src = "<%=contextPath %>/resources/icon/menubarIcon/vol.png";
			    } else {
			      // 현재가 vol 이미지면 mute 이미지로 변경
			      volCheck.src = "<%=contextPath %>/resources/icon/menubarIcon/mute.png";
			    }
			  }
			  
			  function changeVolume() {
				    let volumeRange = document.getElementById("volumeRange");
				    let volCheck = document.getElementById("vol");
			
				    // volumeRange의 값이 0인 경우 mute 이미지로, 그 외에는 vol 이미지로 변경
				    volCheck.src = volumeRange.value == 0 ? "<%=contextPath %>/resources/icon/menubarIcon/mute.png" : "<%=contextPath %>/resources/icon/menubarIcon/vol.png";
				  }
			</script>
			
			
			
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
                
                
                
                <c:choose>
                	<c:when test="${ empty loginUser }">  
                	
                	  
                 	               	
                	<!-- 로그인 후 -->        
	                	<form action="logout.me" method="post">
               			 	<div class="Member-profile">
				                <ul class="profileImg ul">
				                  <img class= "pro_admin" src="<%=contextPath %>/resources/images/member.jpg" alt="멤버"/>               
				                </ul>
			                    <ul class="detail-profile ul">
			                        <li>&lt; userId &gt;님</li>
			                        <li>&lt;010-xxxx-xxxx&gt;</li>
			                        <li>asd12345@naver.com</li>
			                    </ul>
								<ul class="profile-button ul">
									<button class="a_button">마이페이지</button>
									<button class="a_button">로그아웃</button>
								</ul>
			                </div>
		                </form>
               		</c:when>
               		
               		
               		
               		
               		
               		
               		
               		
               		
               		
               		
               		<c:otherwise>
               		<!-- 로그인 전 -->
               			<div>
               				<div class="Member-profile">
				                <ul class="profileImg ul">
				                  <img class= "pro_admin" src="<%=contextPath %>/resources/images/NotaMember.jpg" alt="멤버"/>               
				                </ul>
			                    <ul class="detail-profile ul">
			                        <li style="font-size: 14px;">&nbsp;&nbsp;비회원</li>
			                        <li style="font-size: 12px;"> &nbsp;&nbsp;로그인 후 이용바랍니다.</li>
			                        <li></li>
			                    </ul>
								<ul class="profile-button ul">
									<button class="a_button">로그인</button>
									<button class="a_button">회원가입</button>
								</ul>
			                </div>
			            </div>    
			            
			            			            			        

							            
               		</c:otherwise>             			 
				</c:choose> 
        </div>

			

                <c:choose>
             		<c:when test="${ empty loginUser }">  

						<div class="playList" align="center">
							<div class="createPlayList">
								<h4 class="pltitle">
									재생목록
									<img class="addPlayList" src="<%=contextPath %>/resources/icon/TOP100Icon/add_icon.png" alt="메뉴"/>
									<img class="minusPlayList" src="<%=contextPath %>/resources/icon/TOP100Icon/minus.png" alt="메뉴"/>
				
								</h4>
							</div>
				
							<div class="accordion accordion-flush" id="accordionFlushExample">
				
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
							        재생목록 #1
							      </button>
							    </h2>
							    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">
							      
							      
							      
									      <c:forEach var="pl" items="${ list }">		   
											<li class="sidebar-list">                 
												<img class="pl-thumb" src="<%=contextPath %>/resources/images/default-albumArt.png"> 
												 <p class="pl-title">${pl.musName}</p> 
												 
												 <p class="pl-musician">&nbsp;&nbsp;${pl.musArt}</p>			
											 </li>
										 </c:forEach>
	
											<li class="sidebar-list">                 
												<img class="pl-thumb" src="<%=contextPath %>/resources/images/default-albumArt.png"> 
												 <p class="pl-title">${pl.musName}</p> 
												 
												 <p class="pl-musician">&nbsp;&nbsp;${pl.musArt}</p>			
											 </li>
											 <li>
											  	<c:out value="${Playlist}" />
											 </li>


								  </div>
							    </div>
							  </div>
							
							
							
							
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
							        재생목록 #2
							      </button>
							    </h2>
							    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">			  
										<li class="sidebar-list">                 
											<img class="pl-thumb" src="<%=contextPath %>/resources/images/default-albumArt.png"> 
							 				<p class="pl-title">Snowman</p> 
							 				
							 				<p class="pl-musician">Sia</p>			
							 			</li>
										 <li class="sidebar-list">                 
											<img class="pl-thumb" src="<%=contextPath %>/resources/images/default-albumArt.png"> 
							 				<p class="pl-title">Road to Ruin</p> 
							 				
							 				<p class="pl-musician">Mr.big</p>			
							 			</li>
										 <li class="sidebar-list">                 
											<img class="pl-thumb" src="<%=contextPath %>/resources/images/default-albumArt.png"> 
							 				<p class="pl-title">Road to Ruin</p> 
							 				
							 				<p class="pl-musician">Mr.big</p>			
							 			</li>
										 <li class="sidebar-list">                 
											<img class="pl-thumb" src="<%=contextPath %>/resources/images/default-albumArt.png"> 
							 				<p class="pl-title">Road to Ruin</p> 
							 				
							 				<p class="pl-musician">Mr.big</p>			
							 			</li>
								  </div>
							    </div>
							  </div>
							
							
							
							
							  <div class="accordion-item">
						    <h2 class="accordion-header">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
						        재생목록 #3
						      </button>
						    </h2>
						    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
						      <div class="accordion-body">
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
								 <li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									 <p class="pl-title">Road to Ruin</p> 
									 
									 <p class="pl-musician">Mr.big</p>			
								 </li>
							  </div>
						    </div>
						  </div>
						</div>
			 		</c:when>
			 		<c:otherwise>
			 				<!-- 비회원은 재생목록 공백 -->
			 		</c:otherwise>             			 
				</c:choose> 
			 	     	<!-- 로그인 전 -->      
		</div>

    </nav>
</body>
</html>