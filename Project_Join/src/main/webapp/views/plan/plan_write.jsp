<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/views/common.jsp"%>
<div class="w3-main" style="margin-left: 300px">
<%@include file="../header.jsp"%>
	<div class="w3-container w3-padding-large w3-grey">
		<h2>PLAN 작성</h2>
		<div id="plan_write">
			<form action="plan_write" enctype="multipart/form-data" method="post">
				<label>제목 :</label><input type="text" name="title" id="title"><br/>
				<label>일정 :</label><input type="datetime" name="date" id="datepicker"><br/>
				<label>장소 :</label><input type="text" name="loc" id="loc"><br/>
				<label>메인이미지 :</label><input type="file" id="myFile" name="myFile"><br/>
				<textarea name="content" id="summernote" value=""></textarea>
			
				<div class="plan_btn">
					<button type="button" onclick="sendData(this.form)">저장</button>
					<button type="button">수정</button>
					<button type="button">취소</button>
				</div>
			</form>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
<script>
	function sendData(ff){
		//유효성 검사
		
		if(ff.title.value == ""){
			alert("제목을 입력하세요");
			ff.title.focus();//커서 놓기
			return;
		}else if(ff.date.vlue == ""){
			alert("일정을 입력하세요");
			ff.date.focus(); //커서 놓기
		}
		
		ff.submit();
	}
</script>