<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>
		 <%@ include file="../common/managerMenubar.jsp" %>
		  <link rel="stylesheet" href="<%=contextPath %>/resources/css/manager/manager_music.css">
		 
                <div class="all">
                    <div class="left">
                        <div class = "headerList">
                            <div class="left-area">
                                <div class ="left-area-div">
                                    <input class="left-area-div-input" type="text" name="musicText" placeholder="노래 검색"/>
                                    <a href=""><img class="music-search" src="<%=contextPath %>/resources/icon/manager/search_item.png" width="30"></a>
                                </div>
                            </div>
                        </div>

                        <div class="bodyList">
                            <div class="list-music">
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="music-title">D</li>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="music-title">잊어버리지마(feat.태연)</li>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="music-title">Bye Bye my Blue</li>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="music-title">곁에 있어줘(feat.원슈타인)</li>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="music-title">Boat</li>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="music-title">양화대교</li>
                                </div>
                                <hr>
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
                                            <input type="text" id="musicInfo" placeholder="Vancouver" readonly/>
                                        </div>
                                        
                                        <div>
                                            <label for="musicInfo" style="margin-right: 70px;">가수</label>
                                            <input type="text" id="musicInfo" placeholder="BIG Naughty(서동현)" readonly/>
                                        </div>
                                        
                                        <div>
                                            <label for="musicInfo" style="margin-right: 70px;">장르</label>
                                            <input type="text" id="musicInfo" placeholder="R&B" readonly/>
                                        </div>

                                        
                                    </div>
                            </form>


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
                                                <form action="/action_page.php">
                                                    <div class="musicTitle">
                                                        <label for="musicInfo" style="margin-right: 35px;">노래제목</label>
                                                        <input type="text" id="musicInfo_modal" placeholder="내용을 입력하세요."/>
                                                    </div>
                                                    <div class="musicArtist">
                                                        <label for="musicInfo" style="margin-right: 70px;">가수</label>
                                                        <input type="text" id="musicInfo_modal" placeholder="내용을 입력하세요."/>
                                                    </div>
                                                    <div class="musicgenre">
                                                        <label for="musicInfo" style="margin-right: 70px;">장르</label>
                                                        <input type="text" id="musicInfo_modal" placeholder="내용을 입력하세요."/>
                                                        </label>
                                                    </div>
                                                    <button type="button" class="btnAdd">추가</button>
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
                                                <form action="/action_page.php">
                                                    <div class="musicTitle">
                                                        <label for="musicInfo" style="margin-right: 35px;">노래제목</label>
                                                        <input type="text" id="musicInfo_modal" placeholder="Trip(feat. Hannah)"/>
                                                    </div>
                                                    <div class="musicArtist">
                                                        <label for="musicInfo" style="margin-right: 70px;">가수</label>
                                                        <input type="text" id="musicInfo_modal" placeholder="릴러말즈" />
                                                    </div>
                                                    <div class="musicgenre">
                                                        <label for="musicInfo" style="margin-right: 70px;">장르</label>
                                                        <input type="text" id="musicInfo_modal" placeholder="R&B"/>
                                                        </label>
                                                    </div>
                                                    <button type="button" class="btnAdd">수정</button>
                                                </form>
                                            </div>
                                
                                        </div>
                                    </div>
                                </div>






                                <div>
                                    <!-- 모달영역 : 노래 수정-->
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
                                                <form action="/action_page.php">
                                                    <div class="musicTitle">
                                                        <label for="musicInfo" style="margin-right: 35px;">노래제목</label>
                                                        <input type="text" id="musicInfo_modal" placeholder="곁에 있어줘(feat. 원슈타인)" readonly/>
                                                    </div>
                                                    <div class="musicArtist">
                                                        <label for="musicInfo" style="margin-right: 70px;">가수</label>
                                                        <input type="text" id="musicInfo_modal" placeholder="SOLE(쏠)" readonly/>
                                                    </div>
                                                    <div class="musicgenre">
                                                        <label for="musicInfo" style="margin-right: 70px;">장르</label>
                                                        <input type="text" id="musicInfo_modal" placeholder="R&B" readonly/>
                                                        </label>
                                                    </div>
                                                    <button type="button" class="btnAdd">삭제</button>
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