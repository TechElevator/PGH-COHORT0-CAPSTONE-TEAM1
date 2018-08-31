<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h2> </h2>
<h1 style="color:white">Admin Page</h1>
 
 <h2 style="color:white">Daily Grind Users</h2>
 <table>
 	<tr>
 		<th style="color:white">Username</th>
 		<th style="color:white">Role</th>
 	</tr>
 	
 	<c:forEach var="user" items="${requestScope.allUsers}">
 		<tr>
			<td style="color:white">${user.userName}</td>
			<td style="color:white">${user.role}</td>
		</tr>
	</c:forEach>
 </table>
 <h2 style="color:white">Update User Role</h2>
 	<form method="POST" action="updateUser">
 	<p class="text-info">If you are adding a shop to an account that has already been granted 'shopowner' privileges it is important to re-confirm their auth level by selecting 'shopowner' role again when associating new shops with the account in question.</p>
 		<p style="color:white">User Name
		<select name="userName">
				<option>Select User</option>
			<c:forEach var="user" items="${requestScope.allUsers}">
				<option value="${user.userName}">${user.userName}</option>
			</c:forEach>
		</select>
 		</p>
 		<p style="color:white">New Role
 		 <select name="role">
 		 	<option>Select Role</option>
  			<option value="coffeelover">Coffee Lover</option>
  			<option value="shopowner">Shop Owner</option>
  			<option value="admin">Admin</option>
		</select></p>
		<p style="color:white">Connect a shop to the account?
		<select name="shop">
				<option>Select a Shop</option>
			<c:forEach var="shop" items="${requestScope.allPlaces}">
				<option value="${shop.googlePlaceId}">${shop.coffeeShopName}</option>
			</c:forEach>
		</select>
 		</p>
 		<input type="submit" name="submitbtn" value="Submit" />
 	</form>

	<h2 style="color:white">Add new coffee shop to database:</h2>
	<form method="POST" action="addPlace">
 		<p style="color:white">Name:
		<input type="text" name="name" placeholder="shop name"/>
 		</p>
 		<p style="color:white">Google place_id:
 		 <input type="text" name="place_id" placeholder="google place_id"/></p>
 		<input type="submit" name="submitbtn" value="Submit" />
 	</form>
<!--
	add shop to review
	change user role
-->

<c:import url="/WEB-INF/jsp/header.jsp" />