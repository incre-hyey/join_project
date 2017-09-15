<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/basic.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
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
			<a href="jsp/index.jsp">JOIN</a>
		</h1>
		<p class="w3-text-grey">함께 만드는 JOIN</p>
	</div>
	<div class="w3-bar-block">
		<ul id="nav">
			<li><a href="plan.jsp" onclick="w3_close()"	class="w3-bar-item w3-button w3-padding w3-text-teal">
				<i class="fa fa-th-large fa-fw w3-margin-right"></i>JOIN PLAN</a>
				<ul>
					<li><a href="plan.jsp">플랜보기</a></li>
				</ul>
			</li>
				
			<li><a href="profile.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"> 
				<i class="fa fa-user fa-fw w3-margin-right"></i>JOIN US</a>
				<ul>
					<li><a href="profile.jsp">친구 보기</a></li>
				</ul>
			</li>
			<li><a href="login.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-envelope fa-fw w3-margin-right"></i>마이페이지</a>
				<ul>
					<li><a href="http://localhost:3000/login">로그인</a></li>
					<li><a href="http://www.google.com/search?q=web+design+tutorials">Tutorials</a></li>
					<li><a href="http://www.google.com/search?q=web+design+user+interface">User
							Interfaces</a></li>
					<li><a href="http://www.google.com/search?q=web+design">Website
							Layouts</a></li>
				</ul></li>	
			<li><a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"> 
				<i class="fa fa-envelope fa-fw w3-margin-right"></i>공지사항</a></li>
	
		</ul>
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
