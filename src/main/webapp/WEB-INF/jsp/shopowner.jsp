<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Shop Owner Page</h1>
<h2>Your Shop Information</h2>
 <ul>
 	<c:forEach var="place" items="${requestScope.allPlaces}">
		<li>${place.coffeeShopName}</li>
	</c:forEach>
 </ul>

<!-- 
	get request params: place id, user id
	
	form to add coffee beans
	
 -->
 
 

<c:import url="/WEB-INF/jsp/header.jsp" />