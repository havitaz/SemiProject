package com.kh.playlist.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.playlist.model.vo.Playlist;

public class PlaylistDao {
	
	public ArrayList<Playlist> selectPlaylist(SqlSession sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("playlistMapper.selectPlaylist", memberNo);
	}
	
	public int insertPlayList(SqlSession sqlSession, Playlist p) {
		return sqlSession.insert("playlistMapper.insertPlayList", p);
	}
	
}
