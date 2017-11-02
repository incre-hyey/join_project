<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@include file="/views/common.jsp"%>
<div class="w3-main" style="margin-left: 300px">
<%@include file="../header.jsp"%>
<style type="text/css">
#del_Win{
	width: 250px;
	height: 90px;
	padding: 20px;
	border: 1px solid #00baee;
	border-radius: 10px;
	background-color: #efefef;
	text-align: center;
	position: absolute;
	top: 150px;
	left: 250px;
	display: none;
}
</style> 
<script type="text/javascript">

// 실행시 자동으로 설정
$(".viewForm").ready(function(){
	var userIdx = "${sessionScope.USER.idx }";
	var writeridx = "${vo.writer_idx}";
	// alert(userIdx);
	 if(userIdx === writeridx){
		// alert("aaaaaaaaaaaaa");
		 document.getElementById("planner").style.display = "block";		
		 document.getElementById("userPlan").style.display = "none"; 
	 }else{
		 document.getElementById("planner").style.display = "none";
		 document.getElementById("userPlan").style.display = "block";
	 }
});

 //'참가신청' 
	function appPeople(){	
 		var stat = '${vo.userStat}';
 		// alert("신청되었습니다"); 
 		if(stat == '0' || stat == '1'){
 			alert("이미 신청되었습니다.");
 			return false;
 		} 		
 		location.href='${pageContext.request.contextPath}/appPeople?idx=${userPwd}';
	}

//수정하기 버튼을 클릭했을때  비밀번호 검사	
 function sendEdit(){				
	
	 var userPwd = $('#userPwd').val();
	 var p_pwd = $('#p_pwd').val();	
	 var idx =" ${vo.idx}";
		//alert(p_pwd);
		
	if(userPwd == p_pwd){
			$('#p_pwd').val(p_pwd);
			location.href='${pageContext.request.contextPath}/planEdit?idx=${vo.idx}&p_pwd='+p_pwd;
			alert("수정컨트롤러로 이동!");
	}else{
			alert("비밀번호를 확인하세요");
			$('#userPwd').val("");
			$('#userPwd').focus();
			
		}
		
	}
	// 삭제하기를 눌렀을때 
	function del(ff){
		//alert("dddddddddddd");
		 var userPwd = $('#userPwd').val();
		 var p_pwd = $('#p_pwd').val();	
		 
		if(userPwd == p_pwd){
				$('#p_pwd').val(p_pwd);
				alert("삭제 !!");
				
				
		}else{
				alert("비밀번호를 확인하세요");
				$('#userPwd').val("");
				$('#userPwd').focus();
				return false;
			}			
		
		ff.submit();
		//location.href='${pageContext.request.contextPath}/delete';
	}
	
	function del_form(){
		alert("삭제 폼 발생!");
		document.getElementById("del_Win").style.display = "block";
	}
	
	function del_cancel(){
		document.getElementById("del_Win").style.display = "none";
	}
</script>
	<div class="w3-container w3-padding-16 w3-grey">
	
		<h2>PLAN 보기</h2> 
		<div id="plan_view">
			<div class="plan_img">
				
				<c:if test="${vo.file_id == null }">
					<img src="${pageContext.request.contextPath}/resources/images/default_image.png">					
				</c:if>
				<c:if test="${vo.file_id != null }">
					<img src="${pageContext.request.contextPath}/viewImg?fileid=${vo.file_id }&module=PLAN"  class="w3-round">
				</c:if>
				<div class="map" id="map"style="width:400px;height:100%;">						
				</div>
				<input type="hidden" id="latitude" name="latitude" value="${vo.latitude }"/>	
				<input type="hidden" id="longitude" name="longitude" value="${vo.longitude }"/>	
			</div>
		
			<div class="plan_list">
				<ul>					
					<li><strong>제목 : </strong>${vo.title }</li>
					<li><strong>작성자 : </strong>${vo.writer }</li>
					<li><strong>일정 : </strong>${vo.start_date } ~ ${vo.end_date }</li>
					<li><strong>장소 : </strong>${vo.location1 }~${vo.location2 }</li>
					<li><strong>참여인원 : </strong>${fn:length(vo.u_list)+1}/${vo.tnop }</li>
					<li><strong>내용 : </strong><p>${vo.content }</p></li>
				</ul>
					<%-- <fmt:parseDate value="${vo.start_date }" pattern="yyyy-MM-dd" var="startdate"/>									
						<fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd"/> ~
						<fmt:parseDate value="${vo.end_date }" pattern="yyyy-MM-dd hh:mm:ss" var="enddate"/>									
						<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd hh:mm"/> --%>
				
				<form class="viewForm">						
				<!-- 일반사용자들의 상세보기 버튼 -->		
				<div id="userPlan">
					<input type="hidden" name="idx" value="${vo.idx }" />
					<input type="button" name="list" onclick="JavaScript:location.href='${pageContext.request.contextPath}/plan'" value="목록보기" class="btn btn-primary"/>
					<!-- <input type="button" name="profile" value="프로필보기" class="btn btn-primary"> -->
					<input type="button" name="talk" value="대화신청" class="btn btn-success"/>
					<input type="button" name="msg" value="쪽지" class="btn btn-warning"/>
					<input type="button" onclick="appPeople()" class="btn btn-info" value="참가신청"/>
				</div>				
				<!-- 플랜작성자의 상세보기 버튼 -->
				<div id="planner">
					<input type="hidden" id="userIdx" name="userIdx" value="${sessionScope.USER.idx }"/>
					<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요"/>					
					<input type="hidden" name="p_pwd" id="p_pwd" value="${vo.p_pwd }"/>
					<input type="button" name="edit_plan" onclick="sendEdit()" value="수정하기" class="button btn btn-primary"/>
					<input type="button" name="delete" onclick="del_form()" value="삭제하기" class="button btn btn-default"/>
				</div>
			</form>
		</div>
<!-- 삭제버튼을 눌렀을때 나타나는 div -->
<div id="del_Win">
	<form action="${pageContext.request.contextPath}/delete" method="post">		
		<input type="hidden" id="userIdx" name="userIdx" value="${sessionScope.USER.idx }"/>
		<input type="hidden" id="idx" name="idx" value="${vo.idx }"/>
	<%-- 	<input type="hidden" id="writer_idx" name="writer_idx" value="${vo.writer_idx }">	 --%>	
		<p>정말로 삭제 하시겠습니까?</p>
		<input type="submit" value="삭제" onclick="del(this.form)"/>
		<input type="button" id="cancel" value="취소" onclick="del_cancel()"/>		
	</form>
</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>

</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98dcf6562abb2a0c21f2baa8d0666439"></script>

<script>
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	var latitude  = document.getElementById('latitude').value;
	var longitude  = document.getElementById('longitude').value;
	
	//alert(latitude+","+longitude);

	
	console.log(latitude+longitude);
	// 숫자로 변환
/* 	 longitude = Number(longitude);
	 latitude = Number(latitude); */
	
	var mapOption = { 
	        center: new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new daum.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	// 지도에 마커를 표시합니다
	marker.setMap(map);	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(longitude, latitude); 
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
 	
//	    marker.setPosition(latlng); 

</script>

