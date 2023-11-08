package com.kh.music.model.service;

import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.music.model.vo.Music;

public interface MusicService {
	
	//TOP100조회(리스트)
	public int selectListCount();
	public ArrayList<Music> selectList(PageInfo pi);
	
	//관리자 노래제목 리스트
	ArrayList<Music> selectMusicTitleList();
	
	//최신곡 10곡 노래제목 리스트
	public ArrayList<Music> selectNewList();
}
