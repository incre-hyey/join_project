<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar">
	<br>
	<div class="w3-container">
		<a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
			title="close menu"> 
			<i class="fa fa-remove"></i>
		</a> 
		<h1>
			<b>JOIN</b>
		</h1><br>
		
		<img src="https://www.w3schools.com/w3images/avatar_g2.jpg" style="width: 45%;"
			class="w3-round"><br>
		
		
		<p class="w3-text-grey">Nickname</p>
	</div>
	<div class="w3-bar-block">
		<a href="#portfolio" onclick="w3_close()"
			class="w3-bar-item w3-button w3-padding w3-text-teal"><i
			class="fa fa-th-large fa-fw w3-margin-right"></i>플랜</a> <a
			href="#about" onclick="w3_close()"
			class="w3-bar-item w3-button w3-padding"><i
			class="fa fa-user fa-fw w3-margin-right"></i>프로필</a> <a href="#contact"
			onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i
			class="fa fa-envelope fa-fw w3-margin-right"></i>마이페이지</a>
			 <a href="#contact"
			onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i
			class="fa fa-envelope fa-fw w3-margin-right"></i>마이페이지2</a>
			 <a href="#contact"
			onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i
			class="fa fa-envelope fa-fw w3-margin-right"></i>마이페이지3</a>
	</div>
	<div class="w3-panel w3-large">
		<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
			class="fa fa-instagram w3-hover-opacity"></i> <i
			class="fa fa-snapchat w3-hover-opacity"></i> <!-- <i
			class="fa fa-pinterest-p w3-hover-opacity"></i> <i
			class="fa fa-twitter w3-hover-opacity"></i> <i
			class="fa fa-linkedin w3-hover-opacity"></i> -->
	</div>
	</nav>
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
