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
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    
    
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

</style>

</head>
<meta charset="UTF-8">
<title>Quokka Player</title>
<body>

		    <%
		        out.println("loginUser: " + session.getAttribute("loginUser"));
		        out.println("memberNo: " + session.getAttribute("memberNo"));
		    %>


			<c:choose>
			    <c:when test="${!empty loginUser}">
			        <script>
			            // 이미 요청을 보냈는지 여부를 localStorage에서 확인
			            var hasSentRequest = localStorage.getItem("hasSentRequest");
			
			            if (!hasSentRequest) {
			                // loginUser에 memberNo 속성이 있다고 가정합니다.
			                var memberNo = "${loginUser.memberNo}";
			
			                // "list.pl"로의 요청을 생성합니다.
							var requestUrl = "/se/list.pl?memberNo=" + memberNo;
			
			                // "list.pl" 페이지로 리다이렉트합니다.
			                window.location.href = requestUrl;
			
			                // localStorage에 표시하여 더 이상 요청을 보내지 않도록 함
			                localStorage.setItem("hasSentRequest", "true");
			            }
			        </script>
			    </c:when>
			</c:choose>









	 <header class="header">

        <div class="left-section">
                <img class= "player-menu" id="shuffleButton" src="<%=contextPath %>/resources/icon/menubarIcon/shuffle.png" alt="셔플"/>
                <img class= "player-menu" id="prevButton" src="<%=contextPath %>/resources/icon/menubarIcon/left.png" alt="이전"/>
                <img class= "player-menu" id="playButton" onclick="changeImagePlay()" src="<%=contextPath %>/resources/icon/menubarIcon/play.png" alt="재생"/>
                <img class= "player-menu" id="nextButton" src="<%=contextPath %>/resources/icon/menubarIcon/right.png" alt="다음"/>
                <img class= "player-menu" id="repeatButton" src="<%=contextPath %>/resources/icon/menubarIcon/repeat.png" alt="반복"/>
        </div>


        <div class="middle-section"> 
  
            <div class="player-bar"> 
            
            
            <script>
			  function changeImage() {
				    let volCheck = document.getElementById("vol");
				    
				    let currentImage = volCheck.src.substring(volCheck.src.lastIndexOf('/') + 1);
				    
				    if (currentImage === "mute.png") {
				      volCheck.src = "<%=contextPath %>/resources/icon/menubarIcon/vol.png";
				    } else {
				      volCheck.src = "<%=contextPath %>/resources/icon/menubarIcon/mute.png";
				    }
				  }
				  			 
				  function changeImagePlay() {
					    let plbtn = document.getElementById("playButton");
					    let currentImage = plbtn.src.substring(plbtn.src.lastIndexOf('/') + 1);
					    
					    if (currentImage === "play.png") {
					      plbtn.src = "<%=contextPath %>/resources/icon/menubarIcon/pause-button.png";
					    } else {
					      plbtn.src = "<%=contextPath %>/resources/icon/menubarIcon/play.png";
					    }
					  }
				  
				  
				  function changeVolume() {
					    let volumeRange = document.getElementById("volumeRange");
					    let volCheck = document.getElementById("vol");				
					    // volumeRange의 값이 0인 경우 mute 이미지로, 그 외에는 vol 이미지로 변경
					    volCheck.src = volumeRange.value == 0 ? "<%=contextPath %>/resources/icon/menubarIcon/mute.png" : "<%=contextPath %>/resources/icon/menubarIcon/vol.png";
					  }
				  			 		  
				  
				    // 이미지 클릭 이벤트 핸들러 등록
				    document.getElementById("shuffleButton").addEventListener("click", function() {
				        // 셔플 버튼 클릭 시 실행할 함수 호출
				        shuffleFunction();
				    });
	
				    document.getElementById("prevButton").addEventListener("click", function() {
				        // 이전 버튼 클릭 시 실행할 함수 호출
				        playPrevious();
				    });
	
				    document.getElementById("playButton").addEventListener("click", function() {
				        // 재생 버튼 클릭 시 실행할 함수 호출
				        togglePlay(playAudio);  // playAudio에 대한 토글 함수 호출 (기존 코드 참고)
				    });
	
				    document.getElementById("nextButton").addEventListener("click", function() {
				        // 다음 버튼 클릭 시 실행할 함수 호출
				        playNext();
				    });
	
				    document.getElementById("repeatButton").addEventListener("click", function() {
				        // 반복 버튼 클릭 시 실행할 함수 호출
				        togglePlay(repeatAudio);  // repeatAudio에 대한 토글 함수 호출 (기존 코드 참고)
				    });
	
				    // 셔플 기능을 담당하는 함수
				    function shuffleFunction() {
				        // 여기에 셔플 기능을 구현
				        console.log("셔플 기능을 실행합니다.");
				        // 추가적인 동작을 구현하세요.
				    }
	
				    // 이전 곡을 재생하는 함수
				    function playPrevious() {
				        // 여기에 이전 곡 재생 기능을 구현
				        console.log("이전 곡을 재생합니다.");
				        // 추가적인 동작을 구현하세요.
				    }
	
				    // 다음 곡을 재생하는 함수
				    function playNext() {
				        // 여기에 다음 곡 재생 기능을 구현
				        console.log("다음 곡을 재생합니다.");
				        // 추가적인 동작을 구현하세요.
				    }
				    
				    
				    function togglePlay(audioElement) {
				        if (audioElement.paused) {
				            // 일시 정지 중이면 재생
				            audioElement.play();
				        } else {
				            // 재생 중이면 일시 정지
				            audioElement.pause();
				        }
				    }
				    
            
            
			 // 함수 정의: 음악 정보를 서버로 전송
			    function sendMusicInfo(musName, musArt, musTime) {
			        // Ajax 요청을 통해 음악 정보를 서버로 전송
			        $.ajax({
			            type: 'POST', // 요청 메서드
			            url: '<%=request.getContextPath()%>/playbar.pl', // 서버 엔드포인트 URL
			            data: {
			                musName: musName,
			                musArt: musArt,
			                musTime: musTime
			            },
			            success: function (response) {
			                // 서버 응답에 대한 처리
			                console.log(response);

			                // 받은 응답을 이용하여 UI 업데이트 등의 작업 수행
			                updateUI(response);
			            },
			            error: function (error) {
			                // 에러 처리
			                console.error(error);
			            }
			        });
			    }

			    function updateUI(response) {
			        // 서버 응답에 따라 UI 업데이트 수행
			        // 이 부분에 받은 데이터를 이용하여 UI를 업데이트하는 로직을 추가할 수 있습니다.
			        var musicInfoDiv = $("#musicInfoDiv"); // 업데이트할 div의 ID
			        musicInfoDiv.text(response);
			    }
			    
		        $(document).ready(function () {
		            var hasSentRequest = localStorage.getItem("hasSentRequest");

		            if (!hasSentRequest) {
		                // 여기에 기존의 sendMusicInfo 호출 코드 추가
		                // ...

		                // localStorage에 표시하여 더 이상 요청을 보내지 않도록 함
		                localStorage.setItem("hasSentRequest", "true");
		            }
		        });
            </script>
            
            
            
           	    <c:choose>
              		<c:when test="${ empty loginUser }">
              		
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
            		
            		
            		              	<img class="album-thumb" src="${pl.albumPath}"> 
									 <%--src="<%=contextPath/resources/images/temp.jpg"> --%>
					                <div class="flex-item time">
					                    00:00
					                </div>       
					                                
					                <div class="flex-item mp_info"> 
					               		 ${pl.musName} - ${pl.musArt}
					               		 <!--제목            가수  -->
					                </div>  
					                                 
					                <div  class="flex-item time align">
					                    ${pl.musTime}
					                </div>
              		
            		
            		</c:otherwise>
            	</c:choose>	
                                    
            </div>                      
            
			<div class="volume">			
            	<img id="vol" class="vol-btn" onclick="changeImage()" src="<%=contextPath %>/resources/icon/menubarIcon/mute.png"/>   
				<input type="range" id="volumeRange" min="0" max="100" step="0.5" oninput="changeVolume()">
			</div>
			
			
			
			
			
			
			
			
			<script>

			</script>
			
			
			
        </div>
  
    <!-- 로그인 전 -->
  	  <c:choose>
  	  	<c:when test="${ empty loginUser }">
         <div class="right-section">
            <div class="notifications-icon-container">    
            </div>
            <button class="btn-login" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
        </div>
        </c:when>
        

        <c:otherwise>
          <div class="right-section">
            <div class="notifications-icon-container">    
            </div>
            <button class="btn-login" data-bs-toggle="modal" data-bs-target="#loginModal" disabled>로그인</button>
        </div>
        </c:otherwise>
	  </c:choose>
    </header>

				 <!-- loginModal -->
        <div class="modal" id="loginModal" style="color: black;">
                  <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">

                          <!-- Modal Header-->
                          <div class="modal-header">
                                  <h2>
                                  Welcome to <br>
                                  쿼카 플레이어
                                  </h2>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                          </div>

                  <!-- Modal body -->
                  <div class="modal-body" align="center">
                  <form action="login.me" method="post">
                      <table>
                          <tr>
                              <td><input type="text" name="memberId" style="width: 500px; height: 50px;" required placeholder="아이디를 입력해주세요"></td>
                          </tr>
                          <tr>
                              <td><input type="password" name="memberPwd" style="width: 500px; height: 50px;" required placeholder="비밀번호를 입력해주세요"></td>
                          </tr>
                          <tr>
                          	<td><button class="modal-loginButton" type="submit">로그인</button></td>
                          <tr>
                      </table>
                  </form>
                  </div>

                  <!-- Modal footer -->
                  <div class="modal-footer" align="center" style="justify-content: center; height:210px">
						<div class="link-style" >
							<a href="<%=contextPath %>/insertPage.me">회원가입</a>
							<a href="<%=contextPath %>/selectId.me">아이디찾기</a>
							<a href="<%=contextPath %>/selectPwd.me">비밀번호찾기</a>
						</div>
						<img class="memberIcon" src="<%=contextPath %>/resources/images/login.jpg" style="position: absolute; right: 0px;" />
                  		
                  </div>
              </div>
          </div>
      	</div>











    <nav class="sidebar">    

        <div class="top-section">
                <img class= "logo" src="<%=contextPath %>/resources/images/logo.png" alt="로고"/>  
                
                
                
                <c:choose>
                	<c:when test="${ empty loginUser }">             
                	 	               	
                		<!-- 로그인 전 -->        
                		
	                	<form action="" method="post">
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
									<button class="a_button" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
									<button class="a_button">회원가입</button>
								</ul>               			 	
			                </div>
		                </form>
               		</c:when>
               		
               		
               		
               		<c:otherwise>
               		<!-- 로그인 후 -->
               			<div>
               				<div class="Member-profile">
				                <ul class="profileImg ul">
				                  <img class= "pro_admin" src="<%=contextPath %>/resources/images/member.jpg" alt="멤버"/>               
				                </ul>
			                    <ul class="detail-profile ul">
			                        <li>${loginUser.memberId }님</li>
			                        <li>${loginUser.phone }</li>
			                        <li>${logunUser.email}</li>
			                    </ul>
								<ul class="profile-button ul">
									<button type = "submit" class="a_button">마이페이지</button>
									<input type = "button" onclick = "logout()"  class="a_button" value = "로그아웃">
								</ul>
			                </div>
			            </div>    							            
               		</c:otherwise>                   		         			 
				</c:choose> 
        </div>

        <script>
         	function logout(){
        	 	location.href = "logout.me"
         	}
        </script>
			
			

                <c:choose>
             		<c:when test="${ empty loginUser }">  
			 				<!-- 비회원은 재생목록 공백 -->
			 		</c:when>
			 		<c:otherwise>			 				
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
							      
							      
							      
									      <c:forEach var="pl" items="${ playlist }">		   
											<li class="sidebar-list" onclick="sendMusicInfo('${pl.musName}', '${pl.musArt}', '${pl.musTime}')">                 
												<img class="pl-thumb" src="${pl.albumPath}"> 
												<div>
												 	<p class="pl-title">${pl.musName}</p> 
												 	<p class="pl-musician">${pl.musArt}</p>
												</div>
											 </li>
										 </c:forEach>
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
											<div>
								 				<p class="pl-title">가나다라마바사아자차카타파하</p> 							 				
								 				<p class="pl-musician">Sia</p>
							 				</div>			
							 			</li>
										<li class="sidebar-list">                 
											<img class="pl-thumb" src="<%=contextPath %>/resources/images/default-albumArt.png"> 
											<div>
								 				<p class="pl-title">Snowman</p> 							 				
								 				<p class="pl-musician">Sia</p>
							 				</div>			
							 			</li>							 			
										<li class="sidebar-list">                 
											<img class="pl-thumb" src="<%=contextPath %>/resources/images/default-albumArt.png"> 
											<div>
								 				<p class="pl-title">Snowman</p> 							 				
								 				<p class="pl-musician">Sia</p>
							 				</div>			
							 			</li>
										<li class="sidebar-list">                 
											<img class="pl-thumb" src="<%=contextPath %>/resources/images/default-albumArt.png"> 
											<div>
								 				<p class="pl-title">Snowman</p> 							 				
								 				<p class="pl-musician">Sia</p>
							 				</div>			
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
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>	
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>	
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>	
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>	
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>	
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>	
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>	
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>	
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>		
								<li class="sidebar-list">                 
									<img class="pl-thumb" src="<%=contextPath %>/resources/images/temp.jpg"> 
									<div>
						 				<p class="pl-title">Road to Ruin</p> 							 				
						 				<p class="pl-musician">Mr.big</p>
					 				</div>			
					 			</li>
							  </div>
						    </div>
						  </div>
						</div>
			 		</c:otherwise>             			 
				</c:choose> 
			 	     	<!-- 로그인 전 -->      
		</div>

    </nav>
</body>
</html>