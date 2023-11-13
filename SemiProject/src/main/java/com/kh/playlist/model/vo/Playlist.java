package com.kh.playlist.model.vo;

public class Playlist {
	private int musNo;
	private int memberNo;
	private String musName;
	private String musArt;
	private String musTime;
	private String albumPath;
	private String status;
	
	
	
	public Playlist() {}
	
	
	public Playlist(int musNo, int memberNo) {
		super();
		this.musNo = musNo;
		this.memberNo = memberNo;
	}



	public Playlist(int musNo, int memberNo, String musName, String musArt, String musTime, String albumPath,
			String status) {
		super();
		this.musNo = musNo;
		this.memberNo = memberNo;
		this.musName = musName;
		this.musArt = musArt;
		this.musTime = musTime;
		this.albumPath = albumPath;
		this.status = status;
	}
	
	
	public int getMusNo() {
		return musNo;
	}
	public void setMusNo(int musNo) {
		this.musNo = musNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMusName() {
		return musName;
	}
	public void setMusName(String musName) {
		this.musName = musName;
	}
	public String getMusArt() {
		return musArt;
	}
	public void setMusArt(String musArt) {
		this.musArt = musArt;
	}
	public String getMusTime() {
		return musTime;
	}
	public void setMusTime(String musTime) {
		this.musTime = musTime;
	}
	public String getAlbumPath() {
		return albumPath;
	}
	public void setAlbumPath(String albumPath) {
		this.albumPath = albumPath;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Playlist [musNo=" + musNo + ", memberNo=" + memberNo + ", musName=" + musName + ", musArt=" + musArt
				+ ", musTime=" + musTime + ", albumPath=" + albumPath + ", status=" + status + "]";
	}


	

}
