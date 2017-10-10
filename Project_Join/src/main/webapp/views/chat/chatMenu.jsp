<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header id="portfolio">
	<a href="#"></a>
	<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
		onclick="w3_open()"><i class="fa fa-bars"></i></span>
	<div class="w3-container">
		<!-- <h1>
				<b>title 영역</b>
			</h1> -->
<%
	System.out.println(request.getRequestURL().toString()); // "http://localhost:8088/joinapp/views/chat/chatList.jsp"
	String url = request.getRequestURI(); //  "/joinapp/views/chat/chatList.jsp"
	String listBtn = "w3-white";
	String histBtn = "w3-white";
	if (url.indexOf("List") != -1) {
		listBtn = "w3-black";
	} else if (url.indexOf("History") != -1) {
		histBtn = "w3-black";
	}
%>
		<div class="w3-section w3-bottombar w3-padding-16">
			<button class="w3-button <%=listBtn %>" onclick="chatBtnClick();">방 목록</button>
			<button class="w3-button <%=histBtn %>" onclick="chatHisBtnClick();">
				이전 대화
			</button>
		</div>
	</div>
</header>

