<%@page import="join.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="letterForm" action="${pageContext.request.contextPath}/msgSend" method="post" enctype="multipart/form-data">
	<input type="hidden" name="sender" value="${sessionScope.userVO.id }"/>
	<input type="hidden" name="idx" value="${sessionScope.userVO.idx }"/>
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
						<strong>${vo.title }</strong></p>
						<p class="content">
							<a onclick="view();">${vo.content }</a>
						</p>
						<p>
						<c:if test="${vo.rcv_cnt > 1 }">
							<strong>${vo.rcv } 외 ${vo.rcv_cnt-1 } 명</strong>
						</c:if>
						<c:if test="${vo.rcv_cnt eq 1 }">
							<strong>${vo.rcv }</strong>
						</c:if>
							
							<c:if test="${vo.read_date != null}">
							<span class="date">읽은 날짜 : 2019-01-05</span>
							</c:if>
							<span class="date">보낸 날짜 : 2019-01-05</span>
							
						</p>
					</li>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</ul>	
</body>
</html>