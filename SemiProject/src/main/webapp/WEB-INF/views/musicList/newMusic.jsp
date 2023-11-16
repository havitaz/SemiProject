<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String contextPath = request.getContextPath();
	String albumPath = "resources/icon/musicAlbumCover/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NEW-MUSIC</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">  
  
  <link rel="stylesheet" href="<%=contextPath %>/resources/css/music/newMusic.css">
  <style>
	.new-grid{
		align-items: center;
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		
	}
	.new-grid > ul{
		display: block;
		height: 280px;
		margin: 2%;
		padding: 1px;
	}
		
  </style>
</head>
<body>
	<jsp:include page="../common/menubar-test.jsp"/>
	
	<h1 style="color: black;">추천곡&gt;</h1>
	<hr style="color: black;">
	
	<table class="table" style="align-content: center; align-items: center;">
		<thead>
			<th style="background: transparent;"><!-- Bootstrap 5 Carousel -->
				<div id="demo1" class="carousel slide" data-bs-ride="carousel" style="width: 282px; height: 282px;">
					<!-- Indicators/dots -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
					</div>
					
					<!-- The slideshow/carousel -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="<%=albumPath %>Out of Time.jpg" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="<%=albumPath %>Bad guy.jpg" class="d-block w-100">
						</div>
					</div>
					
					<!-- Left and right controls/icons -->
					<button class="carousel-control-prev" type="button" data-bs-target="#demo1" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#demo1" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>
			</th>
			<th style="background: transparent;"><!-- Bootstrap 5 Carousel -->
				<div id="demo2" class="carousel slide" data-bs-ride="carousel" style="width: 282px; height: 282px;">
					<!-- Indicators/dots -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
					</div>
					
					<!-- The slideshow/carousel -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="<%=albumPath %>푸르름이 사는 곳.jpg" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="<%=albumPath %>Sakayme.jpg" class="d-block w-100">
						</div>
					</div>
					
					<!-- Left and right controls/icons -->
					<button class="carousel-control-prev" type="button" data-bs-target="#demo2" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#demo2" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>
			</th>
			<th style="background: transparent;"><!-- Bootstrap 5 Carousel -->
				<div id="demo3" class="carousel slide" data-bs-ride="carousel" style="width: 282px; height: 282px;">
					<!-- Indicators/dots -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
					</div>
					
					<!-- The slideshow/carousel -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="<%=albumPath %>Sgt. Pepper's Lonely Hearts Club Band.jpg" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="<%=albumPath %>Long, Long Way from Home.jpg" class="d-block w-100">
						</div>
					</div>
					
					<!-- Left and right controls/icons -->
					<button class="carousel-control-prev" type="button" data-bs-target="#demo3" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#demo3" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>
			</th>
			<th style="background: transparent;"><!-- Bootstrap 5 Carousel -->
				<div id="demo" class="carousel slide" data-bs-ride="carousel" style="width: 282px; height: 282px;">
					<!-- Indicators/dots -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
					</div>
					
					<!-- The slideshow/carousel -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="<%=albumPath %>Vancouver.jpg" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="<%=albumPath %>D.jpg" class="d-block w-100">
						</div>
					</div>
					
					<!-- Left and right controls/icons -->
					<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>
			</th>
		</thead>
	</table>
	<br>
	<h1 style="color: black;">최신곡&gt;</h1>
	<hr style="color: black;">
	<br>
	<div class="new-grid">
		<c:forEach var="n" items="${ list }">
				<ul style="color: black; width: 180px;">
					<li><img style="width: 180px; height: 180px;" src="${n.filePath}${n.changeName}"></li>
					<li style="font-weight: bold; font-size: 17px">${n.musName}</li>
					<li style="font-size: 14px">${n.musArt}</li>
				</ul>
		</c:forEach>
	</div>
</body>
</html>