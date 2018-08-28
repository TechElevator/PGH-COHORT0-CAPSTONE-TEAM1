package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class DetailsController {

	
	@RequestMapping(path = "/shopDetail", method = RequestMethod.GET)
	public String showShopDetail(HttpServletRequest request) {
		String googlePlaceId = request.getParameter("googlePlaceId");
		
	
		return "shopDetail";
	}
	//capture the googlePlaceId on the detail page and pass into a google place detail api and 
}
