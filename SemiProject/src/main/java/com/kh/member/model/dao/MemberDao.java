package com.kh.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Member;

public class MemberDao {
	
	public Member loginMember(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
}
