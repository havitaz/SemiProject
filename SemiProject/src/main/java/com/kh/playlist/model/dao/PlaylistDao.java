package com.kh.playlist.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.playlist.model.vo.Playlist;

public class PlaylistDao {
	
	public ArrayList<Playlist> selectMusicTitleList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("playlistMapper.selectPlaylist");
	}
	
}
