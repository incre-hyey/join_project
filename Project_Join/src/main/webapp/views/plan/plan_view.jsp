<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/views/common.js"%>
<div class="w3-main" style="margin-left: 300px">
<%@include file="../header.jsp"%>
	<div class="w3-container w3-padding-16 w3-grey">
		<h2>PLAN 보기</h2>
		<div id="plan_view">
			<div class="plan_img">
				<img src="https://www.w3schools.com/w3images/avatar_g2.jpg" class="w3-round">
				<div class="map">지도 영역</div>
			</div>
			<div class="plan_list">
				<ul>
					<li><strong>제목:</strong>직장인 소모임 싱글 커피 스피드데이트</li>
					<li><strong>일정:</strong>2017-09-16 16:00 (토)</li>
					<li><strong>장소:</strong>수원 인계동 커피히스토리 2층</li>
					<li><strong>내용:</strong><p>Google Chrome is a free, open-source web browser. Released
								in 2008.Google Chrome is a free, open-source web browser.
								Released in 2008.</p></li>
				</ul>
				<form action="">
					<input type="button" name="profile" value="프로필보기" class="button">
					<input type="button" name="talk" value="대화신청" class="button">
					<input type="button" name="msg" value="쪽지" class="button">
				</form>
			</div>

		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>

</div>
