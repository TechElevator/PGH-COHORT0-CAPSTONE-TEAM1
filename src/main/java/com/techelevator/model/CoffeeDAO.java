package com.techelevator.model;

import java.util.List;

public interface CoffeeDAO {

	public List<Coffee> getCoffeeOffered(String googlePlaceId);
	
	public Coffee getCoffeeByCoffeeId(long coffeeId);
	
	public void addNewCoffee(Coffee coffee, String googlePlaceId);
	
	public void deleteCoffeeFromPlace(long coffeeId, String googlePlaceId);
	
	public void addExistingCoffeeToPlace(long coffeeId, String googlePlaceId);
	
}
