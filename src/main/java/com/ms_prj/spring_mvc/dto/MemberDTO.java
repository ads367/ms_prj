package com.ms_prj.spring_mvc.dto;

public class MemberDTO {

	private int memberIDX;
	private String memberID;
	private String memberPassword;
	private String memberName;
	private String memberAddr;
	private String memberEmail;
	private String regDate;
	
	public int getMemberIDX() {
		return memberIDX;
	}
	public void setMemberIDX(int memberIDX) {
		this.memberIDX = memberIDX;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
}
