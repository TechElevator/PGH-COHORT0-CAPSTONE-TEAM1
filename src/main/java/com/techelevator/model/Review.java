package com.techelevator.model;

import java.time.LocalDate;

public class Review {
	private long reviewId;
	private int rating;
	private String detail;
	private LocalDate reviewDate;
	
	public long getReviewId() {
		return this.reviewId;
	}
	public void setReviewId(long reviewId) {
		this.reviewId = reviewId;
	}
	public int getRating() {
		return this.rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getDetail() {
		return this.detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public LocalDate getReviewDate() {
		return this.reviewDate;
	}
	public void setReviewDate(LocalDate reviewDate) {
		this.reviewDate = reviewDate;
	}


}
