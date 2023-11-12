package com.kh.music.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.common.template.Template;
import com.kh.music.model.dao.MusicDao;
import com.kh.music.model.vo.Music;

public class MusicServiceImpl implements MusicService{
	private MusicDao mDao = new MusicDao();

	@Override
	public int selectListCount() {
		SqlSession sqlSession = Template.getSqlSession();
		int listCount = mDao.selectListCount(sqlSession);
		sqlSession.close();
		return listCount;
	}

	@Override
	public ArrayList<Music> selectList(PageInfo pi) {
		
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Music> list = mDao.selectList(sqlSession, pi);
		sqlSession.close();
		
		return list;
	}

	@Override
	public ArrayList<Music> selectMusicTitleList() {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Music> list = mDao.selectMusicTitleList(sqlSession);
		sqlSession.close();
		
		return list;
	}

	@Override
	public ArrayList<Music> selectNewList() {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Music> list = mDao.selectNewList(sqlSession);
		sqlSession.close();
		return list;
	}

	@Override
	public ArrayList<Music> selectSearchMusic(HashMap<String,String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Music> list = mDao.selectSearchMusic(sqlSession, map);
		sqlSession.close();
		return list;
	}

	@Override
	public Music selectDetailMusic(int musNo) {
		SqlSession sqlSession = Template.getSqlSession();
		Music m = mDao.selectDetailMusic(sqlSession, musNo);

		sqlSession.close();
		return m;
		
	}

	@Override
	public int insertMusic(Music m) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = mDao.insertMusic(sqlSession, m);
		
		if(result > 0) {
			sqlSession.commit();
		}
		sqlSession.close();
		
		return result;
		
	}

	@Override
	public int updateMusic(Music m) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = mDao.updateMusic(sqlSession, m);
		
		sqlSession.close();
		return result;
	}
	
	public int deleteMusic(int musNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = mDao.deleteMusic(sqlSession, musNo);
		
		sqlSession.close();
		return result;
	}

}
