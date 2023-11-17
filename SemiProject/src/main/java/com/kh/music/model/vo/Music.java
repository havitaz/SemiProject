package com.kh.music.model.vo;

import java.sql.Date;

public class Music {
	private int musNo;
	private String musName;
	private String musArt;
	private String musGen;
	private String musTime;
	private String musMv;
	private String status;
	private int count;
	private String albumPath;
	private Date enrollDate;
	private int rownum;
	private String filePath;
	private String changeName;
	private String originName;
	private int fileNo;
	
	public Music() {}

	
	
	public Music(int musNo, String musName, String musArt, String musGen, String musTime, String musMv, String status,
			int count, String albumPath, Date enrollDate, int rownum, String filePath, String changeName,
			String originName, int fileNo) {
		super();
		this.musNo = musNo;
		this.musName = musName;
		this.musArt = musArt;
		this.musGen = musGen;
		this.musTime = musTime;
		this.musMv = musMv;
		this.status = status;
		this.count = count;
		this.albumPath = albumPath;
		this.enrollDate = enrollDate;
		this.rownum = rownum;
		this.filePath = filePath;
		this.changeName = changeName;
		this.originName = originName;
		this.fileNo = fileNo;
	}



	public Music(String musName, String musArt, String musGen) {
		super();
		this.musName = musName;
		this.musArt = musArt;
		this.musGen = musGen;
	}

	
	
	public Music(int musNo, String musName, String musArt, String musGen, String musTime) {
		super();
		this.musNo = musNo;
		this.musName = musName;
		this.musArt = musArt;
		this.musGen = musGen;
		this.musTime = musTime;
	}



	public int getMusNo() {
		return musNo;
	}



	public void setMusNo(int musNo) {
		this.musNo = musNo;
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



	public String getMusGen() {
		return musGen;
	}



	public void setMusGen(String musGen) {
		this.musGen = musGen;
	}



	public String getMusTime() {
		return musTime;
	}



	public void setMusTime(String musTime) {
		this.musTime = musTime;
	}



	public String getMusMv() {
		return musMv;
	}



	public void setMusMv(String musMv) {
		this.musMv = musMv;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String getAlbumPath() {
		return albumPath;
	}



	public void setAlbumPath(String albumPath) {
		this.albumPath = albumPath;
	}



	public Date getEnrollDate() {
		return enrollDate;
	}



	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}



	public int getRownum() {
		return rownum;
	}



	public void setRownum(int rownum) {
		this.rownum = rownum;
	}



	public String getFilePath() {
		return filePath;
	}



	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}



	public String getChangeName() {
		return changeName;
	}



	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	

	public String getOriginName() {
		return originName;
	}




	public void setOriginName(String originName) {
		this.originName = originName;
	}



	public int getFileNo() {
		return fileNo;
	}



	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}



	@Override
	public String toString() {
		return "Music [musNo=" + musNo + ", musName=" + musName + ", musArt=" + musArt + ", musGen=" + musGen
				+ ", musTime=" + musTime + ", musMv=" + musMv + ", status=" + status + ", count=" + count
				+ ", albumPath=" + albumPath + ", enrollDate=" + enrollDate + ", rownum=" + rownum + ", filePath="
				+ filePath + ", changeName=" + changeName + ", originName=" + originName + ", fileNo=" + fileNo + "]";
	}
	
	
	
	
}