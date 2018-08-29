<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>The Daily Grind</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
	    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
	    <script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
	    
	   
	    <c:url var="cssHref" value="/css/site.css" />
		<link rel="stylesheet" type="text/css" href="${cssHref}">
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("time.timeago").timeago();
				
				$("#logoutLink").click(function(event){
					$("#logoutForm").submit();
				});
				
				var pathname = window.location.pathname;
				$("nav a[href='"+pathname+"']").parent().addClass("active");
				
			});
			
			
		</script>
		
	</head>
	<body> 	

<nav class="navbar fixed-top navbar-dark navbar-expand-md justify-content-between" id="navbar" >
    <div class="container-fluid" id="navbar" >
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse dual-nav w-50 order-1 order-md-0">
            <ul class="navbar-nav">
                <li class="nav-item">
                		<c:url var="homePageHref" value="/" />
                    <a class="nav-link pl-0" href="${homePageHref}"><span class="fa fa-home"></span> Home<span class="sr-only">Map</span></a>
                </li>
                <li class="nav-item">
                		<c:url var="aboutPageHref" value="/about" />	
                    <a class="nav-link" href="${aboutPageHref}"><span class="fa fa-user-circle"></span> About</a>
                </li>
                <li class="nav-item">
                		<c:url var="eventPageHref" value="/event" />	
                    <a class="nav-link" href="${eventPageHref}"><span class="fas fa-calendar-alt"></span> Events</a>
                </li>               
                               
            </ul>
        </div>
        
        <c:url var="homePageHref" value="/" />	
        <a href="${homePageHref}" class="navbar-brand mx-auto d-block text-center order-0 order-md-1 w-25" id="navtitle">The Daily Grind</a>
        
        <div class="navbar-collapse collapse dual-nav w-50 order-2">
            <ul class="nav navbar-nav ml-auto">                   	
					<c:if test="${not empty currentUser}">
						<c:url var="mapPageHref" value="/users/${currentUser.getUserName()}" />
						<li class="nav-item">
						<a class="nav-link" href="${mapPageHref}" id="navOptions"><span class="fas fa-map-marked-alt"></span> Coffee Bars Map</a></li>
						
						<c:url var="changePasswordHref" value="/users/${currentUser.getUserName()}/changePassword" />
						<li class="nav-item">
						<a class="nav-link" href="${changePasswordHref}" id="navOptions"><span class="fas fa-key"></span> Change Password</a></li>
					</c:if>
			</ul>
					
			<ul class="navbar-nav">
					<c:choose>
						<c:when test="${empty currentUser}">
							<c:url var="newUserHref" value="/users/new" />
							<li class="nav-item">
							<a class="nav-link" href="${newUserHref}" id="navOptions"><span class="fa fa-user-plus"></span> Sign Up</a></li>
							<c:url var="loginHref" value="/login" />
							<li class="nav-item">
							<a class="nav-link" href="${loginHref}" id="navOptions"><span class="fa fa-sign-in-alt"></span> Log In</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="logoutAction" value="/logout" />
							<form id="logoutForm" action="${logoutAction}" method="POST">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
							</form>
							<li class="nav-item"><a class="nav-link" id="logoutLink" href="#">Log Out</a></li>
						</c:otherwise>
					</c:choose>			
            </ul>
        </div>
    </div>
</nav>


<script type="text/javascript">
var dailyGrindPageRoot = '<c:url value="/"/>';
</script>

		
		<div class="container-fluid h-100 justify-content-center align-items-center" id="form">

