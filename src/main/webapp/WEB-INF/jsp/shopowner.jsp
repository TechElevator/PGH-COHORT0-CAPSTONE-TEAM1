<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h2> </h2>
<h1 style="color:white">Shop Owner Page</h1>
<h2 style="color:white">Your Shop Information</h2>
 <ul>
 	<c:forEach var="place" items="${requestScope.allPlaces}">
		<li>${place.coffeeShopName}</li>
	</c:forEach>
 </ul>

<h2 style="color:white">Add Coffee Bean</h2>
	<form method="POST" action="updateCoffee">
		<p style="color:white">Coffee Shop
		<select name="coffeeShopName">
			<c:forEach var="place" items="${requestScope.allPlaces}">
				<option value="${place.coffeeShopName}">${place.coffeeShopName}</option>
			</c:forEach>
		</select>
		</p>
		<p style="color:white">Coffee Name
		<input type="text" name="coffeeName" />
		</p>
		<p style="color:white">Origin
		<input type="text" name="origin" />
		</p>
		<p style="color:white">Roaster
		<input type="text" name="roaster" />
		</p>
		<p style="color:white">Coffee Detail</p>
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