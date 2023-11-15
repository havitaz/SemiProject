<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% 
    	String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TOP100</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<%=contextPath %>/resources/css/music/top100.css">
 </head>
<body>

	<jsp:include page="../common/menubar-test.jsp"/>
	
	<h1 style="color: black; margin-bottom: 0px;">TOP 100 ></h1>
	<hr style="color: black;">
	<table id="top100" style="border-collapse: collapse;">
		<thead>
			<tr height="45;">
				<th width="5%">NO</th>
				<th colspan="2">노래</th>
				<th width="17%">&#10073; 아티스트</th>
				<th width="17%">&#10073; 장르</th>
				<th width="7%">&#10073; 재생시간</th>
				<th width="6%">재생</th>
				<th width="6%">담기</th>
				<th width="6%">MV</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${ list }">
				<tr class="music-row">
					<td>${m.rownum} </td>
				
					<td colspan=2 style="text-align: center; font-weight: bolder;">
						<div style="display: flex; align-items: center; justify-content: flex-start;"><img style="width: 48px; height: 48px; margin-left: 8px; margin-right: 3px; margin-bottom: 3px;" src="${m.filePath}${m.changeName}"> 
								&nbsp;&nbsp;&nbsp;${m.musName}
						</div>
					</td>
					<td>${m.musArt}</td>
					<td>${m.musGen}</td>
					<td>${m.musTime}</td>
					<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
					<td><a href="insert.pl?memberNo=${loginUser.memberNo}&musNo=${m.musNo}&cpage=${pi.currentPage}" onclick="refreshList"><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
					<c:choose>
						<c:when test="${not empty m.musMv}">
							<td><a target="_blank" href="${m.musMv}"><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
						</c:when>
						<c:otherwise>
							<td><a href="#"><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br><br>
	
	<div class="container mt-3">           
		<ul class="pagination justify-content-center">
			<c:if test="${pi.currentPage ne 1 }">
			<li class="page-item"><a class="page-link" href="list.mu?cpage=${pi.currentPage - 1 }">&#9665;</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
				<li class="page-item"><a class="page-link" href="list.mu?cpage=${i }">${i }</a></li>
			</c:forEach>
			
			<c:if test="${ pi.currentPage ne pi.maxPage}">
				<li class="page-item"><a class="page-link" href="list.mu?cpage=${ pi.currentPage + 1 }">&#9655;</a></li>
			</c:if>
		</ul>
	</div>
	
	<script>
		
	</script>
</body>
</html>