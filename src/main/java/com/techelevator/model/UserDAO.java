package com.techelevator.model;

import java.util.List;

public interface UserDAO {

	public void saveUser(String userName, String password);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);

	public Object getUserByUserName(String userName);
	
	public String getUserRole(String userName);
	
	public List<User> getAllUsers();
		
	public void updateUserRole(String userName, String role);

	public long getUserId(String userName);
	
	public void updateRoleToShopOwner(String userName);

	public void assignUserToShop(String googlePlaceIdea, String userName);
}
