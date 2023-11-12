package com.kh.playlist.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.common.template.Template;
import com.kh.playlist.model.dao.PlaylistDao;
import com.kh.playlist.model.vo.Playlist;

public class PlaylistServiceImpl implements PlaylistService{
	private PlaylistDao pDao = new PlaylistDao();
	
	@Override
	public ArrayList<Playlist> selectPlaylist(int memberNo) {
		SqlSession sqlSession = Template.getSqlSession();
	    ArrayList<Playlist> playlist = null;

	    try {
	        playlist = pDao.selectPlaylist(sqlSession, memberNo);
	    } finally {
	        if (sqlSession != null) {
	            sqlSession.close();
	        }
	    }

	    return playlist;
	}

	@Override
	public int insertPlayList(Playlist p) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = pDao.insertPlayList(sqlSession , p);
		
		sqlSession.close();
		return result;
	}

}
