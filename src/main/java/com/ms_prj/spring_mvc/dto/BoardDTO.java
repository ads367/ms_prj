package com.ms_prj.spring_mvc.dto;

public class BoardDTO {
	
	private int boardIDX;
	private String boardTitle;
	private String boardContent;
	private String memberID;
	private String regDate;		// 작성일&수정일
	private int red_Count;		// 조회수
	private int boardAvailable;	// 삭제를 위한 변수
	private int like_Count;		// 좋아요 갯수
	
	public int getBoardIDX() {
		return boardIDX;
	}
	public void setBoardIDX(int boardIDX) {
		this.boardIDX = boardIDX;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getRed_Count() {
		return red_Count;
	}
	public void setRed_Count(int red_Count) {
		this.red_Count = red_Count;
	}
	public int getBoardAvailable() {
		return boardAvailable;
	}
	public void setBoardAvailable(int boardAvailable) {
		this.boardAvailable = boardAvailable;
	}
	public int getLike_Count() {
		return like_Count;
	}
	public void setLike_Count(int like_Count) {
		this.like_Count = like_Count;
	}
}
