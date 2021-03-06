<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<body>

		<c:url var="formAction" value="/reviewDetail" />
		<form method="POST" action="${formAction}" style='background-color:grey'>
		<h3>Leave a review!</h3>
		<div>
			<label for="rating">Rating:</label> 
			<select name="rating" id="rating">
				<option value="5">Five Stars</option>
				<option value="4">Four Stars</option>
				<option value="3">Three Stars</option>
				<option value="2">Two Stars</option>
				<option value="1">One Star</option>

			</select>
		</div>
		
		<div>
			<label for="details">Details</label> <input
				type="text" name="details" id="details" />
		</div>

	
		<input type="hidden" value=${param["coffeeId"]} name="coffeeId" />

		<input class="formSubmitButton" type="submit" value="Submit" />

	</form>
	<div class='well'>
		<h3 class='shopInfo'>About This Coffee</h3>
	<div id="coffeeInfo"></div>
	<h3 class='shopInfo'>Submitted Reviews</h3>
	<ul id="reviews"></ul>
	</div>	


</body>

<script>
	var globalCoffee = {};
	var reviewArray = [];
				
		$ = jQuery;
		
		$(document).ready(function() {
						console.log("Document rdy");

						var coffeeId = '${param["coffeeId"]}';
						console.log(coffeeId);
						
						function populateReviewList() {
							for (var i = 0; i < reviewArray.length; i++) {
								$("#reviews").append("<li class='shopInfo'>" + reviewArray[i].rating + " out of 5 Stars - " + reviewArray[i].detail + "</li>");
							}
						};	
						
						function listCoffeeData(){
							$("#coffeeInfo").append("<p class='shopInfo'>Name: "+ globalCoffee.coffeeName +"</br>Origin: " +
								globalCoffee.origin + "</br>Roaster: " + globalCoffee.roaster + "</br>Details: " + globalCoffee.detail + "</p>");
						};
																						
						$.ajax({
								url : 'API/coffeeList/byCoffeeId/' + coffeeId,
								type : 'GET',
								dataType : 'json',
								contentType : 'application/json',
								success : function(data) {
									globalCoffee = data;
									console.log(globalCoffee);
									listCoffeeData();
								},
								statusCode : {
									200 : function() {
									},
									500 : function() {
										alert("Form Submission Failed: Option number already exists");
									}
								}
							});
						  											  
						  $.ajax({
						        url: 'API/reviewList/byCoffeeId/' + coffeeId,
						        type: 'GET',
						        dataType: 'json',
						        contentType:'application/json',
						        success: function(data){   			           
						  			reviewArray = data;	
						  			console.log(reviewArray);
						  			populateReviewList();
						        },
						        statusCode: {
						        		200: function() {
						        			  },     		  	        	
						       		500: function(){
						       			alert("Form Submission Failed: Option number already exists");
						       		}       
						        }	
						  });	
						
		});
				
</script>

<c:import url="/WEB-INF/jsp/footer.jsp" />