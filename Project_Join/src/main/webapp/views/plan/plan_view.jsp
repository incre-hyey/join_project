<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@include file="/views/common.jsp"%>
<div class="w3-main" style="margin-left: 300px">
<%@include file="../header.jsp"%>
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
					<li><strong>일정 : </strong></li>
					<li><strong>장소 : </strong>${vo.location1 }${vo.location2 }</li>
					<li><strong>참여인원 : </strong>${fn:length(vo.u_list)}/${vo.tnop }</li>
					<li><strong>내용 : </strong><p>${vo.content }</p></li>
				</ul>
				
				<form action="senData(this.form)">						
				<!-- 일반사용자들의 상세보기 버튼 -->		
				<div id="user">
					<input type="hidden" id="">
					<input type="button" name="profile" value="프로필보기" class="button">
					<input type="button" name="talk" value="대화신청" class="button">
					<input type="button" name="msg" value="쪽지" class="button">
					<input type="button" name="" value="참가신청" class="button">	
				</div>				
				<!-- 플랜작성자의 상세보기 버튼 -->
				<div id="planer" style="display:none;">
					<input type="button" name="edit_plan" value="수정하기" class="button"/>
					<input type="button" name="delete" value="삭제하기" class="button"/>
					<input type="button" name="sendCheck" value="신청함보기" class="button"/>
				</div>
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
	
	alert(latitude+","+longitude);

	
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
<!-- <script type="text/javascript">
	function senData(ff){
//		if(){
			
//		}//if
		
	}
</script> -->
