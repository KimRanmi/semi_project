package com.cm.user_page.vo;

import java.time.LocalDateTime;

import com.cm.common.Paging;

public class Message extends Paging {
	private int message_no;
	private String user_nick;
	private String user_id;
	private int sender_no;
	private int receiver_no;
	private String msg_title;
	private String msg_text;
	private LocalDateTime msg_reg_date;
	private String read_status;
	
	public Message() {
		super();
	}

	public Message(int message_no, String user_nick, String user_id, int sender_no, int receiver_no, String msg_title,
			String msg_text, LocalDateTime msg_reg_date, String read_status) {
		super();
		this.message_no = message_no;
		this.user_nick = user_nick;
		this.user_id = user_id;
		this.sender_no = sender_no;
		this.receiver_no = receiver_no;
		this.msg_title = msg_title;
		this.msg_text = msg_text;
		this.msg_reg_date = msg_reg_date;
		this.read_status = read_status;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getSender_no() {
		return sender_no;
	}

	public void setSender_no(int sender_no) {
		this.sender_no = sender_no;
	}

	public int getReceiver_no() {
		return receiver_no;
	}

	public void setReceiver_no(int receiver_no) {
		this.receiver_no = receiver_no;
	}

	public String getMsg_title() {
		return msg_title;
	}

	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}

	public String getMsg_text() {
		return msg_text;
	}

	public void setMsg_text(String msg_text) {
		this.msg_text = msg_text;
	}

	public LocalDateTime getMsg_reg_date() {
		return msg_reg_date;
	}

	public void setMsg_reg_date(LocalDateTime msg_reg_date) {
		this.msg_reg_date = msg_reg_date;
	}

	public String getRead_status() {
		return read_status;
	}

	public void setRead_status(String read_status) {
		this.read_status = read_status;
	}

	@Override
	public String toString() {
		return "Message [message_no=" + message_no + ", user_nick=" + user_nick + ", user_id=" + user_id
				+ ", sender_no=" + sender_no + ", receiver_no=" + receiver_no + ", msg_title=" + msg_title
				+ ", msg_text=" + msg_text + ", msg_reg_date=" + msg_reg_date + ", read_status=" + read_status + "]";
	}
}
