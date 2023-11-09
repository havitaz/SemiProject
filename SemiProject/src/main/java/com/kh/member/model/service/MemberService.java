package com.kh.member.model.service;

import com.kh.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);
	int insertMember(Member m);
	Member searchMember(Member m);
	Member searchMemberPwd(Member m);
}
