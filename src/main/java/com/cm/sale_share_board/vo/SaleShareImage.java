package com.cm.sale_share_board.vo;

public class SaleShareImage {
	private int image_no;
	private int post_no;
	private String image_ori_name;
	private String image_new_name;
	
	public SaleShareImage() {
		super();
	}

	

	public SaleShareImage(int image_no, int post_no, String image_ori_name, String image_new_name) {
		super();
		this.image_no = image_no;
		this.post_no = post_no;
		this.image_ori_name = image_ori_name;
		this.image_new_name = image_new_name;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public int getImage_no() {
		return image_no;
	}

	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}

	public String getImage_ori_name() {
		return image_ori_name;
	}

	public void setImage_ori_name(String image_ori_name) {
		this.image_ori_name = image_ori_name;
	}

	public String getImage_new_name() {
		return image_new_name;
	}

	public void setImage_new_name(String image_new_name) {
		this.image_new_name = image_new_name;
	}
	
}

