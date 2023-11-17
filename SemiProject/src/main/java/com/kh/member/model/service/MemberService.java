package com.kh.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.member.model.vo.Member;
import com.kh.music.model.vo.Music;

public interface MemberService {
	
	Member loginUser(Member m);
	int insertMember(Member m);
	Member searchMember(Member m);
	Member searchMemberPwd(Member m);
	int idCheck(String checkId);
	ArrayList<Music> selectTopList();
	Member updateMember(Member m);
	
	//관리자 회원 리스트
	ArrayList<Member> selectMemberTitleList();
	
	//관리자 회원검색
	ArrayList<Member> selectSearchMember(HashMap<String,String> map);
	
	//관리자 회원정보조회
	Member selectDetailMember(int memberNo);
	
	//관리자 회원 삭제
	int deleteMember(int memberNo);
}
