package com.kh.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Member;
import com.kh.music.model.vo.Music;

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
	
	public int idCheck(SqlSession sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public ArrayList<Member> selectMemberTitleList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberTitleList");
	}
	
	public ArrayList<Member> selectSearchMember(SqlSession sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchMember", map);
	}
	
	public  Member selectDetailMember(SqlSession sqlSession, int memberNo){
		return  sqlSession.selectOne("memberMapper.selectDetailMember", memberNo);
	}
	
	public  int deleteMember(SqlSession sqlSession, int memberNo){
		return  sqlSession.update("memberMapper.deleteMember", memberNo);
	}
	public ArrayList<Music> selectTopList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("videoMapper.selectTopList");
	}
	
	public int updateMember(SqlSession sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public Member selectMember(SqlSession sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.selectMember", memberId);
	}
	
}
