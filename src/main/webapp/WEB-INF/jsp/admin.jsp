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
 		<input type="submit" name="submitbtn" value="Submit" />
 	</form>

<!--
	add shop to review
	change user role
-->

<c:import url="/WEB-INF/jsp/header.jsp" />