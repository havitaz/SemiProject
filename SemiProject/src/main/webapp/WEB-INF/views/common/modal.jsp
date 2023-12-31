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



.modal-backdrop {	z-index: 0;
}
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
            		
            		
            		</c:otherwise>
            	</c:choose>	
            
            

                
                
                
                
                
                
            </div>
            
            
            
			<div class="volume">
			
			
             	    <c:choose>
                		<c:when test="${ !empty loginUser }">              
              				  <img class="vol-btn" src="<%=contextPath %>/resources/icon/menubarIcon/mute.png"/>               
                		</c:when>
                		                		               		
                		<c:otherwise>	
              				  <img class="vol-btn" src="<%=contextPath %>/resources/icon/menubarIcon/vol.png"/>                         		
                	    </c:otherwise>  
					</c:choose>
                
                
				<input type="range" min="0" max="100" step="0.5">
			</div>
			
			<script>
			  function changeImage() {
			    var img = document.getElementsByClassName('vol-btn')[0];
			    if (img.getAttribute('src') === '<%=contextPath %>/resources/icon/menubarIcon/mute.png') {
			      img.setAttribute('src', '<%=contextPath %>/resources/icon/menubarIcon/vol.png');
			    } else {
			      img.setAttribute('src', '<%=contextPath %>/resources/icon/menubarIcon/mute.png');
			    }
			  }
			</script>
			
			
			
        </div>
  
        <div class="right-section">
            <div class="notifications-icon-container">    
            </div>
            <button class="btn-login" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
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


										                 <!-- loginModal -->
														 <div class="modal" id="loginModal" style="color: black;">
															<div class="modal-dialog modal-dialog-centered">
																<div class="modal-content">
							
																	<!-- Modal Header-->
																	<div class="modal-header">
																			<h4>
																			Quokka Player
																			<br>
																			Login
																			</h4>
																			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
																	</div>
							
															<!-- Modal body -->
															<div class="modal-body" align="center">
															<form action="login.me" method="post">
																<table>
																	<tr>
																		<td>아이디</td>
																		<td><input type="text" name="MemberId"></td>
																	</tr>
																	<tr>
																		<td>
																			비밀번호
																		</td>
																		<td><input type="password" name="MemberPwd"></td>
																	</tr>
																	<tr colspan="2" align="center">
																	<td>
																		<button type="submit">로그인</button>
																	</td>
																	</tr>
																</table>
															</form>
															</div>
							
															<!-- Modal footer -->
															<div class="modal-footer" align="center">
																<a href="<%=contextPath %>/insertPage.me">회원가입</a>
																<a href="<%=contextPath %>/selectId.me">아이디찾기</a>
																<a href="<%=contextPath %>/selectPwd.me">비밀번호찾기</a>
															</div>
														</div>
													</div>
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
             		<c:when test="${ !empty loginUser }">  

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
							
							
							
							
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
							        재생목록 #2
							      </button>
							    </h2>
							    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
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
			 		</c:otherwise>             			 
				</c:choose> 
			 	     	<!-- 로그인 전 -->      
		</div>

    </nav>
    
    
    
    <script>
    	        onload = function(){
            mute();
        }


        // 음소거
        function mute(){
            
            $.ajax({
                url : "off.pl",
                data : {
                    
                    
                },
                success: function(res){
                    let str1 = "";
                    if(res){  
                        str1 += '<img src="../../resources/icon/menmubarIcon/vol.png" alt=" 음소거 제거" class="vol" onclick="removeMute()">'
                    } else {  
                        str1 += '<img src="../../resources/icon/menmubarIcon/mute.png" alt=" 음소거" class="vol" onclick="mute()">'
                    }
                    document.querySelector(".vol-btn").innerHTML = str1;

                },
                error : function(){
                    console.log("실패");
                }
            })
        }



        // 음소거 취소
        function removeMute(){
            $.ajax({
                url : "remove.li",
                data : {
                    memNo : "${loginUser.memberNo}"
                },
                success: function(res){
                    mute();
                },
                error : function(){
                    console.log("실패");
                }
            })
        }
        
        // 소리켜기
        function mute(){
            $.ajax({
                url : "on.li",
                data : {
                    memNo : "${loginUser.userNo}"
                },
                success: function(res){
                    mute();
                },
                error : function(){
                    console.log("=실패");
                }
            })
        }
     </script>
</body>
</html>
