package com.cm.user.vo;

import java.time.LocalDateTime;

public class User {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_email;
	private String user_address;
	private LocalDateTime user_reg_date;
	private String profile_text;
	private String user_nick;
	private int user_question;
	private String user_answer;
	
	
	
	public User() {
		super();
		
	}



	public User(int user_no, String user_id, String user_pw, String user_email, String user_address,
			LocalDateTime user_reg_date, String profile_text, String user_nick,int user_question,String user_answer) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_email = user_email;
		this.user_address = user_address;
		this.user_reg_date = user_reg_date;
		this.profile_text = profile_text;
		this.user_nick = user_nick;
		this.user_question = user_question;
		this.user_answer = user_answer;
	}



	public int getUser_no() {
		return user_no;
	}



	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getUser_pw() {
		return user_pw;
	}



	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}



	public String getUser_email() {
		return user_email;
	}



	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}



	public String getUser_address() {
		return user_address;
	}



	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}



	public LocalDateTime getUser_reg_date() {
		return user_reg_date;
	}



	public void setUser_reg_date(LocalDateTime user_reg_date) {
		this.user_reg_date = user_reg_date;
	}



	public String getProfile_text() {
		return profile_text;
	}



	public void setProfile_text(String profile_text) {
		this.profile_text = profile_text;
	}



	public String getUser_nick() {
		return user_nick;
	}



	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}


	public int getUser_question() {
		return user_question;
	}
	
	public void setUser_question(int user_question) {
		this.user_question = user_question;
	}
	
	public String getUser_answer() {
		return user_answer;
	}
	
	public void setUser_answer(String user_answer) {
		this.user_answer = user_answer;
	}



	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_email="
				+ user_email + ", user_address=" + user_address + ", user_reg_date=" + user_reg_date + ", profile_text="
				+ profile_text + ", user_nick=" + user_nick + ", user_question=" + user_question + ", user_answer="
				+ user_answer + "]";
	}



	


	


	

}
