<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#top100{
		border: 1px;
		text-align: center;
		width: 100%;
	}
	#top100 > thead > tr > th, #top100 > tbody > tr > td{
		font-size: medium;
		font-weight: bolder;
		color: black;
	}
	#top100 > thead > tr > th{
		border-bottom: 8px solid rgb(255, 252, 227);
	}
	#top100 > tbody > tr > td{
		height: 35px;
		padding-top: 10px;
		color: white;
	}
	#top100 > tbody > tr:hover{
		opacity: 0.9;
	}
	#top100 > tbody > tr > td > a > img:hover{
		scale: 1.2;
	}
	a{
	cursor: pointer;
	}
	
	.paging-area{
	color: black;
	font-size: 24px;
	}
	.music-row{
	background: rgba(77,58,44,0.7365);
	color: white;
	}
</style>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 style="color: black; margin-bottom: 0px;">TOP 100 ></h1>
	<hr>
	
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
			<tr class="music-row">
				<td>1</td>
				<td><img src="resources/icon/musicAlbumCover/LoveLee.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Love Lee</td>
				<td>AKMU(악뮤)</td>
				<td>댄스, 포크/블루스</td>
				<td>03:00</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr class="music-row">
				<td>2</td>
				<td><img src="resources/icon/musicAlbumCover/Baddie.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Baddie</td>
				<td>IVE(아이브)</td>
				<td>댄스, R&B/Soul</td>
				<td>02:35</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr class="music-row">
				<td>1</td>
				<td><img src="resources/icon/musicAlbumCover/LoveLee.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Love Lee</td>
				<td>AKMU(악뮤)</td>
				<td>댄스, 포크/블루스</td>
				<td>03:00</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr class="music-row">
				<td>2</td>
				<td><img src="resources/icon/musicAlbumCover/Baddie.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Baddie</td>
				<td>IVE(아이브)</td>
				<td>댄스, R&B/Soul</td>
				<td>02:35</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr class="music-row">
				<td>1</td>
				<td><img src="resources/icon/musicAlbumCover/LoveLee.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Love Lee</td>
				<td>AKMU(악뮤)</td>
				<td>댄스, 포크/블루스</td>
				<td>03:00</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr class="music-row">
				<td>2</td>
				<td><img src="resources/icon/musicAlbumCover/Baddie.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Baddie</td>
				<td>IVE(아이브)</td>
				<td>댄스, R&B/Soul</td>
				<td>02:35</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr class="music-row">
				<td>1</td>
				<td><img src="resources/icon/musicAlbumCover/LoveLee.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Love Lee</td>
				<td>AKMU(악뮤)</td>
				<td>댄스, 포크/블루스</td>
				<td>03:00</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr class="music-row">
				<td>2</td>
				<td><img src="resources/icon/musicAlbumCover/Baddie.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Baddie</td>
				<td>IVE(아이브)</td>
				<td>댄스, R&B/Soul</td>
				<td>02:35</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr class="music-row">
				<td>1</td>
				<td><img src="resources/icon/musicAlbumCover/LoveLee.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Love Lee</td>
				<td>AKMU(악뮤)</td>
				<td>댄스, 포크/블루스</td>
				<td>03:00</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
			<tr class="music-row">
				<td>2</td>
				<td><img src="resources/icon/musicAlbumCover/Baddie.jpg"></td>
				<td style="text-align: left; font-weight: bolder;">Baddie</td>
				<td>IVE(아이브)</td>
				<td>댄스, R&B/Soul</td>
				<td>02:35</td>
				<td><a href=""><img src="resources/icon/TOP100Icon/play_icon.png" width="27"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/add_icon_white.png" width="30"></a></td>
				<td><a href=""><img src="resources/icon/TOP100Icon/video_production_icon.png" width="30"></a></td>
			</tr>
		</tbody>
	</table>
	<br><br>
	
	<div class="paging-area" align="center">
		<a>&#9665;</a>
		<a>[1]</a>
		<a>[2]</a>
		<a>[3]</a>
		<a>[4]</a>
		<a>[5]</a>
		<a>&#9655;</a>
	</div>
</body>
</html>