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

import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class UserController {

	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path= {"/", "/homepage"}, method=RequestMethod.GET)
	public String displayHomePage() {
		return "home";
	}
	
	@RequestMapping(path="/about", method=RequestMethod.GET)
	public String displayAboutPage() {
		return "about";
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
			return userRoll;
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
}
