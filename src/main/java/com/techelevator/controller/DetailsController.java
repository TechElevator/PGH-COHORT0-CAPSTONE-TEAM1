package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class DetailsController {

	
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
	
	
	
	//capture the googlePlaceId on the detail page and pass into a google place detail api and 
}
