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
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript">
$(function(){
	$("#pageDIV").html("${pagingHtml }");
});
	function view(idx) {
		
		var f = document.letterForm;
		f.menu.value="VIEW";
		f.idx.value = idx;
		f.submit();
	}
	function searchFunc(){
		var f = document.letterForm;
		f.menu.value="SEND";
		f.submit();
	}
	function pagingFunc(num){
		var f = document.letterForm;
		f.menu.value="SEND";
		f.paging.value=num;
		f.submit();
	}
</script>
<title></title>
</head>
<body>
<form name="letterForm" action="${pageContext.request.contextPath}/messageMain" method="post" enctype="multipart/form-data">
<input type="hidden" name="idx" value="" />
<input type="hidden" name="menu" />
<input type="hidden" name="type" value="SEND"/>
<input type="hidden" name="paging" value="${paging }"/>
</form>
	<ul id="receive_list" class="msg">
		<li>
		<p class="content search_btn"><input type="text" name="search" placeholder="ID, 내용, 제목 검색" value="${search }"/> 
		<button type="button" class="button w3-button" onclick="searchFunc()">검색</button></p>
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
							<a onclick="view('${vo.idx}');">${vo.content }</a>
						</p>
						<p>
						<c:if test="${vo.rcv_cnt > 1 }">
							<strong>${vo.rcv } 외 ${vo.rcv_cnt-1 } 명</strong>
						</c:if>
						<c:if test="${vo.rcv_cnt eq 1 }">
							<strong>${vo.rcv }</strong>
						</c:if>
							
							
							<span class="date">보낸 날짜 : ${vo.send_date_str }</span>
							
						</p>
					</li>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</ul>	

<!-- 페이징 -->		
<div class="pagination" >
    <div id="pageDIV" style="display:inline;">
    
    </div>
</div>
</body>
</html>