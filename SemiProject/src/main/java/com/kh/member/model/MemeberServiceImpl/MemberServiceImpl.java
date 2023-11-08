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
		
		sqlSession.close();
		return loginMember;
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


}
