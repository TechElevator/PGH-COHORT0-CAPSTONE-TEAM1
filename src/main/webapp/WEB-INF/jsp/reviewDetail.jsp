<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<body>

	<div id="coffeeInfo">YOU MADE IT</div>
	<ul id="reviews"></ul>

</body>

<script>
	var globalCoffee = {};
	var reviewArray = [];
				
		$ = jQuery;
		$(document).ready(function() {
						console.log("Document rdy");

						var placeId = '${param["googlePlaceId"]}';
						console.log(placeId);
						var coffee = $("#coffees");

						console.log(coffeeArray);

						$.ajax({
								url : 'API/coffeeList/' + placeId,
								type : 'GET',
								dataType : 'json',
								contentType : 'application/json',
								success : function(data) {
									coffeeArray = data;
									console.log(coffeeArray);
									populateCoffeeList();
								},
								statusCode : {
									200 : function() {
									},
									500 : function() {
										alert("Form Submission Failed: Option number already exists");
									}
								}
							});

					});
</script>




<c:import url="/WEB-INF/jsp/footer.jsp" />