<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@include file="../common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98dcf6562abb2a0c21f2baa8d0666439&libraries=services,clusterer,drawing"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<div class="w3-main" style="margin-left: 300px">

 
	<div class="w3-container w3-padding-large w3-grey">
	
		<h2>PLAN 작성</h2>	
		 
		<div id="plan_write">
		
			<form action="${pageContext.request.contextPath}/plan_write" enctype="multipart/form-data" method="post">
				
				<label>작성자 :</label><input type="text" name="writer" value="${userVO.getNickname() }" readonly><br/>
				<label>비밀번호 :</label><input type="password" name="p_pwd" id="p_pwd"><br/>
				<label>PLAN 종류 :</label>
					<select id ="plan_kind" name="plan_kind" class="other_input">
						<option value="travel">travel</option>
						<option value="meeting">meeting</option>
						<option value="meal">meal</option>
					</select><br/>
				<label>제목 :</label><input type="text" name="title" id="title"/><br/>
				<label>참여인원 :</label><input type="number" name="tnop" id="tnop" class="other_input"/><br/>	

				
		<!-- 일정 datepicker -->
			<div class="startDate">
				<label>일정 :</label><input type="text" name="start_date" style="width:25%;" id="start_date" readonly placeholder="시작일자를 입력하세요"/>	
				<input type="text" name="enddate" id="enddate" style="width:25%;" readonly placeholder="마지막 일자를 입력하세요"/>						
				<select id ="hour" name="hour" class="other_input">			
					<c:forEach begin='1' end ='24' varStatus="status">
						<option value="${status.index }">${status.index } 시</option>
					</c:forEach>
				</select>								
				<select id ="minute" name="minute" class="other_input">								
					<option value="00">00분</option>
					<option value="30">30분</option>
				</select>					
			</div><br/>	
		<!-- 주소 검색 -->		
		<label>주소 :</label>
		<input class="w3-button" type="button" onclick="execDaumPostcode()" value="검색">
		<input type="text" name="location1" id="sample5_address" class="other_input" placeholder="주소" readonly/><br/>
		<label>상세주소 :</label><input type="text" name="location2" id="location2"/><br/>
		
		<!-- file 이미지  -->			
		<label>메인이미지 :</label><input type="file" id="upload" name="upload" class="other_input"><br/>
		
		<!-- summerNote -->
		<textarea id="content" name="content"></textarea>
		<!-- 위도, 경도 보내기  -->
		<input type="hidden" id="longitude" name="longitude" value="longitude"/>
		<input type="hidden" id="latitude" name="latitude"" value="latitude"/>		
				
		<div class="plan_btn">
			<button class="w3-button btn btn-success" type="button" onclick="sendData(this.form)">저장</button>
			<button class="w3-button btn btn-default" type="button" onckick="cancel()">취소</button>			
		</div>
	</form>			
		<!-- '저장'을 눌렀을때 작성자의 t_user테이블의 idx함께 보내기 작성자 value값 넣기-->	
		</div>


</div>
	<%@include file="../footer.jsp"%>
</div>


<script type="text/javascript">
	////////////----------summernote
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
		
	    $( "#enddate" ).datepicker({
	    	 altField: ".selecter",
		     dateFormat : 'yy-mm-dd'
	    });	   
	    $( "#start_date" ).datepicker({
	    	 altField: ".selecter",
		     dateFormat : 'yy-mm-dd'
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
	 	        	//alert(data.src);
	 				$(editor).summernote(
	 					'insertImage', data.src);
	 			}
	 		});
		} 
	 	
	function sendData(ff){		

	// 일정 계산 
		var startdate = $('#start_date').val()//.replace(/-/g,'/');
		 var enddate = $('#enddate').val()//.replace(/-/g,'/');
	 	var hour = $('#hour').val();
		 var minute = $('#minute').val();
		 
		$('#start_date').val(startdate);
		$('#enddate').val( enddate+hour+minute);
		
		alert(startdate);
		alert(enddate+"&nbsp;"+hour+":"+minute);
	
	//유효성 검사
	if(ff.p_pwd == ""){
		alert("비밀번호를 입력하세요");
		ff.p_pwd.focus();
	}
		alert("저장"); 
		
		ff.submit();
	}

</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98dcf6562abb2a0c21f2baa8d0666439&libraries=services"></script>
<script>

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                var geocoder = new daum.maps.services.Geocoder();
                
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                //alert(fullAddr);
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용
                        
                  // 해당 주소에 대한 좌표를 받아서 위도, 경도 값을 jsp로 보낸다.
                  var loc = new daum.maps.LatLng(result.y, result.x);                         
					loc = loc+"";
					var idx1 = loc.indexOf(",",1);
					//alert(loc);
					latitude = loc.substring(1, idx1);
					longitude = loc.substring(idx1+1, loc.length-1);
	                 document.getElementById("latitude").value=latitude ;                    
	                 document.getElementById("longitude").value=longitude ; 
                 
                    }
                });
            }
        }).open();
    }

</script>

