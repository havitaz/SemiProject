<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/header.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/style.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/sidebar.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/video.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>


<style>
body {
	margin: 0;
	padding-top: 80px;
	padding-left: 310px;
	padding-right: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	background-image:
		url("<%=contextPath%>/resources/images/background.png");
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


.progressBar{
    position: absolute;
    display: flex;
    top: 45px;
    width: 410px;
    right: 630px;
    height: 3px;
    accent-color: rgb(100 59 41);
}
.link-style{
	display:flex;
}
</style>

</head>
<meta charset="UTF-8">
<title>Quokka Player</title>
<body>

	<%
	out.println("loginUser: " + session.getAttribute("loginUser"));
	out.println("memberNo: " + session.getAttribute("memberNo"));
	%>

<%-- 
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

--%>







	<header class="header">

		<div class="left-section">
			<img class="player-menu" id="shuffleButton" src="<%=contextPath%>/resources/icon/menubarIcon/shuffle.png" alt="셔플" />
			<img class="player-menu" id="prevButton" src="<%=contextPath%>/resources/icon/menubarIcon/left.png" alt="이전" />
			<img class="player-menu" id="playButton" onclick="togglePlayPause()" src="<%=contextPath%>/resources/icon/menubarIcon/play.png" alt="재생" />
			<img class="player-menu" id="nextButton" src="<%=contextPath%>/resources/icon/menubarIcon/right.png" alt="다음" /> 
			<img class="player-menu" id="repeatButton" src="<%=contextPath%>/resources/icon/menubarIcon/repeat.png" alt="반복" />
		</div>

		
		
		<audio id="audioPlayer" style="display: none;">
		  <source src="<%=contextPath%>/resources/audio/King Gnu-Specialz.mp3" type="audio/mp3">
		</audio>
		
		
		


		<div class="middle-section">

			<div class="player-bar">


				<script>
				
					
				
				
				
				
				
					/*반복*/	
					var audioElement = document.getElementById('audioPlayer');
					var repeatButton = document.getElementById('repeatButton');
					var isRepeat = false;
					repeatButton.addEventListener('click', function() {
					    // 반복 상태 토글
					    isRepeat = !isRepeat;

					    // 반복 상태에 따라 이미지 변경
					    if (isRepeat) {
					        repeatButton.src = "<%=contextPath%>/resources/icon/menubarIcon/repeat1.png";
					    } else {
					        repeatButton.src = "<%=contextPath%>/resources/icon/menubarIcon/repeat.png";
					    }
					});	
					
										
					/*상단바 재생시간 */
					function timeStringToSeconds(timeString) {
				    var timeArray = timeString.split(':');
				    var minutes = parseInt(timeArray[0], 10);
				    var seconds = parseInt(timeArray[1], 10);
				    return minutes * 60 + seconds;
					}
					
					var musTimeInSeconds = timeStringToSeconds('${pl.musTime}');
					
					// ${pl.musTime}을 초로 변환
					var initialTime = timeStringToSeconds('${pl.musTime}');

					// 시간을 표시할 div 요소
					var timeDiv = $(".flex-item.time");

					// 1초 간격으로 실행되는 함수
					var timer = setInterval(function() {
					    // 현재 시간을 초로 계산
					    var currentTimeInSeconds = initialTime--;

					    // 초를 분과 초로 변환
					    var minutes = Math.floor(currentTimeInSeconds / 60);
					    var seconds = currentTimeInSeconds % 60;

					    // 시간을 00:00 형식으로 표시
					    var formattedTime = (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;

					    // 시간을 화면에 업데이트
					    timeDiv.text(formattedTime);

					    // 시간이 0초가 되면 타이머를 멈춤
					    if (currentTimeInSeconds === 0) {
					        clearInterval(timer);
					    }
					}, 1000);
					
					  // 오디오 시간이 업데이트 될 때 호출되는 이벤트 핸들러
					  audioElement.addEventListener('timeupdate', function () {
					    // 시간을 화면에 업데이트
					    var formattedTime = formatTime(audioElement.currentTime);
					    $(".flex-item.time.flow").text(formattedTime);
					  });

					  // 시간을 00:00 형식으로 포맷하는 함수
					  function formatTime(timeInSeconds) {
					    var minutes = Math.floor(timeInSeconds / 60);
					    var seconds = Math.floor(timeInSeconds % 60);
					    return (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
					  }
					
					  
					
				  // 오디오 요소와 버튼 요소 가져오기
				  var audioElement = document.getElementById('audioPlayer');
				  var playButton = document.getElementById('playButton');

				  // 재생 및 일시정지를 토글하는 함수
				  function togglePlayPause() {
				    if (audioElement.paused) {
				      audioElement.play();
				      playButton.src = "<%=contextPath%>/resources/icon/menubarIcon/pause-button.png";
				    } else {
				      audioElement.pause();
				      playButton.src = "<%=contextPath%>/resources/icon/menubarIcon/play.png";
				    }
				  }


				/*음소거 이미지 변경*/
			  function changeImage() {
				    let volCheck = document.getElementById("vol");				    
				    let currentImage = volCheck.src.substring(volCheck.src.lastIndexOf('/') + 1);
				    
				    if (currentImage === "mute.png") {
				      volCheck.src = "<%=contextPath%>/resources/icon/menubarIcon/vol.png";
		                audioElement.muted = false; // 음소거 해제
				    } else {
				      volCheck.src = "<%=contextPath%>/resources/icon/menubarIcon/mute.png";
		                audioElement.muted = true; // 음소거

				    }
				  }
				  			 
				
				  var audioElement = document.getElementById('audioPlayer');
				  audioElement.volume = 0.5; //초기 볼륨 값 50%

				// 볼륨을 조절하는 함수
				function changeVolume() {
	
				    var volumeRange = document.getElementById('volumeRange');
				    var volCheck = document.getElementById("vol");
	
				    // 볼륨 조절
				    audioElement.volume = volumeRange.value / 100;
	
				    // volumeRange의 값이 0인 경우 mute 이미지로, 그 외에는 vol 이미지로 변경
				    volCheck.src = volumeRange.value == 0 ? "<%=contextPath%>/resources/icon/menubarIcon/mute.png" : "<%=contextPath%>/resources/icon/menubarIcon/vol.png";
				}
	
					
			/*재생버튼 이미지 변경*/

				  function changeImagePlay() {
					    let plbtn = document.getElementById("playButton");
					    
					    if (!audioElement.paused) {
					      plbtn.src = "<%=contextPath%>/resources/icon/menubarIcon/pause-button.png";
					    } else {
					      plbtn.src = "<%=contextPath%>/resources/icon/menubarIcon/play.png";
					    }
					  }
				  
				function playAudio() {
			        audioElement.currentTime = 0; /*다시 클릭시 초기화	*/
			        

			       		audioElement.play();

			        changeImagePlay(); /*재생버튼 반영*/

			    }
		
				audioElement.addEventListener('click', playAudio);
				
				audioElement.addEventListener('ended', function() {
					 if (isRepeat) {
					        // 반복 상태일 때, 오디오를 처음부터 다시 재생
					        audioElement.currentTime = 0;
					        playAudio();
					    } else {
					        // 반복 상태가 아닐 때, 
					        // 다음 곡 재생 함수 
					        
					    }
					});
	
				  			 		 
				    
            
            
				    function sendMusicInfo(musName, musArt, musTime, albumPath) {
				        // Ajax 요청을 통해 음악 정보를 서버로 전송
				        $.ajax({
				            type: 'POST', // 요청 메서드
				            url: '<%=request.getContextPath()%>/playbar.pl', // 서버 엔드포인트 URL
				            data: {
				                musName: musName,
				                musArt: musArt,
				                musTime: musTime,
				                albumPath: albumPath
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
						var musicInfoDiv = $(".flex-item.mp_info"); // 업데이트할 div의 ID						
						var musicTimeDiv = $(".flex-item.time.align")						
						var albumThumb = $(".album-thumb");
						
					    if (!response) {
					        musicInfoDiv.html("<p>---- ---- ----</p>");
					        musicTimeDiv.html("<p>00:00</p>");
					        albumThumb.attr("src", "<%=contextPath%>/resources/images/default-albumArt.png");
					    } else {				    
						musicInfoDiv.html("<p>" + response.musName + " - " + response.musArt + "</p>");
						musicTimeDiv.html("<p>" + response.musTime + "</p>");
						albumThumb.attr("src", response.albumPath);
						
						playAudio();

					    }
					}


					$(document).ready(function () {
					    updateUI();
					});
					
					
					
					  // 오디오 요소 가져오기
					  var audioElement = document.getElementById('audioPlayer');
					  // 프로그레스바 요소 가져오기
					  var progressBar = document.getElementById('progressBar');

					  // 오디오의 시간 업데이트 이벤트 처리
					  audioElement.addEventListener('timeupdate', function () {
					    // 프로그레스바의 값 변경
					    progressBar.value = (audioElement.currentTime / audioElement.duration) * 100;
					  });

					  // 프로그레스바를 조작할 때 오디오의 시간 변경
					  progressBar.addEventListener('input', function () {
					    var seekTime = (progressBar.value / 100) * audioElement.duration;
					    audioElement.currentTime = seekTime;
					  });
					
					

					
				</script>



				<c:choose>
					<c:when test="${ empty loginUser }">

						<img class="album-thumb"
							src="<%=contextPath%>/resources/images/default-albumArt.png">

						<div class="flex-item time">00:00</div>

						<div class="flex-item mp_info">---- ---- ----</div>

						<div class="flex-item time align">00:00</div>

					<!-- <input class="progressBar" type="range" id="progressBar" min="0" max="100" value="0" oninput="updateProgressBar()"> -->


					</c:when>
					<c:otherwise>


						<img class="album-thumb" src="${pl.albumPath}" data-album-path="${pl.albumPath}">
						<%--src="<%=contextPath/resources/images/temp.jpg"> --%>
						<div class="flex-item time flow">00:00</div>

						<div id="musicInfoDiv" class="flex-item mp_info">
							${pl.musName} - ${pl.musArt}
							<!--제목            가수  -->
						</div>

						<div id="musicInfoDiv" class="flex-item time align">
							${pl.musTime}</div>

						<!--  <input class="progressBar" type="range" id="progressBar" min="0" max="100" value="0" oninput="updateProgressBar()"> -->
						
						
					</c:otherwise>
				</c:choose>

			</div>

			<div class="volume">
				<img id="vol" class="vol-btn" onclick="changeImage()"
					src="<%=contextPath%>/resources/icon/menubarIcon/vol.png" /> 
					<input type="range" id="volumeRange" min="0" max="100" step="0.5" oninput="changeVolume()">
			</div>








			<script>
				
			</script>



		</div>

		<!-- 로그인 전 -->
		<c:choose>
			<c:when test="${ empty loginUser }">
				<div class="right-section">
					<div class="notifications-icon-container"></div>
					<button class="btn-login" data-bs-toggle="modal"
						data-bs-target="#loginModal">로그인</button>
				</div>
			</c:when>


			<c:otherwise>
				<div class="right-section">
					<div class="notifications-icon-container"></div>
					<button class="btn-login" data-bs-toggle="modal"
						data-bs-target="#loginModal" disabled>로그인</button>
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
						Welcome to <br> 쿼카 플레이어
					</h2>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" align="center">
					<form action="login.me" method="post">
						<div>
							
								<input class="input-modal" type="text" name="memberId"
									required
									placeholder="아이디를 입력해주세요">
						
							
								<input class="input-modal"  type="password" name="memberPwd"
									required
									placeholder="비밀번호를 입력해주세요">
							
								<button class="modal-loginButton" type="submit">로그인</button>
							
						</div>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer" align="center"
					style="justify-content: center; height: 210px">
					<div class="link-style">
						<a href="<%=contextPath%>/insertPage.me" class="enroll">회원가입</a> 
						<a href="<%=contextPath%>/selectId.me" class="searchId">아이디찾기</a> 
							<a	href="<%=contextPath%>/selectPwd.me" class="searchPwd">비밀번호찾기</a>
					</div>
					<img class="memberIcon"
						src="<%=contextPath%>/resources/images/login.jpg"
						style="position: absolute; right: 0px;" />

				</div>
			</div>
		</div>
	</div>











	<nav class="sidebar">

		<div class="top-section">
			<img class="logo" src="<%=contextPath%>/resources/images/logo.png" alt="로고" onclick="redirectToHome()" />
			
			<script>
			  function redirectToHome() {
			    // 클릭 시 리다이렉션을 수행할 URL을 지정합니다.
			    var redirectUrl = '<%=request.getContextPath()%>/';  // 리다이렉션할 경로
			
			    // JavaScript에서 페이지 리다이렉션을 수행합니다.
			    window.location.href = redirectUrl;
			  }
			</script>


			<c:choose>
				<c:when test="${ empty loginUser }">

					<!-- 로그인 전 -->


						<div class="Member-profile">
							<ul class="profileImg ul">
								<img class="pro_admin"
									src="<%=contextPath%>/resources/images/NotaMember.jpg"
									alt="멤버" />
							</ul>
							<ul class="detail-profile ul">
								<li style="font-size: 14px;">&nbsp;&nbsp;비회원</li>
								<li style="font-size: 12px;">&nbsp;&nbsp;로그인 후 이용바랍니다.</li>
								<li></li>
							</ul>
							<ul class="profile-button ul">
								<button class="a_button" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
								<input type="button" onclick="insertMember()" class="a_button" value="회원가입"></input>
							</ul>
						</div>
				</c:when>



				<c:otherwise>
					<!-- 로그인 후 -->
					<div>
						<div class="Member-profile">
							<ul class="profileImg ul">
								<img class="pro_admin"
									src="<%=contextPath%>/resources/images/member.jpg" alt="멤버" />
							</ul>
							<ul class="detail-profile ul">
								<li>${loginUser.memberId }님</li>
								<li>${loginUser.phone}</li>
								<li>${loginUser.email}</li>
							</ul>
							<ul class="profile-button ul">
								<input type="button" class="a_button" onclick="myPage()" value="마이페이지">
								<input type="button" onclick="logout()" class="a_button" value="로그아웃">
							</ul>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<script>
			function logout() {
				location.href = "logout.me"
			}
			
			function insertMember() {
				location.href = "insertPage.me"
			}
			
			function myPage(){
				location.href="myPage.me"
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
							재생목록 <img class="addPlayList"
								src="<%=contextPath%>/resources/icon/TOP100Icon/add_icon.png"
								alt="메뉴" /> <img class="minusPlayList"
								src="<%=contextPath%>/resources/icon/TOP100Icon/minus.png"
								alt="메뉴" />

						</h4>
					</div>

					<div class="accordion accordion-flush" id="accordionFlushExample">

						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
									aria-expanded="false" aria-controls="flush-collapseOne">
									재생목록 #1</button>
							</h2>
							<div id="flush-collapseOne" class="accordion-collapse collapse"
								data-bs-parent="#accordionFlushExample">
								<div class="accordion-body">



									<c:forEach var="pl" items="${ playlist }">
										<li class="sidebar-list"
											onclick="sendMusicInfo('${pl.musName}', '${pl.musArt}', '${pl.musTime}', '${pl.albumPath}')">
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
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
									aria-expanded="false" aria-controls="flush-collapseTwo">
									재생목록 #2</button>
							</h2>
							<div id="flush-collapseTwo" class="accordion-collapse collapse"
								data-bs-parent="#accordionFlushExample">
								<div class="accordion-body">
									<li class="sidebar-list">
									<img class="pl-thumb" src="<%=contextPath%>/resources/images/default-albumArt.png">
										<div>
											<p class="pl-title">가나다라마바사아자차카타파하</p>
											<p class="pl-musician">Sia</p>
										</div></li>
									<li class="sidebar-list">
									<img class="pl-thumb" src="<%=contextPath%>/resources/images/default-albumArt.png">
										<div>
											<p class="pl-title">Snowman</p>
											<p class="pl-musician">Sia</p>
										</div></li>
									<li class="sidebar-list">
									<img class="pl-thumb" src="<%=contextPath%>/resources/images/default-albumArt.png">
										<div>
											<p class="pl-title">Snowman</p>
											<p class="pl-musician">Sia</p>
										</div></li>
									<li class="sidebar-list">
									<img class="pl-thumb" src="<%=contextPath%>/resources/images/default-albumArt.png">
										<div>
											<p class="pl-title">Snowman</p>
											<p class="pl-musician">Sia</p>
										</div></li>
								</div>
							</div>
						</div>




						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
									aria-expanded="false" aria-controls="flush-collapseThree">
									재생목록 #3</button>
							</h2>
							<div id="flush-collapseThree" class="accordion-collapse collapse"
								data-bs-parent="#accordionFlushExample">
								<div class="accordion-body">
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
									<li class="sidebar-list"><img class="pl-thumb"
										src="<%=contextPath%>/resources/images/temp.jpg">
										<div>
											<p class="pl-title">Road to Ruin</p>
											<p class="pl-musician">Mr.big</p>
										</div></li>
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