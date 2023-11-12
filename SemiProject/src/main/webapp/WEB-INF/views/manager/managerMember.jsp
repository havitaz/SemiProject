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

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
		 <%@ include file="../common/managerMenubar.jsp" %>
		  <link rel="stylesheet" href="<%=contextPath %>/resources/css/manager/manager_member.css">
		 
                <div class="all">
                    <div class="left">
                        <div class = "headerList">
                            <div class="left-area">
                            
                                <div class ="left-area-div">
                                    <input class="left-area-div-input" onkeyup="searchBtn(event)" type="text" name="memberText" placeholder="회원 검색" name="keyword" value="${keyword}"/>
                                    <img class="member-search" src="<%=contextPath %>/resources/icon/manager/search_item.png" width="30">
                                </div>
                            </div>
                        </div>
                        
                        <script>
                        function searchBtn(e){
	                         if(e.keyCode === 13){
	                         	
	                         		$.ajax({
 						 				url: "<%=contextPath %>/search.me",
 						 				data : {
 						 					keyword : document.querySelector(".left-area-div-input").value
 						 				},
 						 				success: function(result) {
 						 					console.log(result);

                                            let str ="";
 						 					for(let r of result) {
						 						str += '<div  class ="left-list-div">' + '<input type="image" src="'
					 							   + '<%=contextPath %>/resources/images/member.jpg">'
					 							   + '<a onclick="postFormSubmit('+ r.memberNo + ')" style="text-decoration: none;">'
					 							   + '<li class="member-title">'+ r.memberId +'</li></a>'
					 							   + '</div>' + '<hr>'	
 						 				
 						 				}
 						 
						 					document.querySelector(".list-member").innerHTML = str;
 						 					
						 				},
						 				
	                                    error: function(){
                                    		console.log("리스트 조회 안됨");
		                                }
		                            })
			            		} 
		                    }
 						</script>
                        
                        
                        <div class="bodyList">
                            <div class="list-member">
                            
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
                                            <input type="text" id="memInfo" readonly/><br>
                                        </div>

                                        <div>
                                            <label for="memInfo" style="margin-right: 45px;">이메일</label>
                                            <input type="text" id="memInfo"  readonly/><br>
                                        </div>
                                        
                                        <div>
                                            <label for="memInfo" style="margin-right: 30px;">전화번호</label>
                                            <input type="text" id="memInfo"  readonly/><br>
                                        </div>
                                    </div>
                            </form>
                            
                            <script>
 							
 						 	window.onload = function(){
 									memberList();	
 							}
 						 	
 						 	function memberList() {
 						 			$.ajax({
 						 				url: "<%=contextPath %>/member.li",
 						 			
 						 				success: function(result) {
 						 					console.log(result);
 						 					
 						 					let str ="";
 						 					for(let r of result) {
 						 						str += '<div  class ="left-list-div">' + '<input type="image" src="'
 						 							   + '<%=contextPath %>/resources/images/member.jpg">'
 						 							   + '<a onclick="postFormSubmit('+ r.memberNo + ')" style="text-decoration: none;">'
 						 							   + '<li class="member-title">'+ r.memberId +'</li></a>'
 						 							   + '</div>' + '<hr>'
 						 					}
 						 					
 						 					document.querySelector(".list-member").innerHTML = str;
 						 					
 						 				},
 						 				
 	                                    error: function(){
                                        	console.log("리스트 조회 안됨");
                                    }
                                })
		            		} 

                            function postFormSubmit(num) {
                                $.ajax({
                                    url: "<%=contextPath %>/detail.me?mno=" + num,
                                    data : {
                                    		mno : '${m.memberNo}'
                                    	},
                                    success: function(result){
                                        console.log(result);

                                        let str = "";
                                			 str += '<input type="hidden" name="mno" value="' + result.memberNo + '"/>'
												   + '<div>' + '<label for="memInfo" style="margin-right: 45px;">아이디</label>'
												   + '<input type="text" id="memInfo" value="' + result.memberId + '"readonly/>' + '</div>'
                                			 	   + '<div>' + '<label for="memInfo" style="margin-right: 45px;">이메일</label>'
                                			 	   + '<input type="text" id="memInfo" value="' + result.email + '"readonly/>' + '</div>'
                                			 	   + '<div>' + '<label for="memInfo" style="margin-right: 30px;">전화번호</label>'
                                			 	   + '<input type="text" id="memInfo" value="' + result.phone + '"readonly/>' + '</div>'
                                			 	   
                                    			 document.querySelector(".member-info-class").innerHTML = str;
							
                                    },
                                    error: function(){
                                        	console.log("리스트 조회 안됨");
                                    }
                                })
		            		} 
                   </script>

                            <div class="deleteButton">
                            	<div><button type="button" class="deleteBtnMem ">강제탈퇴</button></div>
                            </div>
                        
                        </div>
                    </div>
                </div>
 
    
        
</body>
</html>