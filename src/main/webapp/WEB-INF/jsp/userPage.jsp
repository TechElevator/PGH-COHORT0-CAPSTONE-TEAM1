<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />
<style>
	#map {
		height:400px;
		width:100%;
	}
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }

</style>

<h2 class="text-center">Welcome, ${userName}</h2>
<div id="map"></div>
<div id="shopsDisplay">
	
</div>
<script type="text/javascript" src="../js/map.js">
    </script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsSGxEdf8gucMQtnMY2PLG3Drnq42dzz8&libraries=places&callback=initMap">
    </script>
<c:import url="/WEB-INF/jsp/footer.jsp" />