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

						var coffeeId = '${param["coffeeId"]}';
						console.log(coffeeId);
						
						function populateReviewList() {
							for (var i = 0; i < reviewArray.length; i++) {
								$("#reviews").append("<li>" + reviewArray[i].detail + "</li>");
							}
						};	
																						
						$.ajax({
								url : 'API/coffeeList/byCoffeeId/' + coffeeId,
								type : 'GET',
								dataType : 'json',
								contentType : 'application/json',
								success : function(data) {
									globalCoffee = data;
									console.log(globalCoffee);
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