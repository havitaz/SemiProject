<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
		 <%@ include file="../common/managerMenubar.jsp" %>
		  <link rel="stylesheet" href="<%=contextPath %>/resources/css/manager/managermusic.css">
		 
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
                                    <input type="image" src="<%=contextPath %>/resources/images/managerImage/loopy.jpeg">
                                    <div class="music-title">D</div>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/managerImage/loopy.jpeg">
                                    <div class="music-title">잊어버리지마(feat.태연)</div>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/managerImage/loopy.jpeg">
                                    <div class="music-title">Bye Bye my Blue</div>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/managerImage/loopy.jpeg">
                                    <div class="music-title">곁에 있어줘(feat.원슈타인)</div>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/managerImage/loopy.jpeg">
                                    <div class="music-title">Boat</div>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/managerImage/loopy.jpeg">
                                    <div class="music-title">양화대교</div>
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
                                        <input type="text" id="musicInfo" placeholder="노래제목"/>
                                        <input type="text" id="musicInfo" placeholder="가수"/>
                                        <input type="text" id="musicInfo" placeholder="장르"/>
                                    </div>
                            </form>


                            <div class="musicButton">
                                <div><button type="button" class="musicBtnAdd ">노래추가</button></div>
                                <div><button type="button" class="musicBtnUpdate">노래수정</button></div>
                                <div><button type="button" class="musicBtnDelete">노래삭제</button></div>
                            </div>
                        
                        </div>
                    </div>
                </div>
 
    
        
</body>
</html>