<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="jumbotron-fluid">
	<div class="container-fluid">
		<h1>The Daily Grind</h1>
		<p>Are you ready to get #litaf? Find the best "coffee shops" in Pittsburgh. What are you waiting for?</p>
	</div>
</div>

<section>
<div class="container" id="con">
	<div class="row">
		<span class=border border-primary">
		<div class="col-lg-6" id="col1">
		
			<span class="glyphicon glyphicon-cloud" aria-hidden="true"></span>
			<h3>Cloud Computable</h3>
			<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
			
		</div>
		</span>
		<div class="col-lg-6" id="col2">
			<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
			<h3>Backwards Compatible</h3>
			<p>Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. Lorem ipsum dolor.</p>
		</div>
	</div>
</div>
</section>

<h2>This is the home page.</h2>

<c:import url="/WEB-INF/jsp/footer.jsp" />