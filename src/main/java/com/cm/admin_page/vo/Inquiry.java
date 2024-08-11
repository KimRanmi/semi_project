package com.cm.admin_page.vo;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.cm.common.Paging;

public class Inquiry extends Paging{
	private int inquiry_no;
	private int user_no;
	private String inquiry_title;
	private String inquiry_text;
	private LocalDateTime inquiry_reg_date;
	private LocalDateTime inquiry_mod_date;
	private String reply_status;

	public Inquiry() {
		super();
	}

	public Inquiry(int inquiry_no, int user_no, String inquiry_title, String inquiry_text,
			LocalDateTime inquiry_reg_date, LocalDateTime inquiry_mod_date, String reply_status) {
		super();
		this.inquiry_no = inquiry_no;
		this.user_no = user_no;
		this.inquiry_title = inquiry_title;
		this.inquiry_text = inquiry_text;
		this.inquiry_reg_date = inquiry_reg_date;
		this.inquiry_mod_date = inquiry_mod_date;
		this.reply_status = reply_status;
	}

	public int getInquiry_no() {
		return inquiry_no;
	}

	public void setInquiry_no(int inquiry_no) {
		this.inquiry_no = inquiry_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getInquiry_title() {
		return inquiry_title;
	}

	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}

	public String getInquiry_text() {
		return inquiry_text;
	}

	public void setInquiry_text(String inquiry_text) {
		this.inquiry_text = inquiry_text;
	}

	public LocalDateTime getInquiry_reg_date() {
		return inquiry_reg_date;
	}

	public void setInquiry_reg_date(LocalDateTime inquiry_reg_date) {
		this.inquiry_reg_date = inquiry_reg_date;
	}

	public LocalDateTime getInquiry_mod_date() {
		return inquiry_mod_date;
	}

	public void setInquiry_mod_date(LocalDateTime inquiry_mod_date) {
		this.inquiry_mod_date = inquiry_mod_date;
	}

	public String getReply_status() {
		return reply_status;
	}

	public void setReply_status(String reply_status) {
		this.reply_status = reply_status;
	}

	@Override
	public String toString() {
		return "Inquiry [inquiry_no=" + inquiry_no + ", user_no=" + user_no + ", inquiry_title=" + inquiry_title
				+ ", inquiry_text=" + inquiry_text + ", inquiry_reg_date=" + inquiry_reg_date + ", inquiry_mod_date="
				+ inquiry_mod_date + ", reply_status=" + reply_status + "]";
	}
	
}
