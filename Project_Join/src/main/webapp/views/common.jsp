<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>
<body>

<%@include file="/views/login/login_main.jsp"%>
<script>
var ctx = '<%=request.getContextPath()%>'; // joinapp
var webHost = location.protocol + "//" + location.host; // Ex) http://localhost:8088/
var webContext = webHost + ctx;
var viewMsg = '<%=(String)request.getAttribute("viewMsg")%>';
var msgClose = '<%=(String)request.getAttribute("msgClose")%>';

	$(document).ready(function() {
		if(msgClose !=null && msgClose != ""){
			if(opener.parent){
				opener.parent.location = webContext+"/afterSession";
				window.close();
				return;
			}
		}
		if(viewMsg != null && viewMsg != "null")
		{
			alert(viewMsg);
		}
	});
</script>

</body>
</html>