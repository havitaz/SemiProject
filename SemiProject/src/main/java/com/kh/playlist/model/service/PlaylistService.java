package com.kh.playlist.model.service;

import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.playlist.model.vo.Playlist;

public interface PlaylistService {

	//플레이리스트 목록 조회
	ArrayList<Playlist> selectPlaylist(int memberNo);

	//플레이리스트에 노래 추가
	int insertPlayList(Playlist p);

}
