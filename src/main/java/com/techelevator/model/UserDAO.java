package com.techelevator.model;

public interface UserDAO {

	public void saveUser(String userName, String password);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);

	public Object getUserByUserName(String userName);
	
	public String getUserRole(String userName);

	public long getUserId(String userName);
	
	public void updateRoleToShopOwner(String userName);

}
