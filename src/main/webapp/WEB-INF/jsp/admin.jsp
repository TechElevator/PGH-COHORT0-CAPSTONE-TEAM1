<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h2> </h2>
<h1>Admin Page</h1>
 
 <h2>Daily Grind Users</h2>
 <ul>
 	<c:forEach var="user" items="${requestScope.allUsers}">
		<li>${user.userName}, ${user.role}</li>
	</c:forEach>
 </ul>
 <h2>Update User Role</h2>
 	<form method="POST" action="updateUser">
 		<p>User Name
		<select name="userName">
				<option>Select User</option>
			<c:forEach var="user" items="${requestScope.allUsers}">
				<option value="${user.userName}">${user.userName}</option>
			</c:forEach>
		</select>
 		</p>
 		<p>New Role
 		 <select name="role">
 		 	<option>Select Role</option>
  			<option value="coffeelover">Coffee Lover</option>
  			<option value="shopowner">Shop Owner</option>
  			<option value="admin">Admin</option>
		</select></p>
		<p>Connect a shop to the account?
		<select name="shop">
				<option>Select a Shop</option>
			<c:forEach var="shop" items="${requestScope.allPlaces}">
				<option value="${shop.googlePlaceId}">${shop.coffeeShopName}</option>
			</c:forEach>
		</select>
 		</p>
 		<input type="submit" name="submitbtn" value="Submit" />
 	</form>

	<form method="POST" action="addPlace">
 		<p>Add a place
		<input type="text" name="name" placeholder="name of shop"/>
 		</p>
 		<p>Place's id
 		 <input type="text" name="place_id" placeholder="the google place_id of the shop"/></p>
 		<input type="submit" name="submitbtn" value="Submit" />
 	</form>
<!--
	add shop to review
	change user role
-->

<c:import url="/WEB-INF/jsp/header.jsp" />