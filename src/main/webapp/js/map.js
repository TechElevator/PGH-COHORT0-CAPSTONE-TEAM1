/**
 * hybrid of these pages
 * https://developers.google.com/maps/documentation/javascript/examples/map-geolocation
 * https://developers.google.com/maps/documentation/javascript/examples/place-search
 */

  var map, infoWindow;
  var markers = [];
  var globalResults = [];

  function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 40.452326, lng: -79.930317},
      zoom: 15
    });
    infowindow = new google.maps.InfoWindow;

    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        infowindow.setPosition(pos);
        map.setCenter(pos);
      }, function() {
        handleLocationError(true, infowindow, map.getCenter());
      });
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infowindow, map.getCenter());
    }

    //call places and populate map with markers
	    	var service = new google.maps.places.PlacesService(map);
	        service.nearbySearch({
	          location: map.getCenter(),
	          rankBy: google.maps.places.RankBy.DISTANCE,
	          keyword: ['coffee'],
	          type: ['cafe']
	        }, callback);
	        
	        map.addListener('center_changed', function() {
		        	deleteMarkers();
		        	clearShopsListed();
		    		var service = new google.maps.places.PlacesService(map);
		    		service.nearbySearch({
		    	          location: map.getCenter(),
		    	          rankBy: google.maps.places.RankBy.DISTANCE,
		    	          keyword: ['coffee'],
		    	          type: ['cafe']
		    	        }, callback);
	    	    });
  }
  
  function setMapOnAll(map) {
      for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
      }
    }
  
  function clearShopsListed() {
	  for(var i = 0; i < globalResults.length; i++) {
		  $("#shop" + i).remove();
	  }
	  globalResults = [];
  }

//Removes the markers from the map, but keeps them in the array.
  function clearMarkers() {
    setMapOnAll(null);
  }

  // Shows any markers currently in the array.
  function showMarkers() {
    setMapOnAll(map);
  }

  // Deletes all markers in the array by removing references to them.
  function deleteMarkers() {
    clearMarkers();
    markers = [];
  }

  
  function callback(results, status) {
      if (status === google.maps.places.PlacesServiceStatus.OK) {
    		$(".shop").remove();
        for (var i = 0; i < results.length; i++) {
        	globalResults[i] = results[i];

        	var request = {
        			  placeId: globalResults[i].place_id,
        			  fields: ['name', 'rating', 'formatted_phone_number', 'geometry']
        			};
        	
    		
    		
    		if(i % 2 == 0){
			$("#shopsDisplay").append("<div class='row shop well'><div class='col-md-6'><h2 class='text-center shopInfo' id='shop" + i + "'>" + globalResults[i].name + "</h2><p class='shopInfo'>"+ globalResults[i].vicinity +"</p></div><div class='col-md-6'><img class='img-responsive center-block' style='height:40em' src='" + globalResults[i].photos[0].getUrl({'maxWidth':10000, 'maxHeight':10000}) + "'/></div></div>");
    		} else {
			$("#shopsDisplay").append("<div class='row shop well'><div class='col-md-6'><img class='img-responsive center-block' style='height:40em' src='" + globalResults[i].photos[0].getUrl({'maxWidth':10000, 'maxHeight':10000}) + "'/></div><div class='col-md-6'><h2 class='text-center shopInfo' id='shop" + i + "'>" + globalResults[i].name + "</h2><p class='shopInfo'>" + globalResults[i].vicinity + "</p></div></div>");
    		}
    		
        
        //	$("#shopsDisplay").append("<div class='shop col-md-6'><p id='shop" + i + "'>" + globalResults[i].name + "</p></div><div class='shop col-md-6'><img class='img-responsive center-block' style='height:40em' src='" + globalResults[i].photos[0].getUrl({'maxWidth':10000, 'maxHeight':10000}) + "'/></div>");
          createMarker(results[i]);
        }
        
        return results;
      }
    }

  function createMarker(place) {
      var placeLoc = place.geometry.location;
      var marker = new google.maps.Marker({
        map: map,
        position: place.geometry.location
      });
      markers.push(marker);

      google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(place.name);
        infowindow.open(map, this);
      });
    }

  function handleLocationError(browserHasGeolocation, infowindow, pos) {
    infowindow.setPosition(pos);
    infowindow.setContent(browserHasGeolocation ?
                          'Error: The Geolocation service failed.' :
                          'Error: Your browser doesn\'t support geolocation.');
  }
  
 