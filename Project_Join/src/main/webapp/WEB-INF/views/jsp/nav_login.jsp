<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/jquery.zaccordion.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<title>함께 만드는 JOIN</title>
</head>
<body>
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style="z-index:3;width:300px;" id="mySidebar"> <br>
	<div class="w3-container">
		<a href="#" onclick="w3_close()"
			class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
			title="close menu"> <i class="fa fa-remove"></i>
		</a> <img src="/w3images/avatar_g2.jpg" style="width: 45%;"
			class="w3-round"><br> <br>
		<h1>
			<a href="index.jsp">JOIN</a>
		</h1>
	</div>

	<div class="w3-bar-block">
		<div class="logined">
			<p class="my_icon"><a href="#"><i class="fa fa-bell"></i></a> <a href="#"><i class="fa fa-cog" aria-hidden="true"></i></a></p>
			<img src="https://www.w3schools.com/w3images/avatar_g2.jpg"
				style="width: 45%;" class="w3-round">
			<h4 class="nick">Nickname</h4>
		</div>
		<ul id="nav" class="login_nav">
			<li><a href="plan.jsp" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal"> JOIN.PLAN</a>
			</li>

			<li><a href="profile.jsp" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding"> JOIN.US</a></li>
			<li><a href="profile.jsp" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding"> JOIN.LOG</a>
				<ul id="sub_nav">
					<li><a href="#" onclick="w3_close()"
						class="w3-bar-item w3-button w3-padding"> MY PLAN</a></li>
					<li><a href="#" onclick="w3_close()"
						class="w3-bar-item w3-button w3-padding"> MY TALK</a></li>
				</ul></li>
		</ul>
		</li>
		</ul>
		<button type="submit" class="logout">Log out</button>
	</div>
	<div class="w3-panel w3-large">
		<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
			class="fa fa-instagram w3-hover-opacity"></i> <i
			class="fa fa-snapchat w3-hover-opacity"></i> <i
			class="fa fa-pinterest-p w3-hover-opacity"></i> <i
			class="fa fa-twitter w3-hover-opacity"></i> <i
			class="fa fa-linkedin w3-hover-opacity"></i>
	</div>
	</nav>
	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>