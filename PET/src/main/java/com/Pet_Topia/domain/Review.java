package com.Pet_Topia.domain;

public class Review {
	
	private int review_num;			// 리뷰 넘버
	private String review_id;   	// 아이디
	private int review_item_id; 	// 상품번호
	private int review_score;		// 평점
	private String review_content;  // 리뷰 내용
	private String review_reg_date; // 리뷰 날짜
	private String review_image;    // 리뷰 이미지
	
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public int getReview_item_id() {
		return review_item_id;
	}
	public void setReview_item_id(int review_item_id) {
		this.review_item_id = review_item_id;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_reg_date() {
		return review_reg_date;
	}
	public void setReview_reg_date(String review_reg_date) {
		this.review_reg_date = review_reg_date;
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}

}
