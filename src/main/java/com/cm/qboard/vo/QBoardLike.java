package com.cm.qboard.vo;

public class QBoardLike {
	private int like_no;
	private int post_no;
	private int user_no;
	private int like_status;
	public QBoardLike() {
		super();
	}
	public QBoardLike(int like_no, int post_no, int user_no, int like_status) {
		super();
		this.like_no = like_no;
		this.post_no = post_no;
		this.user_no = user_no;
		this.like_status = like_status;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getLike_status() {
		return like_status;
	}
	public void setLike_status(int like_status) {
		this.like_status = like_status;
	}
	@Override
	public String toString() {
		return "QBoardLike [like_no=" + like_no + ", post_no=" + post_no + ", user_no=" + user_no + ", like_status="
				+ like_status + "]";
	}
	
	
}
