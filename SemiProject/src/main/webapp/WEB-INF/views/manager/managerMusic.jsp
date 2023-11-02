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
                                    <input class="left-area-div-input" type="text" name="musicText" value="노래검색"/>
                                    <button class="music-search">검색</button>
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
                    
                </div>
 
                <div class="right-area">
                    <h2>노래 상세정보</h2>
                    <div>
                        노래제목 <input type="text" name="musicTitle"/>
                        가수 <input type="text" name="artist"/>
                        장르 <input type="text" name="genre"/>
                    </div>
                </div>

        
</body>
</html>