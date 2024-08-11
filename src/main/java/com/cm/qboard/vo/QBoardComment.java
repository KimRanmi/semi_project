package com.cm.qboard.vo;

import java.time.LocalDateTime;

import com.cm.user.vo.User;

public class QBoardComment {
	private int commentNo;
	private int userNo;
	private int postNo;
	private String commentText;
	private LocalDateTime commentRegDate;
	private LocalDateTime commentModDate;
	private User user;
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public QBoardComment() {
		super();
	}
	public QBoardComment(int commentNo, int userNo, int postNo, String commentText, LocalDateTime commentRegDate,
			LocalDateTime commentModDate) {
		super();
		this.commentNo = commentNo;
		this.userNo = userNo;
		this.postNo = postNo;
		this.commentText = commentText;
		this.commentRegDate = commentRegDate;
		this.commentModDate = commentModDate;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public LocalDateTime getCommentRegDate() {
		return commentRegDate;
	}
	public void setCommentRegDate(LocalDateTime commentRegDate) {
		this.commentRegDate = commentRegDate;
	}
	public LocalDateTime getCommentModDate() {
		return commentModDate;
	}
	public void setCommentModDate(LocalDateTime commentModDate) {
		this.commentModDate = commentModDate;
	}
	
	
}
