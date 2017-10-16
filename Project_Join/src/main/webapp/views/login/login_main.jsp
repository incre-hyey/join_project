<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if(loginyn != null && loginyn.equals("Y")){
		%>
		<%@include file="/views/login/nav_login.jsp"%>
		<%
	}else{
		%>
		<%@include file="/views/login/nav.jsp"%>
		<%	
	}
%>
<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<ul id="nav" class="login_nav">
			<li><a href="${pageContext.request.contextPath}/plan" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal"> JOIN.PLAN</a>
			</li>

			<li><a href="#" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding"> JOIN.US</a></li>
				
<%if(loginyn != null && loginyn.equals("Y")){
	%>
			<li><a href="#" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding"> JOIN.LOG</a>
				<ul id="sub_nav">
					<li><a href="#" onclick="w3_close()"
						class="w3-bar-item w3-button w3-padding"> MY PLAN</a></li>
					<li><a href="#" onclick="w3_close()"
						class="w3-bar-item w3-button w3-padding"> MY TALK</a></li>
				</ul></li>
			
			<li><a href="#" onclick="chatBtnClick();"
				class="w3-bar-item w3-button w3-padding"> 대 화</a></li>
		</ul>
		</li>
		</ul>
		<button class="logout" onclick="window.location='${pageContext.request.contextPath}/logout'">Log out</button>
<%} %>
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