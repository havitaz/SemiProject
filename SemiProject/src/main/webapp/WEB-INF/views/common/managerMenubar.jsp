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


    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
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
	 margin-inline-end: 10px;
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
                        <a href="<%=contextPath %>/music.bt" rel="wobble-vertical" class="music-btn">노래관리</a>
                        <a href="<%=contextPath %>/member.bt" rel="wobble-vertical"  class="member-btn">회원관리</a>
					</ul>
                </div>


        </div>
    </nav>
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
						data-bs-target="#loginModal">로그아웃</button>
				</div>
			</c:when>


			<c:otherwise>
				<div class="right-section">
					<div class="notifications-icon-container"></div>
					<button class="btn-login" data-bs-toggle="modal"
						data-bs-target="#loginModal" disabled>로그아웃</button>
				</div>
			</c:otherwise>
		</c:choose>
	</header>
</body>
</html>