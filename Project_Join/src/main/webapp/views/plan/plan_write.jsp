<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<div class="w3-main" style="margin-left: 300px">

 
	<div class="w3-container w3-padding-large w3-grey">
	
		<h2>PLAN 작성</h2>	
		 
		<div id="plan_write">
		
			<form action="${pageContext.request.contextPath}/plan_write" enctype="multipart/form-data" method="post">
			
				<label>작성자 :</label><input type="text" name="writer" value="${userVO.getNickname() }" readonly><br/>
				<label>비밀번호 :</label><input type="password" name="pwd" id="pwd"><br/>
				<label>제목 :</label><input type="text" name="title" id="title"/><br/>
				<div>
				<label>일정 :</label><input type="datetime" name="datepicker" id="datepicker" />									
			
				<select id ="time" name="time"><option value="오전">오전</option><option value="오후">오후</option></select>
				<select id ="minute" name="minute">
			<c:forEach begin='1' end ='12' varStatus="status">
					<option value="${status.index }">${status.index } 시</option>
			</c:forEach></select>								
				<select id ="second" name="second">								
					<option value="00">00분</option><option value="30">30분</option></select>	
			</div>			
				
				<label>장소 :</label><input type="text" name="loc" id="loc"><br/>
				<label>메인이미지 :</label><input type="file" id="upload" name="upload"><br/>
				<textarea id="content" name="content"></textarea>
				
				<div class="plan_btn">
					<button type="button" onclick="sendData(this.form)">저장</button>
					<button type="button" onckick="">취소</button>
				</div>
		<!-- '저장'을 눌렀을때 작성자의 t_user테이블의 idx함께 보내기 작성자 value값 넣기-->	
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>

<script type="text/javascript">
	//summernote
	$(function() {
		$('#content').summernote({
	    	height: 300,
	    	maxHeight: 350,
	    	minHeight: 200,
	    	focus: true,
	    	lang: 'ko-KR', // default: 'en-US'
	    	callbacks:{
	    		onImageUpload: function(files, editor, welEditable){	    	
	    			sendFile(files[0], this);
	    		}
	    	}
	    });
	    
	    $('#content').summernote('lineHeight',.5);	    
		
	    $( "#datepicker" ).datepicker({
	    	 altField: ".selecter",
		     dateFormat : 'yy년 mm월 dd일'
	    });	   
	  	 
	});	
		
	 	function sendFile(file,editor){
	 		//파일 전송을 위해 폼객체를 생성한다.
	 		var form = new FormData();//FormData 는 HTML5 에서 제공되는 객체이다
	 		//기존 <form> 엘리먼트 역할
	 		form.append("upload", file);
	 		
	 		$.ajax({ //비동기식 통신을 이용해 파일보내기
	 			data: form,
	 	        type: "POST",
	 	        url: '/joinapp/summerFileUpload',
	 	        cache: false,
	 	        contentType: false,
	 	        dataType : "json",
	 	        enctype: 'multipart/form-data',
	 	        processData: false,
	 	        error : function(request,status,error){
	 	        	alert(status + "upload 실패 : " + error);
	 	        },
	 	        success: function(data) {
	 	        	alert(data.src);
	 				$(editor).summernote(
	 					'insertImage', data.src);
	 			}
	 		});
		} 
	 	function sendData(ff){
			//유효성 검사

			
/* 			if(ff.date == ""){
				alert("일정을 입력하세요");
				ff.date.focus(); //커서 놓기
			} 
			if(ff.loc.vlue == ""){
				alert("장소를 입력하세요");
				ff.date.focus(); //커서 놓기
			}if(ff.planFile == null){
				alert("파일을 입력하세요");
			}*/
			alert("저장"); 
			
			ff.submit();
		}
		  /* $(function() { 
		    $( "#datepicker" ).datepicker({
		         showButtonPanel: true, 
		         currentText: '오늘 날짜', 
		         closeText: '닫기', 
		         dateFormat: "yy년 mm월 dd일",
		         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		  });
		}); */
</script>





