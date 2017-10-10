<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="join.vo.UserVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/views/common.jsp"%>
<div class="w3-main" style="margin-left: 300px">
<%@include file="chatMenu.jsp"%>

<script>
	window.onload = function(){
		alert(1);
	}
</script>
	<div class="w3-container w3-padding-large w3-grey">
		<h2>DIALOG</h2>
		<div id="plan_m">
			<form class="search">
				
				<input type="text" name="search" placeholder="검색">
				<a href="#" class="button">search</a>
				<a href="#" class="button">create</a>
			</form>
<%-- 			<jsp:include page="/roomList" flush="false" /> --%>
			<c:import url="http://localhost:3000/user/login_ok" charEncoding="utf-8">
				<c:param name="id">${sessionScope.userVO.id }</c:param>
				<c:param name="name">${sessionScope.userVO.name }</c:param>
			</c:import>
			
			<div class="pagination">
				<a href="#">&laquo;</a> <a href="#">1</a> <a class="active" href="#">2</a>
				<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
				<a href="#">&raquo;</a>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
