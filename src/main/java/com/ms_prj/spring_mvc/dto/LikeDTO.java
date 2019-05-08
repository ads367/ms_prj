package com.ms_prj.spring_mvc.dto;

public class LikeDTO {
	
	private int likeIDX;
	private int boardIDX;
	private String memberID;
	private int like_Check;
	
	public int getLikeIDX() {
		return likeIDX;
	}
	public void setLikeIDX(int likeIDX) {
		this.likeIDX = likeIDX;
	}
	public int getBoardIDX() {
		return boardIDX;
	}
	public void setBoardIDX(int boardIDX) {
		this.boardIDX = boardIDX;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public int getLike_Check() {
		return like_Check;
	}
	public void setLike_Check(int like_Check) {
		this.like_Check = like_Check;
	}

}
