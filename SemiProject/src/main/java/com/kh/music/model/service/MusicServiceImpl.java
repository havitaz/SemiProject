package com.kh.music.model.service;

import java.util.ArrayList;

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

}
