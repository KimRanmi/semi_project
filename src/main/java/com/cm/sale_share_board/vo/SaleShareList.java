package com.cm.sale_share_board.vo;

import java.time.LocalDateTime;

import com.cm.common.Paging;




public class SaleShareList extends Paging {
	private String Image_new_name;
	private int post_no;
	private int user_no;
	private String user_nic;
	private String local_gu_name;
	private LocalDateTime prod_reg_date;
	private LocalDateTime prod_mod_date;
	private String post_title;
	private String post_text;
	private int prod_price;
	private int like_status;
	private int deal_status;
	private int prod_cate;
	private String visibilty;
	private int post_view;
	
	public String getVisibilty() {
		return visibilty;
	}
	
	public void setVisibilty(String visibilty) {
		this.visibilty = visibilty;
	}
	
	public SaleShareList() {
		super();
	}

	public int getProd_cate() {
		return prod_cate;
	}

	public void setProd_cate(int prod_cate) {
		this.prod_cate = prod_cate;
	}

	public String getImage_new_name() {
		return Image_new_name;
	}

	public void setImage_new_name(String image_new_name) {
		Image_new_name = image_new_name;
	}

	

	public LocalDateTime getProd_mod_date() {
		return prod_mod_date;
	}

	public void setProd_mod_date(LocalDateTime prod_mod_date) {
		this.prod_mod_date = prod_mod_date;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public int getProd_price() {
		return prod_price;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	public int getLike_status() {
		return like_status;
	}

	public void setLike_status(int like_status) {
		this.like_status = like_status;
	}


	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getPost_text() {
		return post_text;
	}

	public void setPost_text(String post_text) {
		this.post_text = post_text;
	}

	public int getDeal_status() {
		return deal_status;
	}

	public void setDeal_status(int deal_status) {
		this.deal_status = deal_status;
	}

	public LocalDateTime getProd_reg_date() {
		return prod_reg_date;
	}

	public void setProd_reg_date(LocalDateTime prod_reg_date) {
		this.prod_reg_date = prod_reg_date;
	}

	public String getLocal_gu_name() {
		return local_gu_name;
	}

	public void setLocal_gu_name(String local_gu_name) {
		this.local_gu_name = local_gu_name;
	}

	public int getPost_view() {
		return post_view;
	}

	public void setPost_view(int post_view) {
		this.post_view = post_view;
	}

	public SaleShareList(String image_new_name, int post_no, int user_no, String user_nic, String local_gu_name,
			LocalDateTime prod_reg_date, LocalDateTime prod_mod_date, String post_title, String post_text,
			int prod_price, int like_status, int deal_status, int prod_cate, String visibilty, int post_view) {
		super();
		Image_new_name = image_new_name;
		this.post_no = post_no;
		this.user_no = user_no;
		this.user_nic = user_nic;
		this.local_gu_name = local_gu_name;
		this.prod_reg_date = prod_reg_date;
		this.prod_mod_date = prod_mod_date;
		this.post_title = post_title;
		this.post_text = post_text;
		this.prod_price = prod_price;
		this.like_status = like_status;
		this.deal_status = deal_status;
		this.prod_cate = prod_cate;
		this.visibilty = visibilty;
		this.post_view = post_view;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_nic() {
		return user_nic;
	}

	public void setUser_nic(String user_nic) {
		this.user_nic = user_nic;
	}

	

	
	
}

