<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="nav.jsp"%>
<div class="w3-main" style="margin-left: 300px">
<%@include file="header.jsp"%>
	<div class="w3-container w3-padding-large w3-grey">
		<h2>PLAN 작성</h2>
		<div id="plan_write">
			<form action="">
				<label>제목 :</label><input type="text"><br/>
				<label>일정 :</label><input type="text" id="datepicker"><br/>
				<label>장소 :</label><input type="text"><br/>
				<label>메인이미지 :</label><input type="file" id="myFile"><br/>
				<textarea name="content" id="summernote" value=""></textarea>
			</form>
			<div class="plan_btn">
				<button type="submit">저장</button>
				<button type="submit">수정</button>
				<button type="submit">취소</button>
			</div>
			
		</div>
	</div>
	<%@include file="footer.jsp"%>
</div>
