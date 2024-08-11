package com.cm.qboard.vo;

import java.time.LocalDateTime;
import com.cm.common.Paging;
import com.cm.user.vo.User;

public class QBoard extends Paging{
	private int postNo;
	private int boardTypeId;
	private int userNo;
	private String postTitle;
	private String postText;
	private LocalDateTime postRegDate;
	private LocalDateTime postModDate;
	private String postReleaseYn;
	private int likeCount;
	private String imageOriName;
	private String imageNewName;
	private int postView;
	private User user;

	  public User getUser() {
	        return user;
	    }

	    public void setUser(User user) {
	        this.user = user;
	    }
	
	public QBoard() {
		super();
	}

	public QBoard(int postNo, int boardTypeId, int userNo, String postTitle, String postText,
			LocalDateTime postRegDate, LocalDateTime postModDate, String postReleaseYn, int likeCount,
			String imageOriName, String imageNewName, int postView) {
		super();
		this.postNo = postNo;
		this.boardTypeId = boardTypeId;
		this.userNo = userNo;
		this.postTitle = postTitle;
		this.postText = postText;
		this.postRegDate = postRegDate;
		this.postModDate = postModDate;
		this.postReleaseYn = postReleaseYn;
		this.likeCount = likeCount;
		this.imageOriName = imageOriName;
		this.imageNewName = imageNewName;
		this.postView = postView;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getBoardTypeId() {
		return boardTypeId;
	}

	public void setBoardTypeId(int boardTypeId) {
		this.boardTypeId = boardTypeId;
	}


	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostText() {
		return postText;
	}

	public void setPostText(String postText) {
		this.postText = postText;
	}

	public LocalDateTime getPostRegDate() {
		return postRegDate;
	}

	public void setPostRegDate(LocalDateTime postRegDate) {
		this.postRegDate = postRegDate;
	}

	public LocalDateTime getPostModDate() {
		return postModDate;
	}

	public void setPostModDate(LocalDateTime postModDate) {
		this.postModDate = postModDate;
	}

	public String getPostReleaseYn() {
		return postReleaseYn;
	}

	public void setPostReleaseYn(String postReleaseYn) {
		this.postReleaseYn = postReleaseYn;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getImageOriName() {
		return imageOriName;
	}

	public void setImageOriName(String imageOriName) {
		this.imageOriName = imageOriName;
	}

	public String getImageNewName() {
		return imageNewName;
	}

	public void setImageNewName(String imageNewName) {
		this.imageNewName = imageNewName;
	}

	public int getPostView() {
		return postView;
	}

	public void setPostView(int postView) {
		this.postView = postView;
	}

	
	
}
