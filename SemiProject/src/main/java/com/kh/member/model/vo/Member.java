package com.kh.member.model.vo;

public class Member {
	
	private int memNo;
	private String memId;
	private String memPwd;
	private String phone;
	private String email;
	private String status;
	
	public Member() {}
	
	public Member(int memNo, String memId, String memPwd, String phone, String email, String status) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.phone = phone;
		this.email = email;
		this.status = status;
	}

	

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
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
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", phone=" + phone + ", email="
				+ email + ", status=" + status + "]";
	}	

		
}
