package com.kh.playlist.model.service;

import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.playlist.model.vo.Playlist;

public interface PlaylistService {

	public ArrayList<Playlist> selectList(PageInfo pi);

	
}
