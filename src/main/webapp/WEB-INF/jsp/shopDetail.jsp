<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<body>

	<div id='map' style='height: 0px'></div>
	<div id="shopInfo"></div>
	<h2 class='shopInfo'>Coffees seen at this cafe:</h2>
	<ul id="coffees"></ul>

</body>

<script>
	
	
	var globalPlace = {};
	var coffeeArray = [];
	
	function getPlaceDetails()	{
		map = new google.maps.Map(document.getElementById('map'),{
			center: {lat:40, lng:-79},
			zoom:15
		});
	
		var request = {
			  placeId: '${param["googlePlaceId"]}',
			  fields: ['name', 'rating', 'formatted_phone_number', 'formatted_address']
			};

			service = new google.maps.places.PlacesService(map);
			service.getDetails(request, callback);		
		};
	
		function callback(place, status) {
			  if (status == google.maps.places.PlacesServiceStatus.OK) {
				  globalPlace = place;
				  $("#shopInfo").append("<div class='row shop well center-block'><div class='col-xl-12'><h2 class='text-center shopInfo'>" + globalPlace.name + 
						  "</h2></div></div><div class='row shop well center-block'><div class='col-xl-12'><p class='shopInfo text-center'>Rating (1-5): "+ globalPlace.rating +"</br>Contact: " + globalPlace.formatted_phone_number + "</br>Address: " +
						  globalPlace.formatted_address + "</br" + "</p></div></div>");
			  }
		};

		function populateCoffeeList() {
			for (var i = 0; i < coffeeArray.length; i++) {
				$("#coffees").append("<li class='shopInfo'>" + coffeeArray[i].coffeeName +    
				" <a href='" + dailyGrindPageRoot + "reviewDetail?coffeeId=" + coffeeArray[i].coffeeId + "&coffeeName=" + coffeeArray[i].coffeeName + "'>See Reviews</a></li>");
			}
		};	
	 
				
			$ = jQuery;
			$(document).ready(function (){
			    console.log("Document rdy");

			  var placeId =  '${param["googlePlaceId"]}';
			  console.log(placeId);
			  var coffee = $("#coffees");
			  
			  console.log(coffeeArray);
			  
			  $.ajax({
			        url: 'API/coffeeList/' + placeId,
			        type: 'GET',
			        dataType: 'json',
			        contentType:'application/json',
			        success: function(data){   			           
			  			coffeeArray = data;	
			  			console.log(coffeeArray);
			  			populateCoffeeList();
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

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsSGxEdf8gucMQtnMY2PLG3Drnq42dzz8&libraries=places&callback=getPlaceDetails">
    </script>

<c:import url="/WEB-INF/jsp/footer.jsp" />