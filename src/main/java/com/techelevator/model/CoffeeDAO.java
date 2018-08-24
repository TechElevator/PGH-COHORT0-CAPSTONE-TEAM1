package com.techelevator.model;

import java.util.List;

public interface CoffeeDAO {

	public List<Review> getCoffeeReviewsById(long coffeeId);
	
	public List<Place> getPlacesSellingById(long coffeeId);
	
	public void addCoffee(Coffee coffee);
	
	public void deleteCoffee(long coffeeId);
	
	
}
