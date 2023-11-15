<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
		 <%@ include file="../common/managerMenubar.jsp" %>
		  <link rel="stylesheet" href="<%=contextPath %>/resources/css/manager/manager_music.css">
		 
                <div class="all">
                    <div class="left" >
                        <div class = "headerList">
                            <div class="left-area">
                            
                                <div class ="left-area-div">
                                    <input class="left-area-div-input" onkeyup="searchBtn(event)" type="text" name="keyword" placeholder="노래 검색" value="${keyword}"/>
                                    <img class="music-search" src="<%=contextPath %>/resources/icon/manager/search_item.png" width="30">
                                </div>
                                
                            </div>
                        </div>
						<script>
                        
						//노래 검색
                        function searchBtn(e){
	                         if(e.keyCode === 13){

                            		$.ajax({
 						 				url: "<%=contextPath %>/search.mu",
 						 				data : {
 						 					keyword : document.querySelector(".left-area-div-input").value
 						 				},
						 				success: function(result) {
 						 					
 						 					let str ="";
 						 					for(let r of result) {
 						 						str += '<div  class ="left-list-div">' + '<input type="image" src="' + r.filePath + r.changeName + '"/>'
 						 							   + '<a onclick="postFormSubmit('+ r.musNo + ')" style="text-decoration: none;">'
 						 							   + '<li class="music-title">'+ r.musName +'</li></a>'
 						 							   + '</div>' + '<hr>'
 						 							   
 						 							  
 						 					}
 						 					
 						 					document.querySelector(".list-music").innerHTML = str;
 						 					
 						 				},
 						 				
 	                                    error: function(){
                                        	console.log("리스트 조회 안됨");
                                    }
                                })
		            		} 
                        }
						</script>

                        <div class="bodyList">
                            <div class="list-music">

                            </div>
                        </div>
                    </div>
                   
                    <div class="right">
                        <div class="right-area" align="center">
                            <h1 style="color: #41382b; margin-top: 50px;">노래 상세정보</h1>

                            <form id="inputInfo" class="form-horizontal">
                                    <div class="music-info-class">
                                        <div>
                                            <label for="musicInfo" style="margin-right: 35px;">노래제목</label>
                                            <input type="text" id="musicInfo" readonly/>
                                        </div>
                                        
                                        <div>
                                            <label for="musicInfo" style="margin-right: 70px;">가수</label>
                                            <input type="text" id="musicInfo"readonly/>
                                        </div>
                                        
                                        <div>
                                            <label for="musicInfo" style="margin-right: 70px;">장르</label>
                                            <input type="text" id="musicInfo"readonly/>
                                        </div>

                                        <div>
                                            <label for="musicInfo" style="margin-right: 35px;">재생시간</label>
                                            <input type="text" id="musicInfo"readonly/>
                                        </div>
                                    </div>
                            </form>

 						<script>
 						 	window.onload = function(){
 									musicList();	
 							}
 						 	
 						 	//노래 리스트
 						 	function musicList() {
 						 			$.ajax({
 						 				url: "<%=contextPath %>/music.li",
 						 			
 						 				success: function(result) {

 						 					let str ="";
 						 					for(let r of result) {
 						 						str += '<div  class ="left-list-div">' + '<input type="image" src="' + r.filePath + r.changeName + '"/>'
 						 							   + '<a onclick="postFormSubmit('+ r.musNo + ')" style="text-decoration: none;">'
 						 							   + '<li class="music-title">'+ r.musName +'</li></a>'
 						 							   + '</div>' + '<hr>'
 						 					}
 						 					
 						 					document.querySelector(".list-music").innerHTML = str;
 						 					
 						 				},
 						 				
 	                                    error: function(){
                                        	console.log("리스트 조회 안됨");
                                    }
                                })
		            		} 
 							
 							
 						
		            		function postFormSubmit(num) {
                                $.ajax({
                                    url: "<%=contextPath %>/detail.mu",
                                    data : {
                                    		mno : num
                                    	},
                                    success: function(result){				
            							 	//노래 상세정보
            								let str = "";
            								str += '<input type="hidden" name="mno" value="' + result.musNo + '"/>'
            										+ '<div>' + '<label for="musicInfo" style="margin-right: 35px;">노래제목</label>' 
            										+ '<input type="text" id="musicInfo" value="' + result.musName + '"readonly/>' + ' </div>'
            										+ '<div>' + '<label for="musicInfo" style="margin-right: 70px;">가수</label>'
            										+ ' <input type="text" id="musicInfo" value="' + result.musArt + '" readonly/>' + ' </div>'
            										+ '<div>' + '<label for="musicInfo" style="margin-right: 70px;">장르</label>'
            										+ '<input type="text" id="musicInfo" value="' + result.musGen + '" readonly/>' + ' </div>'
            										+ '<div>' + '<label for="musicInfo" style="margin-right: 35px;">재생시간</label>'
            										+ '<input type="text" id="musicInfo" value="' + result.musTime + '" readonly/>' + ' </div>'
            										
            										document.querySelector(".music-info-class").innerHTML = str;
            										
                                    	//노래 수정
                                    	let str2 = "";
                                    	str2 += '<input type="hidden" name="mno" value="' + result.musNo + '"/>'
                                    			 + '<div class="musicTitle">' +  '<label for="musicInfo" style="margin-right: 35px;">노래제목</label>'
                                    			 + '<input type="text" id="musicInfo_modal" name="musName" value="' + result.musName + '"/>' + '</div>'
                                    			 + '<div class="musicArtist">' + '<label for="musicInfo" style="margin-right: 70px;">가수</label>'
                                    			 + '<input type="text" id="musicInfo_modal"  name="musArt" value="' + result.musArt + '"/>'  + '</div>'
                                    			 + '<div class="musicGenre">' + '<label for="musicInfo" style="margin-right: 70px;">장르</label>'
                                    			 + '<input type="text" id="musicInfo_modal" name="musGen" value="' + result.musGen + '"/>' + '</div>'
                                    			 + '<div class="musicTime">' + '<label for="musicInfo" style="margin-right: 35px;">재생시간</label>'
                                    			 + '<input type="text" id="musicInfo_modal" name="musTime" value="' + result.musTime + '"/>' + '</div>'
                                    			 + '<div class="musicAlbumPath" id="musicAlbumPath">' + '<label for="musicInfo" style="margin-right: 70px; margin-top: 40px">커버사진</label>'
                                    			 + '<span>'+result.filePath + result.originName + "</span>"
                                                 + '<input type="file" name="upfile" style="display:none"/>'
                                                 + '</div>'
                                    			 + '<button type="submit" class="btnAdd">수정</button>' 
 	
                                    			 document.querySelector("#updateMusicModal").innerHTML = str2;
                                    			 const modifyFileBtn = document.querySelector("#musicAlbumPath > span");
                                                 modifyFileBtn.onclick = function(){
                                                    const fileInput = document.querySelector("#musicAlbumPath > input[type='file']");
                                                    fileInput.onchange = function(ev){
                                                        console.log(ev.target.files)
                                                        modifyFileBtn.innerHTML = ev.target.files[0].name;
                                                    }

                                                    fileInput.click();
                                                 }
                                    			 
                                    	//노래 삭제
                                    	let str3 = "";
                                			 str3 += '<input type="hidden" name="mno" value="' + result.musNo + '"/>'
                                    			 + '<div class="musicTitle">' +  '<label for="musicInfo" style="margin-right: 35px;">노래제목</label>'
                                    			 + '<input type="text" id="musicInfo_modal" name="musName" value="' + result.musName + '"readonly/>' + '</div>'
                                    			 + '<div class="musicArtist">' + '<label for="musicInfo" style="margin-right: 70px;">가수</label>'
                                    			 + '<input type="text" id="musicInfo_modal"  name="musArt" value="' + result.musArt + '"readonly/>'  + '</div>'
                                    			 + ' <div class="musicGenre">' + '<label for="musicInfo" style="margin-right: 70px;">장르</label>'
                                    			 + '<input type="text" id="musicInfo_modal" name="musGen" value="' + result.musGen + '"readonly/>' + '</div>'
                                    			 + ' <div class="musicTime">' + '<label for="musicInfo" style="margin-right: 35px;">재생시간</label>'
                                    			 + '<input type="text" id="musicInfo_modal" name="musTime" value="' + result.musTime + '"readonly/>' + '</div>'
                                    			 + '<div class="musicAlbumPath" id="musicAlbumPath">' + '<label for="musicInfo" style="margin-right: 70px; margin-top: 40px">커버사진</label>'
                                    			 + '<span>'+result.filePath + result.originName + "</span>"
                                                 + '<input type="file" name="upfile" style="display:none"/>'
                                                 + '</div>'
                                    			 + '<button type="submit" class="btnAdd">삭제</button>'		 
                                    			 
                                    			 document.querySelector("#deleteMusicModal").innerHTML = str3;
                                    	
                                        
                                    
                                    },
                                    error: function(){
                                        	console.log("리스트 조회 안됨");
                                    }
                                })
		            		} 
                   </script>
                    
 
                            <div class="musicButton">
                                <div>
                                    <!-- 모달영역 : 노래 추가-->
                                    <!-- Button to Open the Modal -->
                                    <button type="button" class="musicBtnAdd" data-bs-toggle="modal" data-bs-target="#myModal">노래추가</button>
                                        
                                    <!-- The Modal -->
                                    <div class="modal" id="myModal">
                                        <div class="modal-dialog modal-dialog-centered modal-lg">
                                            <div class="modal-content">
                                        
                                            <!-- Modal Header -->
                                            <div class="modal-header" style="background: rgb(199 167 135); color: white;">
                                                <h4 class="modal-title" >노래 추가페이지</h4>
                                                <button type="button" class="btn-close" style="color: ivory;" data-bs-dismiss="modal"></button>
                                            </div>
                                        
                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                <form action="insert.mu" method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="rno" value="' + result.musNo + '"/>
                                                    <div class="musicTitle">
                                                        <label for="musicInfo" style="margin-right: 35px;">노래제목</label>
                                                        <input type="text" id="musicInfo_modal" name="musName" placeholder="내용을 입력하세요."/>
                                                    </div>
                                                    <div class="musicArtist">
                                                        <label for="musicInfo" style="margin-right: 70px;">가수</label>
                                                        <input type="text" id="musicInfo_modal" name="musArt"  placeholder="내용을 입력하세요."/>
                                                    </div>
                                                    <div class="musicGenre">
                                                        <label for="musicInfo" style="margin-right: 70px;">장르</label>
                                                        <input type="text" id="musicInfo_modal" name="musGen" placeholder="내용을 입력하세요."/>
                                                    </div>
                                                     <div class="musicTime">
                                                        <label for="musicInfo" style="margin-right: 35px;">재생시간</label>
                                                        <input type="text" id="musicInfo_modal" name="musTime" placeholder="내용을 입력하세요."/>
                                                    </div>
                                                    <div class="musicAlbumPath">
                                                        <label for="musicInfo" style="margin-right: 70px; margin-top: 40px">커버사진</label>    
                                                        <input type="file" name="upfile"/>
                                                    </div>
                                                    <button type="submit" class="btnAdd">추가</button>
                                                </form>
                                            </div>
                                
                                        </div>
                                    </div>
                                </div>


                                <div>
                                    <!-- 모달영역 : 노래 수정-->
                                    <!-- Button to Open the Modal -->
                                    <button type="button" class="musicBtnUpdate" data-bs-toggle="modal" data-bs-target="#myModalUpdate">노래수정</button>
     
                                    <!-- The Modal -->
                                    <div class="modal" id="myModalUpdate">
                                        <div class="modal-dialog modal-dialog-centered modal-lg">
                                            <div class="modal-content">
                                        
                                            <!-- Modal Header -->
                                            <div class="modal-header" style="background: rgb(199 167 135); color: white;">
                                                <h4 class="modal-title" >노래 수정페이지</h4>
                                                <button type="button" class="btn-close" style="color: ivory;" data-bs-dismiss="modal"></button>
                                            </div>
                                        
                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                <form action="<%=contextPath %>/update.mu" id="updateMusicModal">
                                                  
                                                </form>
                                            </div>
                                
                                        </div>
                                    </div>
                                </div>






                                <div>
                                    <!-- 모달영역 : 노래 삭제-->
                                    <!-- Button to Open the Modal -->
                                    <button type="button" class="musicBtnDelete" data-bs-toggle="modal" data-bs-target="#myModalDelete">노래삭제</button>
     
                                    <!-- The Modal -->
                                    <div class="modal" id="myModalDelete">
                                        <div class="modal-dialog modal-dialog-centered modal-lg">
                                            <div class="modal-content">
                                        
                                            <!-- Modal Header -->
                                            <div class="modal-header" style="background: rgb(199 167 135); color: white;">
                                                <h4 class="modal-title" >노래 삭제페이지</h4>
                                                <button type="button" class="btn-close" style="color: ivory;" data-bs-dismiss="modal"></button>
                                            </div>
                                        
                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                <form action= "<%=contextPath %>/delete.mu" id="deleteMusicModal">
                                            
                                                </form>
                                            </div>
                                
                                        </div>
                                    </div>
                                </div>
                                </div>
                        
                            </div>
                        </div>
    
        
</body>
</html>