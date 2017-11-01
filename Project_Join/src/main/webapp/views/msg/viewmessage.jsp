<%@page import="join.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>받은 쪽지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

</head>
<body>
<form name="letterForm" action="${pageContext.request.contextPath}/msgSend" method="post" enctype="multipart/form-data">
	
	<c:forEach var="vo" items="${list}">
	<li><div id="view_msg" class="msg">
		<p class="date">${vo.rcv_date }</p>
		<p>내용 : ${vo.content }</p>
	</div></li>
	</c:forEach>
	
	<div class="msg_btn">
		<input type="button" value="삭제" class="btn btn-default"/>
		<input type="button" value="쪽지보내기" class="btn btn-warning"/>
	</div>
</form>
				
</body>
</html>






