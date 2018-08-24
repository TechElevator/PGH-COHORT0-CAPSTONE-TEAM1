package com.techelevator.model;

import java.util.List;

public interface ReviewDAO {

	public List<Review> getReviewsByUserId(long userId);
	
}
