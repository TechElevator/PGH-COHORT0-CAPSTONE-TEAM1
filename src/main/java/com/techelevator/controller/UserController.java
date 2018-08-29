package com.techelevator.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Coffee;
import com.techelevator.model.CoffeeDAO;
import com.techelevator.model.Place;
import com.techelevator.model.PlaceDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class UserController {

	private UserDAO userDAO;
	private PlaceDAO placeDAO;
	private CoffeeDAO coffeeDAO;

	@Autowired
	public UserController(UserDAO userDAO, PlaceDAO placeDAO, CoffeeDAO coffeeDAO) {
		this.userDAO = userDAO;
		this.placeDAO = placeDAO;
		this.coffeeDAO = coffeeDAO;
	}
	
	@RequestMapping(path= {"/", "/homepage"}, method=RequestMethod.GET)
	public String displayHomePage() {
		return "home";
	}
	
	@RequestMapping(path="/about", method=RequestMethod.GET)
	public String displayAboutPage() {
		return "about";
	}
	
	@RequestMapping(path="/event", method=RequestMethod.GET)
	public String displayEventPage() {
		return "event";
	}

	@RequestMapping(path="/users/new", method=RequestMethod.GET)
	public String displayNewUserForm(ModelMap modelHolder) {
		if( ! modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		return "newUser";
	}
	
	@RequestMapping(path="/users", method=RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
		if(result.hasErrors()) {
			System.out.println(result);
			flash.addFlashAttribute("user", user);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			return "redirect:/users/new";
		}
		
		userDAO.saveUser(user.getUserName(), user.getPassword());
		return "redirect:/login";
	}
	
	@RequestMapping(path="/users/{userName}", method=RequestMethod.GET)
	public String displayUserPage(@PathVariable String userName, HttpSession session, HttpServletRequest request) {
		
		String userRoll = userDAO.getUserRole(userName);
		
		User currentUser = (User) session.getAttribute("currentUser");
		
		if (currentUser == null) {
			return "redirect:/login";
		} else if (!userName.equals(currentUser.getUserName())) {
			return "redirect:/";
		} else if (userRoll.equals("coffeelover")) {
			return "userPage";
			
		} else if (userRoll.equals("shopowner")) {

			// return userRoll + "?placeId=" + userDAO.getShopId();

			List<Place> allPlaces = placeDAO.getAllPlacesByUserName(userName);
			request.setAttribute("allPlaces", allPlaces);
			
			return "shopowner";
			
		} else if (userRoll.equals("admin")) {
			List<User> allUsers = userDAO.getAllUsers();
			request.setAttribute("allUsers", allUsers);
			return "admin";
		}
		
		return "/";
	}
	
	@RequestMapping(path="/users/updateUser", method=RequestMethod.POST)
	public String updateUserPermission(@RequestParam String userName, @RequestParam String role, HttpSession session) {
		User currentUser = (User) session.getAttribute("currentUser");
		String currentUserName = currentUser.getUserName();
		userDAO.updateUserRole(userName, role);
		return "redirect:/users/"+currentUserName;
	}
	
	@RequestMapping(path="/users/addPlace", method=RequestMethod.POST)
	public String addPlace(@RequestParam String name, @RequestParam String place_id, HttpSession session) {
		Place placeToAdd = new Place();
		placeToAdd.setGooglePlaceId(place_id);
		placeToAdd.setCoffeeShopName(name);
		placeDAO.addPlace(placeToAdd);
		
		return "redirect:/users/" + session.getAttribute("currentUser");
	}
	
	@RequestMapping(path="/users/updateCoffee", method=RequestMethod.POST)
	public String updateCoffeeBeans(@RequestParam String coffeeName,
									@RequestParam String origin,
									@RequestParam String roaster,
									@RequestParam String detail,
									@RequestParam String coffeeShopName,
									HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		String currentUserName = currentUser.getUserName();
		
		Coffee coffee = new Coffee();
		coffee.setCoffeeName(coffeeName);
		coffee.setOrigin(origin);
		coffee.setRoaster(roaster);
		coffee.setDetail(detail);
		
		String googlePlaceId = placeDAO.getPlaceIdByName(coffeeShopName);
		
		coffeeDAO.addNewCoffee(coffee, googlePlaceId);
		
		return "redirect:/users/"+currentUserName;
	}
}
