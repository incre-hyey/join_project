<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
//////////////////공통 포함할 부분=모든 jsp에서 포함할 값/jsp페이지 작성 ///////////////////////////
	//로그인되면 세션에 loginyn 값 Y 주셈 일단 Y로 가져가는걸 가정하에 Y세팅해놈
// 	String loginyn = "N";
	String loginyn = (String)request.getSession().getAttribute("loginyn");

%>

<%@include file="/views/login/login_main.jsp"%>
<script>
var ctx = '<%=request.getContextPath()%>'; // joinapp
var webHost = location.protocol + "//" + location.host; // Ex) http://localhost:8088/
var webContext = webHost + ctx;//http://localhost:8088/joinapp
var viewMsg = '<%=(String)request.getAttribute("viewMsg")%>';

	$(document).ready(function() {
		if(viewMsg != null && viewMsg != "null")
		{
			alert(viewMsg);
		}
	});
</script>
