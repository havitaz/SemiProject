package com.kh.music.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.common.model.vo.PageInfo;
import com.kh.common.template.Attachment;
import com.kh.music.model.vo.Music;

public interface MusicService {
	
	//TOP100조회(리스트)
	public int selectListCount();
	public ArrayList<Music> selectList(PageInfo pi);
	
	//관리자 노래제목 리스트
	ArrayList<Music> selectMusicTitleList();
	
	//관리자 노래 검색
	ArrayList<Music> selectSearchMusic(HashMap<String,String> map);
	
	//관리자 노래 상세정보조회
	Music selectDetailMusic(int musNo);
	
	//관리자 노래 추가
	int insertMusic(Music m, Attachment at);
	
	//관리자 노래 수정
	int updateMusic(Music m, Attachment at);
	
	//관리자 노래 삭제
	int deleteMusic(int musNo);
	
	//최신곡 10곡 노래제목 리스트
	public ArrayList<Music> selectNewList();
	
	//조회수(담기횟수) 증가
	int addCount(int musNo);
}
