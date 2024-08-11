package com.cm.flashmob.vo;

import java.time.LocalDateTime;

public class FlashmobApply {
	private int application_no;
	private int post_no;
	private int user_no;
	private String application_text;
	private String accept_status;
	private LocalDateTime application_date;
	private LocalDateTime accept_date;
	private String user_nick;
	
	public FlashmobApply() {
		super();
	}



	public FlashmobApply(int application_no, int post_no, int user_no, String application_text, String accept_status,
			LocalDateTime application_date, LocalDateTime accept_date, String user_nick) {
		super();
		this.application_no = application_no;
		this.post_no = post_no;
		this.user_no = user_no;
		this.application_text = application_text;
		this.accept_status = accept_status;
		this.application_date = application_date;
		this.accept_date = accept_date;
		this.user_nick = user_nick;
	}



	public int getApplication_no() {
		return application_no;
	}



	public void setApplication_no(int application_no) {
		this.application_no = application_no;
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



	public String getApplication_text() {
		return application_text;
	}



	public void setApplication_text(String application_text) {
		this.application_text = application_text;
	}



	public String getAccept_status() {
		return accept_status;
	}



	public void setAccept_status(String accept_status) {
		this.accept_status = accept_status;
	}



	public LocalDateTime getApplication_date() {
		return application_date;
	}



	public void setApplication_date(LocalDateTime application_date) {
		this.application_date = application_date;
	}



	public LocalDateTime getAccept_date() {
		return accept_date;
	}



	public void setAccept_date(LocalDateTime accept_date) {
		this.accept_date = accept_date;
	}



	public String getUser_nick() {
		return user_nick;
	}



	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}



	@Override
	public String toString() {
		return "번개모임 신청 번호 : " + application_no + ", 게시글 번호 : " + post_no + ", 가입신청한 회원번호 : " + user_no
				+ ", 번개모임 신청 내용" + application_text + ", 번개모임 가입승인 여부 : " + accept_status + ", 번개모임 신청일 : "
				+ application_date + ", 번개모임 신청 승인날짜" + accept_date+", 닉네임 : "+user_nick;
	}

	
	
	
}
