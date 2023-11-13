package com.kh.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.template.Template;
import com.kh.member.model.vo.Member;
import com.kh.music.model.vo.Music;
import com.kh.member.model.dao.MemberDao;

public class MemberServiceImpl implements MemberService{
	
	private MemberDao mDao = new MemberDao();
	
	@Override
	public Member loginUser(Member m) {
		
		SqlSession sqlSession = Template.getSqlSession();
		Member loginUser = mDao.loginUser(sqlSession, m);
		
		sqlSession.close();
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = mDao.insertMember(sqlSession, m);
		
		if(result > 0) {
			sqlSession.commit();
		}
		
		sqlSession.close();
		
		return result;
	}

	@Override
	public Member searchMember(Member m) {
		
		SqlSession sqlSession = Template.getSqlSession();
		
		Member searchMember = mDao.searchMember(sqlSession, m);
		
		return searchMember;
	}

	@Override
	public Member searchMemberPwd(Member m) {
		
		SqlSession sqlSession = Template.getSqlSession();
		
		Member searchMemberPwd = mDao.searchMemberPwd(sqlSession, m);
		
		return searchMemberPwd;
	}

	@Override
	public int idCheck(String checkId) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int count = new MemberDao().idCheck(sqlSession, checkId);
		
		return count;
	}

	@Override
	public ArrayList<Member> selectMemberTitleList() {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Member> list = mDao.selectMemberTitleList(sqlSession);
		sqlSession.close();
		
		return list;
	}

	@Override
	public ArrayList<Member> selectSearchMember(HashMap<String,String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Member> list = mDao.selectSearchMember(sqlSession, map);
		sqlSession.close();
		
		return list;
	}

	@Override
	public Member selectDetailMember(int memberNo) {
		SqlSession sqlSession = Template.getSqlSession();
		Member m = mDao.selectDetailMember(sqlSession, memberNo);

		sqlSession.close();
		return m;
	}

	@Override
	public int deleteMember(int memberNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = mDao.deleteMember(sqlSession, memberNo);
		
		if(result > 0) {
			sqlSession.commit();
		}
		
		sqlSession.close();
		return result;
	}
	public ArrayList<Music> selectTopList() {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Music> list = mDao.selectTopList(sqlSession);
		return list;
	}
//
//	@Override
//	public ArrayList<Music> selectTopList2() {
//		
//		return null;
//	}
	
	
}
