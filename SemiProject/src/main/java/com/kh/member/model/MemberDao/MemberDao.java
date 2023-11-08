package com.kh.member.model.MemberDao;

import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Member;

public class MemberDao {
	
	public Member loginMember(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(SqlSession sqlSession, Member m) {
		int result = sqlSession.insert("memberMapper.insertMember", m);
		return result;
	}
		
	public Member SearchMember(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchMember");
	}
}
