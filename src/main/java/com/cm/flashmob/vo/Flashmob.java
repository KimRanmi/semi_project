package com.cm.flashmob.vo;

import java.time.LocalDateTime;

import com.cm.common.Paging;

public class Flashmob extends Paging{
	private int post_no;
	private String flashmob_location;
	private LocalDateTime flashmob_date;
	private int flashmob_number;
	private int user_no;
	private int board_type_id;
	private int local_gu_no;
	private String post_title;
	private String post_text;
	private LocalDateTime post_reg_date;
	private LocalDateTime post_mod_date;
	private String post_release_yn;
	private int like_count;
	private String flashmob_ori_image_name;
	private String flashmob_new_image_name;
	private int flashmob_post_view;
	private String user_nick;
	
	public Flashmob() {
		super();
	}

	

	public Flashmob(int post_no, String flashmob_location, LocalDateTime flashmob_date, int flashmob_number,
			int user_no, int board_type_id, int local_gu_no, String post_title, String post_text,
			LocalDateTime post_reg_date, LocalDateTime post_mod_date, String post_release_yn, int like_count,
			String flashmob_ori_image_name, String flashmob_new_image_name, int flashmob_post_view, String user_nick) {
		super();
		this.post_no = post_no;
		this.flashmob_location = flashmob_location;
		this.flashmob_date = flashmob_date;
		this.flashmob_number = flashmob_number;
		this.user_no = user_no;
		this.board_type_id = board_type_id;
		this.local_gu_no = local_gu_no;
		this.post_title = post_title;
		this.post_text = post_text;
		this.post_reg_date = post_reg_date;
		this.post_mod_date = post_mod_date;
		this.post_release_yn = post_release_yn;
		this.like_count = like_count;
		this.flashmob_ori_image_name = flashmob_ori_image_name;
		this.flashmob_new_image_name = flashmob_new_image_name;
		this.flashmob_post_view = flashmob_post_view;
		this.user_nick = user_nick;
	}

	

	public int getPost_no() {
		return post_no;
	}



	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}



	public String getFlashmob_location() {
		return flashmob_location;
	}



	public void setFlashmob_location(String flashmob_location) {
		this.flashmob_location = flashmob_location;
	}



	public LocalDateTime getFlashmob_date() {
		return flashmob_date;
	}



	public void setFlashmob_date(LocalDateTime flashmob_date) {
		this.flashmob_date = flashmob_date;
	}



	public int getFlashmob_number() {
		return flashmob_number;
	}



	public void setFlashmob_number(int flashmob_number) {
		this.flashmob_number = flashmob_number;
	}



	public int getUser_no() {
		return user_no;
	}



	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}



	public int getBoard_type_id() {
		return board_type_id;
	}



	public void setBoard_type_id(int board_type_id) {
		this.board_type_id = board_type_id;
	}



	public int getLocal_gu_no() {
		return local_gu_no;
	}



	public void setLocal_gu_no(int local_gu_no) {
		this.local_gu_no = local_gu_no;
	}



	public String getPost_title() {
		return post_title;
	}



	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}



	public String getPost_text() {
		return post_text;
	}



	public void setPost_text(String post_text) {
		this.post_text = post_text;
	}



	public LocalDateTime getPost_reg_date() {
		return post_reg_date;
	}



	public void setPost_reg_date(LocalDateTime post_reg_date) {
		this.post_reg_date = post_reg_date;
	}



	public LocalDateTime getPost_mod_date() {
		return post_mod_date;
	}



	public void setPost_mod_date(LocalDateTime post_mod_date) {
		this.post_mod_date = post_mod_date;
	}



	public String getPost_release_yn() {
		return post_release_yn;
	}



	public void setPost_release_yn(String post_release_yn) {
		this.post_release_yn = post_release_yn;
	}



	public int getLike_count() {
		return like_count;
	}



	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}



	public String getFlashmob_ori_image_name() {
		return flashmob_ori_image_name;
	}



	public void setFlashmob_ori_image_name(String flashmob_ori_image_name) {
		this.flashmob_ori_image_name = flashmob_ori_image_name;
	}



	public String getFlashmob_new_image_name() {
		return flashmob_new_image_name;
	}



	public void setFlashmob_new_image_name(String flashmob_new_image_name) {
		this.flashmob_new_image_name = flashmob_new_image_name;
	}



	public int getFlashmob_post_view() {
		return flashmob_post_view;
	}



	public void setFlashmob_post_view(int flashmob_post_view) {
		this.flashmob_post_view = flashmob_post_view;
	}



	public String getUser_nick() {
		return user_nick;
	}



	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}



	@Override
	public String toString() {
		return "게시글 번호 : " + post_no + ", 번개모임 장소 : " + flashmob_location + ", 번개모임 날짜 : "
				+ flashmob_date + ", 번개모임 인원 수 : " + flashmob_number + ", 회원 번호 : " + user_no + ", 게시판 종류 코드 : "
				+ board_type_id + ", 지역(구) 번호 : " + local_gu_no + ", 게시글 제목 : " + post_title + ", 게시글 내용 : "
				+ post_text + ", 게시글 작성일 : " + post_reg_date + ", 게시글 수정일 : " + post_mod_date
				+ ", 게시글 공개 여부 : " + post_release_yn+", 게시글 좋아요 수 : "+like_count
				+", 번개모임 사진 이전 이름 : "+flashmob_ori_image_name+", 번개모임 사진 새 이름 : "+flashmob_new_image_name+", 조회수 : "+flashmob_post_view
				+", 유저 닉네임 : "+user_nick;
	}
	
	
	
	
}
