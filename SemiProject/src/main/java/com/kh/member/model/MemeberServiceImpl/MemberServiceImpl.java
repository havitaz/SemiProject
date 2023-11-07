package com.kh.member.model.MemeberServiceImpl;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.template.Template;
import com.kh.member.model.MemberDao.MemberDao;
import com.kh.member.model.MemberService.MemberService;
import com.kh.member.model.vo.Member;

public class MemberServiceImpl implements MemberService{
	
	private MemberDao mDao = new MemberDao();
	
	@Override
	public Member loginMember(Member m) {
		
		SqlSession sqlSession = Template.getSqlSession();
		
		Member loginMember = mDao.loginMember(sqlSession, m);
		
		sqlSession close;
		return loginMember;
	}

}
