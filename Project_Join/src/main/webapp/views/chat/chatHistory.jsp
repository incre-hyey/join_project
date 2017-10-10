<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/views/common.jsp"%>
<div class="w3-main" style="margin-left: 300px">
<%@include file="chatMenu.jsp"%>
	<div class="w3-container w3-padding-large w3-grey">
		<h2>HISTORY</h2>
		<div id="plan_m">
			
<%-- 			<jsp:include page="/roomList" flush="false" /> --%>

			<c:import url="http://localhost:3000/chat/history" charEncoding="utf-8">
<%-- 				<c:param name="useridx">${sessionScope.userVO.idx }</c:param> --%>
				<c:param name="userVO">${sessionScope.userVO.getJsonStr() }</c:param>
				<c:param name="page">${page }</c:param>
			</c:import>
			
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
