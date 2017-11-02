<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
// 	String importUrl = request.getContextPath()+"/sendmessage";
	String importUrl = (String)request.getAttribute("importUrl");
	System.out.println("!@#" + importUrl);
%>
<script>
var ctx = '<%=request.getContextPath()%>'; // joinapp
var webHost = location.protocol + "//" + location.host; // Ex) http://localhost:8088/
var webContext = webHost + ctx;
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function pageReplace(men){
		location.href= webContext+"/messageMain?menu="+men;
		
	}
</script>

<script>  <!-- 쪽지함 탭 -->
function openTab(event, tabName) {
    var i, msgContent, tablinks;
    msgContent = document.getElementsByClassName("msgContent");
    for (i = 0; i < msgContent.length; i++) {
    	msgContent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace("active", "");
    }
    document.getElementById(tabName).style.display = "block";
    event.currentTarget.className += " active";
}
// document.getElementById("defaultOpen").click(function(){
	
// });
</script>

</head>
<body>

	<div class="tab">
		<button class="tablinks" onclick="pageReplace('RCV')">받은쪽지함</button>
		<button class="tablinks" onclick="pageReplace('SEND')">보낸쪽지함</button>
		<button class="tablinks" onclick="pageReplace('WRITE')">쪽지보내기</button>
	</div>
	<c:import url="<%= importUrl %>" charEncoding="utf-8">
	</c:import>


</body>
</html>