<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Shop Owner Page</h1>
<h2>Your Shop Information</h2>
 <ul>
 	<c:forEach var="place" items="${requestScope.allPlaces}">
		<li>${place.coffeeShopName}</li>
	</c:forEach>
 </ul>

<h2>Add Coffee Bean</h2>
	<form method="POST" action="updateCoffee">
		<p>Coffee Shop
		<select name="coffeeShopName">
			<option>Select Shop</option>
			<c:forEach var="place" items="${requestScope.allPlaces}">
				<option value="${place.coffeeShopName}">${place.coffeeShopName}</option>
			</c:forEach>
		</select>
		</p>
		<p>Coffee Name
		<input type="text" name="coffeeName" />
		</p>
		<p>Origin
		<input type="text" name="origin" />
		</p>
		<p>Roaster
		<input type="text" name="roaster" />
		</p>
		<p>Coffee Detail</p>
		<p>
		<textarea rows="5" cols="40" name="detail" /></textarea>
		</p>
		<input type="submit" name="submitbtn" value="Submit" />
	</form>
<!-- 
	get request params: place id, user id
	
	form to add coffee beans
	
 -->
 
 

<c:import url="/WEB-INF/jsp/header.jsp" />