package com.kh.music.model.dao;

import java.util.ArrayList;

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

}
