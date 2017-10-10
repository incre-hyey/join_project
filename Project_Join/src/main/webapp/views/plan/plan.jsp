<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/views/common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="w3-main" style="margin-left: 300px">
<%@include file="../header.jsp"%>
	<div class="w3-container w3-padding-large w3-grey">
		<h2>PLAN</h2>
		
<div id="plan_m">

			<form class="search">
				<input type="text" name="search" placeholder="검색">
				<a href="" class="button">검색</a>
				<a href="${pageContext.request.contextPath}/plan_write" onclick="" class="button">글쓰기</a>
			</form>  
			<!--('글쓰기'버튼을 눌렀을때 함께 보낼 값) idx=${idx}&nickname=${niackname} -->
			
			<c:forEach var="vo" items="${list }">
			<div class="plan_list">
				<div class="thumb">
					<img src="https://www.w3schools.com/w3images/avatar_g2.jpg"
						class="w3-round">
				</div>
				
				
				<div class="list_view">
					<ul>
						<li><a href="${pageContext.request.contextPath}/plan_view" onclick="">
								<ul>
									<li><strong>제목:</strong>${vo.title }</li>
									<li><strong>일정:</strong>${vo.reg_date }</li>
									<li><strong>장소:</strong>${vo.location1 }</li>
									<li><strong>참여인원:</strong>${vo.tnop }</li>
								</ul>
						</a></li>
					</ul>
				</div>
				<div class="list_join">
					<form action="">
						<button>참여하기</button>
						<a href="#" class="like">찜하기&nbsp;<i class="fa fa-gratipay" style="font-size:20px;color:red"></i></a>
					</form>
				</div>
			</div>				
	</c:forEach>
					

			<div class="pagination">
				<a href="#">&laquo;</a> <a href="#">1</a> <a class="active" href="#">2</a>
				<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
				<a href="#">&raquo;</a>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
