package com.cm.flashmob.vo;

public class FlashmobLike {
	private int like_no;
	private int post_no;
	private int like_user_no;
	private int like_status;
	
	public FlashmobLike() {
		super();
	}

	public FlashmobLike(int like_no, int post_no, int like_user_no, int like_status) {
		super();
		this.like_no = like_no;
		this.post_no = post_no;
		this.like_user_no = like_user_no;
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

	public int getLike_user_no() {
		return like_user_no;
	}

	public void setLike_user_no(int like_user_no) {
		this.like_user_no = like_user_no;
	}

	public int getLike_status() {
		return like_status;
	}

	public void setLike_status(int like_status) {
		this.like_status = like_status;
	}

	@Override
	public String toString() {
		return "좋아요 번호 : " + like_no + ", 게시글 번호 : " + post_no + ", 좋아요한 회원번호 : " + like_user_no
				+ ", 좋아요 상태 : " + like_status;
	}
	
	
	
}
