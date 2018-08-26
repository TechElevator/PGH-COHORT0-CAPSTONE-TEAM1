package com.techelevator.model;

import java.util.List;

public interface PlaceDAO {

	public List<Coffee> getCoffeeOffered(String googlePlaceId);
	
	public Place getPlaceById(String googlePlaceId);
	
	public List<Review> getCoffeeReviews(String googlePlaceId);
	
	public void addPlace(Place place);
	
	public void deletePlace(String googlePlaceId);
	
	public void updatePlace(Place place);
	
	
	
}
