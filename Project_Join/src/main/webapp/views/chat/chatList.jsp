<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/views/common.jsp"%>
<div class="w3-main" style="margin-left: 300px">
<%@include file="chatMenu.jsp"%>
	<div class="w3-container w3-padding-large w3-grey">
		<h2>DIALOG</h2>
		<div id="plan_m">
			

			<c:import url="http://192.168.0.55:3000/room/roomList" charEncoding="utf-8">
				<c:param name="userVO">${sessionScope.userVO.getJsonStr() }</c:param>
				<c:param name="userid">${sessionScope.userVO.id }</c:param>
				<c:param name="page">${page }</c:param>
				<c:param name="category">${category }</c:param>
				<c:param name="search">${search }</c:param>
			</c:import>
			
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
