<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/views/common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="w3-main" style="margin-left: 300px">

<%@include file="../header.jsp"%>
 
	<div class="w3-container w3-padding-large w3-grey">
	
		<h2>PLAN 작성</h2>
		 
		<div id="plan_write">
			<form action="${pageContext.request.contextPath}/plan_write" enctype="multipart/form-data" method="post">
				<input type="hidden" name="useIdx" id="idx"/>
				<label>작성자 :</label><input type="text" name="userId" value="${userVO.getNickname() }" readonly><br/>
				<label>비밀번호 :</label><input type="password" name="pwd" id="pwd"><br/>
				<label>제목 :</label><input type="text" name="title" id="title" value="test"><br/>
				<label>일정 :</label><input type="text" name="date" id="testDatepicker">
									<input type="time" name="time" id="timepicker"/>
				<br/>
				<label>장소 :</label><input type="text" name="loc" id="loc"><br/>
				<label>메인이미지 :</label><input type="file" id="myFile" name="myFile"><br/>
				
				<form name="writeForm" action="./summernote_insert.jsp" method="post">
					<textarea name="content" id="summernote" name="content" value=""></textarea>
				</form>
				<div class="plan_btn">
					<button type="button" onclick="sendData(this.form)">저장</button>
					<button type="button" onckick="">취소</button>
				</div>
		<!-- '저장'을 눌렀을때 작성자의 t_user테이블의 idx함께 보내기 작성자 value값 넣기-->	
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>

<script>
	function sendData(ff){
		//유효성 검사
		
/*  		if(ff.title.value == ""){
			alert("제목을 입력하세요");
			ff.title.focus();//커서 놓기
			return;
		}  */
		if(ff.date == ""){
			alert("일정을 입력하세요");
			ff.date.focus(); //커서 놓기
		} 
		if(ff.loc.vlue == ""){
			alert("장소를 입력하세요");
			ff.date.focus(); //커서 놓기
		} 
		alert("저장");
		ff.submit();
	}
</script>
<script type="text/javascript">
	//summernote
	$(document).ready(function() {
	  $('#summernote').summernote({
	    lang: 'ko-KR', // default: 'en-US'
	    height : 300,
	    focus:true,
	    callbaxks: { //이미지를 업로드할 경우 이벤트를 발생
 	    onImageUpload:function(files,editor,welEditable){
 	    	arter("summernote Fileupload");
	    	sendFile(files[0], this);
	    } 
	  }
	  });
	  $('#content').summernote('lineheight',.5);
	});
 	function sendFile(file,editor){
 		// 파일전송을 위해 폼객체를 생성한다
		data = new FormData();
		data.append("imageupload", file);
		
		$.ajax({
			data:data,
		type:"POST",
			url:"/imageUpload",
			cache:false,
			contenType:false,
			enctype: 'multipart/form-data',
			processData:false,
			success:function(data){
				$(editor).sumernote('insertImage', data.url);
				//consol.log(data);
				//$(editor).summernote('editor.insertImage', data.url);
			}
		});
	} 
</script>

<<script type="text/javascript">

//달력
/* 	$( function() {
	    $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();
	   
	    $( ".selector" ).datepicker({
	        altField: ".selecter"
	        	
	    });	   
	    alert("date");		
	  }); */
	$(function() {
	    $( "#testDatepicker" ).datepicker({
	         showButtonPanel: true, 
	         currentText: '오늘 날짜', 
	         closeText: '닫기', 
	         dateFormat: "yy년 mm월 dd일",
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	  });
	});
	
//시간

</script>





