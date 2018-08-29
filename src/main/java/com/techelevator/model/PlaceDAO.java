package com.techelevator.model;

import java.util.List;

public interface PlaceDAO {

	public Place getPlaceById(String googlePlaceId);
	
	public List<Place> getPlacesSellingCoffeeById(long coffeeId);
	
	public void addPlace(Place place);
	
	public void updatePlace(Place place);
	
	public Place getPlaceByUserName(String userName);
		
}
