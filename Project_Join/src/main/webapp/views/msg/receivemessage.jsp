<%@page import="join.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript">
	function view() {
		location.href= webContext+"/views/msg/viewmsg.jsp"
	}

</script>
<title>Insert title here</title>
</head>
<body>
<form name="letterForm" action="${pageContext.request.contextPath}/msgSend" method="post" enctype="multipart/form-data">

</form>
	
		<ul id="receive_list" class="msg">
		<li>
		<p class="content search_btn"><input type="text" name="search"/> 
		<button type="button" class="button w3-button">검색</button></p>
		
		</li>
		<c:choose>
			<c:when test="${list.size() eq 0 }">
				쪽지가 없습니다.
			</c:when>
			
			<c:otherwise>
				<c:forEach var="vo" items="${list}">
					<li>
						<p class="title">
						<c:if test="${vo.read_date == null}">
						<i class="material-icons" style="font-size:20px;color:red">fiber_new</i>
						</c:if>
						<strong>${vo.title }</strong></p>
						<p class="content">
							<a onclick="view();">${vo.content }</a>
						</p>
						<p>
							<strong>${vo.sender }</strong>
							<span class="date">보낸 날짜 : 2019-01-05</span>
						</p>
					</li>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</ul>	
</body>
</html>