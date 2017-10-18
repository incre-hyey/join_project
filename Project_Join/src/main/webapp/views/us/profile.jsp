<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 

<%@include file="/views/common.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
	<div class="w3-main" style="margin-left: 300px">
		<%@include file="../header.jsp"%>
		<div class="w3-card_con w3-padding-large w3-grey">

			<h2>PROFILE</h2>
			<c:forEach items="${list }" var="userVO" varStatus="s">
				<c:if test="${s.index%3 eq 2 }">
					<div class="row">
				</c:if>
						<div class="column">
							<div class="card">
								<img src="http://localhost:8088/joinapp/userImg?fileid=${userVO.file_id }" alt="Jane" style="width: 100%">
								<div class="card_con">
									<h3><c:out value="${userVO.nickname }"/></h3>
									<p class="title"><c:out value="${userVO.getAgeStr() }"/> / 
													<c:out value="${userVO.getBloodStr() }"/> /
													 <c:out value="${userVO.getGenderStr() }"/>
									</p>
									<p><c:out value="${userVO.intro_content }"/></p>
									<p><c:out value="${userVO.email }"/></p>
									<p>
										<button class="button">Contact</button>
									</p>
								</div>
							</div>
						</div>
				<c:if test="${s.index%3 eq 2 }">
					</div>
				</c:if>
			</c:forEach>
			<div class="row">
				<div class="column">
					<div class="card">
						<img src="https://www.w3schools.com/w3images/team1.jpg" alt="Jane" style="width: 100%">
						<div class="card_con">
							<h3>Nickname</h3>
							<p class="title">Age / Blood / Gender</p>
							<p>Some text that describes me lorem ipsum ipsum lorem.</p>
							<p>example@example.com</p>
							<p>
								<button class="button">Contact</button>
							</p>
						</div>
					</div>
				</div>

				<div class="column">
					<div class="card">
						<img src="https://www.w3schools.com/w3images/team2.jpg" alt="Mike" style="width: 100%">
						<div class="card_con">
							<h2>Mike Ross</h2>
							<p class="title">Art Director</p>
							<p>Some text that describes me lorem ipsum ipsum lorem.</p>
							<p>example@example.com</p>
							<p>
								<button class="button">Contact</button>
							</p>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="card">
						<img src="https://www.w3schools.com/w3images/team3.jpg" alt="John" style="width: 100%">
						<div class="card_con">
							<h2>John Doe</h2>
							<p class="title">Designer</p>
							<p>Some text that describes me lorem ipsum ipsum lorem.</p>
							<p>example@example.com</p>
							<p>
								<button class="button">Contact</button>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
