<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
<style>
a#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    z-index: 999;
}
</style>
<form name="profileForm" id="profileForm" >

		<div class="w3-card_con w3-padding-large w3-grey" id="profileDIV">
			<h2>PROFILE</h2>
			
							<div class="card">
								<img src="${pageContext.request.contextPath}/viewImg?fileid=${userVO.file_id }&module=USER" style="width: 400px">
								<div class="card_con">
									<h3><c:out value="${userVO.nickname }"/></h3>
									<p class="title"><c:out value="${userVO.getAgeStr() }"/> / 
													<c:out value="${userVO.getBloodStr() }"/> /
													 <c:out value="${userVO.getGenderStr() }"/>
									</p>
									<p><c:out value="${userVO.intro_content }"/></p>
									<p><c:out value="${userVO.email }"/></p>
									<p style="text-align:right;">
<!-- 										<button class="button">Contact</button> -->
									
									</p>
								</div>
							</div>
						</div>
	
</form>
