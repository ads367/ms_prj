package com.ms_prj.spring_mvc.dto;

public class CommentDTO {

	private int commentIDX;
	private int boardIDX;
	private String memberID;
	private String commentContent;
	private String regDate;
	private int ref;				// 어느 댓글의 댓글인지
	private int depth;				// 몇번째 계층인지
	
	public int getCommentIDX() {
		return commentIDX;
	}
	public void setCommentIDX(int commentIDX) {
		this.commentIDX = commentIDX;
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
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
}
