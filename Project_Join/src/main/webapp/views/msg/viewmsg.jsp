<%@page import="join.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/basic.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<form name="letterForm"
		action="${pageContext.request.contextPath}/msgSend" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="idx" /> <input type="hidden" name="search" />
		<input type="hidden" name="page" />

		<div class="view_btn">
			<button type="button" class="button w3-button w3-left">목록</button>
			<button type="button" class="button w3-button w3-right">삭제</button>
			<button type="button" class="button w3-button w3-right">답장</button>
		</div>
		<ul id="receive_list" class="msg">

			<li>
				<p class="title">
					<strong>제목입니다.</strong>
				</p>
				<p class="content">
					<a onclick="view('${vo.idx}');">내용입니다.</a>
				</p>
				<p class="date" style="text-align: right">2017-10-30 16:16:42
				</p><!-- 날짜 영역 -->
			</li>

		</ul>



		<!-- 보낸 쪽지함에서만 -->
		<div class="rec_wrap">
			<h5>받는 사람</h5>
			<p class="recipient"><strong>a1</strong><span class="yet">안 읽음</span></p>
			<p class="recipient"><strong>bbangjjagnja</strong><span class="read">읽음</span></p>
		</div>	
<!-- 		<table class="table">
			<thead>
				<tr>
					<th>받는 사람</th>
					<th></th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>a1</td>
					<td>안 읽음</td>
				</tr>
			</tbody>
		</table> -->

	</form>

</body>
</html>






