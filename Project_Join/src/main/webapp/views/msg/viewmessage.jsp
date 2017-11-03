<%@page import="join.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>받은 쪽지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function viewList(){
		var f = document.letterForm;
		f.menu.value= f.type.value;
		f.submit();
	}
	function repl(re){
		var f = document.letterForm;
		f.menu.value="WRITE";
		f.reply.value=re;
		f.submit();
	}
	function delivery(cont){
		var f = document.letterForm;
		f.menu.value="WRITE";
		f.content.value=cont;
		f.submit();
	}
	function delMsg(){
		var f = document.letterForm;
		f.menu.value="DEL";
		f.submit();
	}
</script>
</head>
<body>
<form name="letterForm" action="${pageContext.request.contextPath}/messageMain" method="post" enctype="multipart/form-data">
<%-- <input type="hidden" name="menu" value="<%=menu %>" /> --%>
<input type="hidden" name="menu"/>
<input type="hidden" name="type" value="${type }"/>
<input type="hidden" name="idx" value="${vo.idx}"/>
<input type="hidden" name="search" value="${search }" />
<input type="hidden" name="paging" value="${paging }" />
<input type="hidden" name="reply"/>
<input type="hidden" name="content"/>

<div>
<span class="content" style="text-align:left; padding-left:20px;">&nbsp;
<button type="button" class="button w3-button w3-left" onclick="viewList()">목록</button>
</span>
<span class="content" style="text-align:right; padding-right:20px;">
<c:if test="${type eq 'RCV'}">
	<button type="button" class="button w3-button w3-right" onclick="repl('${vo.sender }')">답장</button> &nbsp;
	<button type="button" class="button w3-button w3-right" onclick="delMsg('${vo.idx}')">삭제</button>&nbsp;
</c:if>
<c:if test="${type eq 'SEND'}">	  
	<button type="button" class="button w3-button w3-right" onclick="delivery('${vo.content }')">전달</button> &nbsp;
</c:if>
</span>
</div>
<ul id="receive_list" class="msg">

	<li>
						<p class="title">
						<strong>${vo.title }</strong></p>
						<p class="content">
							<a onclick="view('${vo.idx}');">${vo.content }</a>
						</p>
	</li>
	<li>
		
						<p class="content" style="text-align:right">
							${vo.send_date_str }
						</p>
	</li>

</ul>



<!-- 보낸 쪽지함에서만 -->
<c:if test="${type eq 'SEND'}">	  
<div class="rec_wrap">
	<h5>받는 사람</h5>
	<c:forEach var="rcv" items="${rcvList }">
		<p class="recipient"><strong>${rcv.userid }</strong>
		<c:choose>
		<c:when test="${rcv.read_date != null}">
			<span class="read">읽음 (${rcv.read_date_str })</span>
		</c:when>
		<c:otherwise>
			<span class="yet">안 읽음</span>
		</c:otherwise>
		</c:choose>
		</p>
	</c:forEach>
</div>	
</c:if>

</form>
				
</body>
</html>






