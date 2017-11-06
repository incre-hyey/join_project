<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="join.vo.UserVO" %>
<%@ page import="join.service.UtilService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//////////////////공통 포함할 부분=모든 jsp에서 포함할 값/jsp페이지 작성 ///////////////////////////
//로그인되면 세션에 loginyn 값 Y 주셈 일단 Y로 가져가는걸 가정하에 Y세팅해놈
String loginyn = "N";
loginyn = (String)request.getSession().getAttribute("LOGINYN");
System.out.println(request.getSession().getAttribute("USER") + "!!!!!!!");
// UserVO userVO = (UserVO)request.getSession().getAttribute("USER")
	if(loginyn != null && loginyn.equals("Y")){
		%>
		<%@include file="/views/login/nav_login.jsp"%>
		<%
	}else{
		%>
		<%@include file="/views/login/nav.jsp"%>
		<%	
	}
String m_m = UtilService.getValue((String)request.getAttribute("m_m"), "");

%>
<script>
function msgBtnClick(){
	var pop = window.open(webContext + "/messageMain?menu=RCV" , "pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function myPlanClick(){
	location.href = webContext + "/myPlan";
}

</script>
<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<ul id="nav" class="login_nav">
			<li><a href="${pageContext.request.contextPath}/plan" onclick="w3_close()"
				class='w3-bar-item w3-padding <%if(m_m.equals("PLAN")){ %>w3-text-teal<%} %>'> JOIN.PLAN</a>
			</li>
			<li><a href="${pageContext.request.contextPath}/profile" onclick="w3_close()"
				class='w3-bar-item w3-padding" <%if(m_m.equals("PROFILE")){ %>w3-text-teal<%} %>'> JOIN.PROFILE</a></li>
				
<%if(loginyn != null && loginyn.equals("Y")){
	%>
			<li><a href="#" onclick="chatBtnClick();"
				class="w3-bar-item w3-padding <%if(m_m.equals("TALK")){ %>w3-text-teal<%} %>"> JOIN.TALK</a></li>
			<li><a href="#" onclick="w3_close()"
				class="w3-bar-item w3-padding <%if(m_m.equals("LOG")){ %>w3-text-teal<%} %>"> JOIN.LOG</a>
				<ul id="sub_nav">
					<li><a onclick="myPlanClick()"
						class="w3-bar-item w3-padding"> MY PLAN</a></li>
					<li><a onclick="msgBtnClick()"
						class="w3-bar-item w3-padding"> MY MESSAGE</a></li>
				</ul></li>
		</ul>
		</li>
		</ul>
		<button class="logout w3-button" onclick="window.location='${pageContext.request.contextPath}/logout'">Log out</button>
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