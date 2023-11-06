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
		  <link rel="stylesheet" href="<%=contextPath %>/resources/css/manager/manager_member.css">
		 
                <div class="all">
                    <div class="left">
                        <div class = "headerList">
                            <div class="left-area">
                                <div class ="left-area-div">
                                    <input class="left-area-div-input" type="text" name="memberText" placeholder="회원 검색"/>
                                    <a href=""><img class="member-search" src="<%=contextPath %>/resources/icon/manager/search_item.png" width="30"></a>
                                </div>
                            </div>
                        </div>
                        <div class="bodyList">
                            <div class="list-member">
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="member-title">철수</li>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="member-title">짱구</li>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="member-title">유리</li>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="member-title">수지</li>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="member-title">맹구</li>
                                </div>
                                <hr>
                                <div  class ="left-list-div">
                                    <input type="image" src="<%=contextPath %>/resources/images/member.jpg">
                                    <li class="member-title">원장쌤</li>
                                </div>
                                <hr>
                            </div>
                        </div>
                    </div>
                    
                    <div class="right">
                        <div class="right-area" align="center">
                            <h1 style="color: #41382b; margin-top: 90px;">회원 정보</h1>

                            <form id="inputInfo" class="form-horizontal">
                                    <div class="member-info-class">
                                        <div>
                                            <label for="memInfo" style="margin-right: 45px;">아이디</label>
                                            <input type="text" id="memInfo" placeholder="짱구" readonly/><br>
                                        </div>

                                        <div>
                                            <label for="memInfo" style="margin-right: 45px;">이메일</label>
                                            <input type="text" id="memInfo" placeholder="jjanggu@naver.com" readonly/><br>
                                        </div>
                                        
                                        <div>
                                            <label for="memInfo" style="margin-right: 30px;">전화번호</label>
                                            <input type="text" id="memInfo" placeholder="010-1234-5678" readonly/><br>
                                        </div>
                                    </div>
                            </form>


                            <div class="deleteButton">
                                <div><button type="button" class="deleteBtnMem ">강제탈퇴</button></div>
                            </div>
                        
                        </div>
                    </div>
                </div>
 
    
        
</body>
</html>