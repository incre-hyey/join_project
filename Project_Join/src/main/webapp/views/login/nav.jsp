<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/js-image-slider.css">
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.zaccordion.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js-image-slider.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style="z-index:3;width:320px;" id="mySidebar"> <br>
	<div class="w3-container">
		<a href="#" onclick="w3_close()"
			class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
			title="close menu"> <i class="fa fa-remove"></i>
		</a> <br> <br>
		<h1>
			<a href="index.jsp">JOIN</a>
		</h1>
	</div>
	<div class="w3-bar-block">
		<div id="login">
			<form name="loginForm" action="${pageContext.request.contextPath}/login" method="POST">
				<input type="text" placeholder="ID" name="id" id="id">
				<input type="password" placeholder="PASSWORD" name="pwd" id="pwd">
				<button class="login_btn" onclick="loginFunc();">Login</button>
				<button class="join_btn" onclick="joinFunc()">Join</button>
<!-- 				<button class="naver_login">네이버 아이디로 로그인</button> -->
			</form>
		</div>