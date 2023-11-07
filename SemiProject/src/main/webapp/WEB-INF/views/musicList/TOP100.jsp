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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <link rel="stylesheet" href="<%=contextPath %>/resources/css/music/top100.css">
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
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
					<td><img src="resources/icon/musicAlbumCover/LoveLee.jpg"></td>
					<td style="text-align: left; font-weight: bolder;">${m.musName}</td>
					<td>${m.musArt}</td>
					<td>${m.musGen}</td>
					<td>${m.musTime}</td>
					<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
					<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
					<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
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
</body>
</html>