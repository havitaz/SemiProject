package com.kh.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Member;

public class MemberDao {
	
	public Member loginUser(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginUser", m);
	}
	
	public int insertMember(SqlSession sqlSession, Member m) {
		int result = sqlSession.insert("memberMapper.insertMember", m);
		return result;
	}
		
	public Member searchMember(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchMember", m);
	}
	
	public Member searchMemberPwd(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchMemberPwd", m);
	}
}
