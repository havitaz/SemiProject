package com.kh.member.model.vo;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String phone;
	private String email;
	private String status;
	
	public Member() {
		
	}

	public Member(int memberNo, String memberId, String memberPwd, String phone, String email, String status) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.phone = phone;
		this.email = email;
		this.status = status;
	}

	public Member(String memberId, String memberPwd, String phone, String email) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.phone = phone;
		this.email = email;
	}
	

	public Member(String phone, String email) {
		super();
		this.phone = phone;
		this.email = email;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", phone="
				+ phone + ", email=" + email + ", status=" + status + "]";
	}
	
	
}
