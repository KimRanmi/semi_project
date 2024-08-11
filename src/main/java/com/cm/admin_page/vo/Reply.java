package com.cm.admin_page.vo;

import java.time.LocalDateTime;

import com.cm.common.Paging;

public class Reply extends Paging{
	private int reply_no;
	private int inquiry_no;
	private String reply_text;
	private LocalDateTime reply_reg_date;
	private LocalDateTime reply_mod_date;
	
	public Reply() {
		super();
	}

	public Reply(int reply_no, int inquiry_no, String reply_text, LocalDateTime reply_reg_date,
			LocalDateTime reply_mod_date) {
		super();
		this.reply_no = reply_no;
		this.inquiry_no = inquiry_no;
		this.reply_text = reply_text;
		this.reply_reg_date = reply_reg_date;
		this.reply_mod_date = reply_mod_date;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getInquiry_no() {
		return inquiry_no;
	}

	public void setInquiry_no(int inquiry_no) {
		this.inquiry_no = inquiry_no;
	}

	public String getReply_text() {
		return reply_text;
	}

	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}

	public LocalDateTime getReply_reg_date() {
		return reply_reg_date;
	}

	public void setReply_reg_date(LocalDateTime reply_reg_date) {
		this.reply_reg_date = reply_reg_date;
	}

	public LocalDateTime getReply_mod_date() {
		return reply_mod_date;
	}

	public void setReply_mod_date(LocalDateTime reply_mod_date) {
		this.reply_mod_date = reply_mod_date;
	}

	@Override
	public String toString() {
		return "Reply [reply_no=" + reply_no + ", inquiry_no=" + inquiry_no + ", reply_text=" + reply_text
				+ ", reply_reg_date=" + reply_reg_date + ", reply_mod_date=" + reply_mod_date + "]";
	}
	
}
