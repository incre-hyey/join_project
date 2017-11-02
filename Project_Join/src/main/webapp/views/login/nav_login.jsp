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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.zaccordion.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js-image-slider.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<style>
.hide{
	display:none;
}
</style>
<script>

$(function (){
	userMsgCheck();
	setInterval(userMsgCheck, 5000);
});
	/* 
		메세지 체크
	*/
	function userMsgCheck(){
        $.ajax({
            type : "POST",
            url : ctx+"/userMsgCheckAjax",
            dataType: "text",
            //data : obj,
            async: true,
//             error : function(request,status,error){
//                 alert(status + "  " + error);
//             }, //에러 시 alert창 띄우지 않는다.
            success : function(data){
				$("#msgCnt").removeClass('hide');
				$("#msgCnt").html(data);
            }
        });
	}
	function msgClick(){
		$("#msgCnt").addClass('hide');
		var pop = window.open(webContext + "/messageMain?menu=RCV" , "pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
</script>

	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left w3-card-4 w3-white"
		style="z-index:3;width:300px;" id="mySidebar"> <br>
	<div class="w3-container">
		<a href="#" onclick="w3_close()"
			class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
			title="close menu"> <i class="fa fa-remove"></i>
		</a>
		<h1>
			<a href="${pageContext.request.contextPath}/index">JOIN</a>
		</h1>
	</div>
	<div class="w3-bar-block">
		<div class="logined">
			<p class="my_icon"><a href="#"><i class="fa fa-bell" onclick="msgClick()"></i><sup id="msgCnt">0</sup></a> 
			<a href="${pageContext.request.contextPath}/userInfo"><i class="fa fa-cog" aria-hidden="true"></i></a></p>
			<h4 class="nick">${sessionScope.USER.nickname } 님 환영합니다!</h4>
		</div>
		