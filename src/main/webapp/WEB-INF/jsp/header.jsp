<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>The Daily Grind</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
	    <script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
	    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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

	<nav class="navbar navbar-inverse navbar-fixed-top" id="nav">
	<div class="container-fluid">
		
		
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
			<div class="nav navbar-nav navbar-brand">
				<c:url var="homePageHref" value="/" />							
				<a href="${homePageHref}" id="navtitle">The Daily Grind</a>
			</div>			
		</div>				
		
		<%--class="nav navbar-nav navbar-center navbar-brand mx-auto d-block text-center order-0 order-md-1 w-25" --%>
																			
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			
			<ul class="nav navbar-nav">
					<c:url var="aboutPageHref" value="/homepage" />
					<li><a href="${aboutPageHref}" id="navOptions">About</a></li>
			</ul>
		
			<ul class="nav navbar-nav navbar-right">	
					<c:if test="${not empty currentUser}">
						<c:url var="dashboardHref" value="/users/${currentUser}" />
						<li><a href="${dashboardHref}" id="navOptions">Private Messages</a></li>
						<c:url var="newMessageHref" value="/users/${currentUser}/messages/new" />
						<li><a href="${newMessageHref}" id="navOptions">New Message</a></li>
						<c:url var="sentMessagesHref" value="/users/${currentUser}/messages" />
						<li><a href="${sentMessagesHref}" id="navOptions">Sent Messages</a></li>
						<c:url var="changePasswordHref" value="/users/${currentUser}/changePassword" />
						<li><a href="${changePasswordHref}" id="navOptions">Change Password</a></li>
					</c:if>
			</ul>
			
		
			<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty currentUser}">
							<c:url var="newUserHref" value="/users/new" />
							<li><a href="${newUserHref}" id="navOptions"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
							<c:url var="loginHref" value="/login" />
							<li><a href="${loginHref}" id="navOptions"><span class="glyphicon glyphicon-log-in"></span> Log In</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="logoutAction" value="/logout" />
							<form id="logoutForm" action="${logoutAction}" method="POST">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
							</form>
							<li><a id="logoutLink" href="#">Log Out</a></li>
						</c:otherwise>
					</c:choose>
			</ul>
	</div>
	</div>
	</nav>			


		