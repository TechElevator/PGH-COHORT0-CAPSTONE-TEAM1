package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.techelevator.model.Coffee;
import com.techelevator.model.CoffeeDAO;
import com.techelevator.model.Place;
import com.techelevator.model.PlaceDAO;
import com.techelevator.model.Review;
import com.techelevator.model.ReviewDAO;

@RestController
public class RESTController {

	private List<Place> placeList = new ArrayList<Place>();
	private List<Coffee> coffeeList = new ArrayList<Coffee>();
	private List<Review> reviewList = new ArrayList<Review>();
	private Place place = new Place();
	
	@Autowired
	private PlaceDAO placeDAO;
	
	@Autowired
	private CoffeeDAO coffeeDAO;
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@RequestMapping(value = "API/coffeeList/{googlePlaceId}", method = RequestMethod.GET, produces = "application/json")
	public List<Coffee> getCoffeesByPlaceIdJSON(@PathVariable String googlePlaceId) {
		
		coffeeList = coffeeDAO.getCoffeeOffered(googlePlaceId);
		return coffeeList;
	}
	
	@RequestMapping(value = "API/placeList/byGoogleId/{googlePlaceId}", method = RequestMethod.GET, produces = "application/json")
	public Place getPlacesByGoogleIdJSON(@PathVariable String googlePlaceId) {
		place = placeDAO.getPlaceById(googlePlaceId);
		return place;
	}
	
	@RequestMapping(value = "API/placeList/byCoffeeId/{coffeeId}", method = RequestMethod.GET, produces = "application/json")
	public List<Place> getPlacesByCoffeeIdJSON(@PathVariable long coffeeId) {
		placeList = placeDAO.getPlacesSellingCoffeeById(coffeeId);
		return placeList;
	}

	@RequestMapping(value = "API/reviewList/byUserId/{userId}", method = RequestMethod.GET, produces = "application/json")
	public List<Review> getReviewsByUserIdJSON(@PathVariable long userId) {
		reviewList = reviewDAO.getReviewsByUserId(userId);
		return reviewList;
	}
	
	@RequestMapping(value = "API/reviewList/byCoffeeId/{coffeeId}", method = RequestMethod.GET, produces = "application/json")
	public List<Review> getReviewsByCoffeeIdJSON(@PathVariable long coffeeId) {
		reviewList = reviewDAO.getCoffeeReviewsById(coffeeId);
		return reviewList;
	}
	
	@RequestMapping(value = "API/reviewList/byPlaceId/{googlePlaceId}", method = RequestMethod.GET, produces = "application/json")
	public List<Review> getReviewsByPlaceIdJSON(@PathVariable String googlePlaceId) {
		reviewList = reviewDAO.getCoffeeReviewsByPlaceId(googlePlaceId);
		return reviewList;
	}
		
}
