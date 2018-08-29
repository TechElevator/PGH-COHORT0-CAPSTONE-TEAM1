<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />


<%-- <span style="font-family: 'Pacifico', cursive; font-size: 75px;" id="center">Mapping Pittsburgh's Coffee Bars</h1> --%>	

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
    <li data-target="#myCarousel" data-slide-to="5"></li>
    <li data-target="#myCarousel" data-slide-to="6"></li>
    <li data-target="#myCarousel" data-slide-to="7"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100 h-100" src="img/jumbo1.jpg" alt="First slide">
      <span style="font-family: 'Pacifico', cursive; font-size: 75px; text-align: center; color: white" id="center">Mapping Pittsburgh's Coffee Bars</span>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 h-100" src="img/jumbo2.jpg" alt="Second slide">
      <span style="font-family: 'Pacifico', cursive; font-size: 75px; text-align: center; color: white" id="center">Mapping Pittsburgh's Coffee Bars</span> 
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 h-100" src="img/jumbo3.jpg" alt="Third slide">
      <span style="font-family: 'Pacifico', cursive; font-size: 75px; text-align: center; color: white" id="center">Mapping Pittsburgh's Coffee Bars</span>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 h-100" src="img/jumbo4.jpg" alt="Fourth slide">
      <span style="font-family: 'Pacifico', cursive; font-size: 75px; text-align: center; color: white" id="center">Mapping Pittsburgh's Coffee Bars</span>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 h-100" src="img/jumbo5.jpg" alt="Fifth slide">
      <span style="font-family: 'Pacifico', cursive; font-size: 75px; text-align: center; color: white" id="center">Mapping Pittsburgh's Coffee Bars</span>      
    </div>    
    <div class="carousel-item">
      <img class="d-block w-100 h-100" src="img/jumbo6.jpg" alt="Sixth slide">
      <span style="font-family: 'Pacifico', cursive; font-size: 75px; text-align: center; color: white" id="center">Mapping Pittsburgh's Coffee Bars</span>      
    </div>    
    <div class="carousel-item">
      <img class="d-block w-100 h-100" src="img/jumbo7.jpg" alt="Seventh slide">
      <span style="font-family: 'Pacifico', cursive; font-size: 75px; text-align: center; color: white" id="center">Mapping Pittsburgh's Coffee Bars</span>
    </div>    
  </div>
  
  <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

	<div class="row">		
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="col1">			
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="col2">
			<h2 id="center" style="font-family: 'Pacifico', cursive; text-align: center">Local Neighborhoods:</br>North Shore </br>Oakland </br>Shadyside </br>Lawrenceville </br>...and More</h2>
		</div>
	</div>
	
	<div class="row">		
		<div class="col-lg-6 col-md-6 col-sm-12 d-flex justify-content-center" id="col3">		
			<h2 id="center" style="font-family: 'Pacifico', cursive; text-align: center">Coffee </br> Café </br> Espresso </br> Cappucino </br> Latte </br> Americano</h2>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="col4">
		</div>
	</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />