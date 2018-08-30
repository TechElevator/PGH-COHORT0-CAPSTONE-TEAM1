package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.PlaceDAO;
import com.techelevator.model.ReviewDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;



@Controller
public class DetailsController {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PlaceDAO placeDAO;
	
	@RequestMapping(path = "/shopDetail", method = RequestMethod.GET)
	public String showShopDetail(HttpServletRequest request) {
		//String googlePlaceId = request.getParameter("googlePlaceId");
		//request.setAttribute("placeId", googlePlaceId);
	
		return "shopDetail";
	}
	
	@RequestMapping(path = "/reviewDetail", method = RequestMethod.GET)
	public String showReviewDetail(HttpServletRequest request) {
		return "reviewDetail";
	}
	
	@RequestMapping(path = "/reviewDetail", method = RequestMethod.POST)
	public String addNewReview(HttpServletRequest request, HttpSession session) {
		int rating = Integer.parseInt(request.getParameter("rating"));
		String details = request.getParameter("details");
		long coffeeId = Long.parseLong(request.getParameter("coffeeId"));
		
		User currentUser = (User) session.getAttribute("currentUser");
		String currentUserName = currentUser.getUserName();
		long userId = userDAO.getUserIdByName(currentUserName);
		
		reviewDAO.addNewReview(rating, details, coffeeId, userId);
		
		return "redirect:/users/"+currentUserName;
	}
	
}
