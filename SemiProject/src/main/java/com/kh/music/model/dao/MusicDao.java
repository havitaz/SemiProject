package com.kh.music.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.common.template.Attachment;
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
	
	public  Music selectDetailMusic(SqlSession sqlSession, int musNo){
		return  sqlSession.selectOne("musicMapper.selectDetailMusic", musNo);
	}
	
	public int insertMusic(SqlSession sqlSession, Music m) {
		return sqlSession.insert("musicMapper.insertMusic", m);
	}
	
	public int insertAttachment(SqlSession sqlSession, Attachment at) {
		return sqlSession.insert("musicMapper.insertAttachment", at);
	}
	
	public int updateMusic(SqlSession sqlSession, Music m) {
		return sqlSession.update("musicMapper.updateMusic", m);
	}
	
	public int updateAttachment(SqlSession sqlSession, Attachment at) {
		System.out.println(at);
		return sqlSession.update("musicMapper.updateAttachment", at);
	}
	
	public int deleteMusic(SqlSession sqlSession, int musNo) {
		return sqlSession.update("musicMapper.deleteMusic", musNo);
	}
	public int addCount(SqlSession sqlSession, int musNo) {
		return sqlSession.update("musicMapper.addCount", musNo);
	}
	
}