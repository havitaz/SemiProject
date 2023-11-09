package com.kh.music.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.music.model.vo.Music;

public class MusicDao {
	
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("musicMapper.selectListCount");
	}
	
	public ArrayList<Music> selectList(SqlSession sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		ArrayList<Music> list = (ArrayList)sqlSession.selectList("musicMapper.selectList", null, rowBounds);
		return list;
	}

	
	public ArrayList<Music> selectMusicTitleList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("musicMapper.selectMusicTitleList");
	}
	
	public ArrayList<Music> selectNewList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("musicMapper.selectNewList");
	}
	
	public ArrayList<Music> selectSearchMusic(SqlSession sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("musicMapper.selectSearchMusic", map);
	}
	
}
