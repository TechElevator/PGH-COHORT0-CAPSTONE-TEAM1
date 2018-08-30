package com.techelevator.model;

import java.util.List;


public interface ReviewDAO {

	public List<Review> getReviewsByUserId(long userId);
		
	public void addNewReview(int rating, String detail, long coffeeId, long userId);
	
	public List<Review> getCoffeeReviewsById(long coffeeId);
	
	public List<Review> getCoffeeReviewsByPlaceId(String googlePlaceId);
}
