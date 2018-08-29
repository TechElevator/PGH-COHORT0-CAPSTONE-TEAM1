<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />


<body>

			<div id='map' style='height:0px'></div>
			<div>YOU MADE IT</div>
	
</body>

	<script>
	
	
	var globalPlace = {};
	
	function getPlaceDetails()	{
	map = new google.maps.Map(document.getElementById('map'),{
			center: {lat:40, lng:-79},
			zoom:15
	});
	
	var request = {
			  placeId: '${param["googlePlaceId"]}',
			  fields: ['name', 'rating', 'formatted_phone_number', 'formatted_address', 'price_level', 'review']
			};

			service = new google.maps.places.PlacesService(map);
			service.getDetails(request, callback);
		
	}
	
			function callback(place, status) {
			  if (status == google.maps.places.PlacesServiceStatus.OK) {
			    globalPlace = place;
			    console.log(place);
			  }
			}
	 
			
			</script>
	  
	  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsSGxEdf8gucMQtnMY2PLG3Drnq42dzz8&libraries=places&callback=getPlaceDetails">
    </script>

<c:import url="/WEB-INF/jsp/footer.jsp" />