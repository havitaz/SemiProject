package com.kh.music.model.service;

import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.music.model.vo.Music;

public interface MusicService {
	
	//TOP100조회
	public int selectListCount();
	public ArrayList<Music> selectList(PageInfo pi);
}
