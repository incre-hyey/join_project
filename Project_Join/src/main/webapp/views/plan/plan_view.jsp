<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/views/common.jsp"%>
<div class="w3-main" style="margin-left: 300px">
<%@include file="../header.jsp"%>
	<div class="w3-container w3-padding-16 w3-grey">
	
		<h2>PLAN 보기</h2> 
		<div id="plan_view">
			<div class="plan_img">
				<img src="https://www.w3schools.com/w3images/avatar_g2.jpg" class="w3-round">
				<div class="map" id="map"style="width:400px;height:100%;">			
				</div>
			</div>
		
			<div class="plan_list">
				<ul>
					<li><strong>제목:</strong>${vo.title }</li>
					<li><strong>일정:</strong>${vo.getDateStr(vo.reg_date) }</li>
					<li><strong>장소:</strong>${vo.location1 }</li>
					<li><strong>내용:</strong><p>${vo.content }</p></li>
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

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=33584be1b96f778e02be89d98ebc6620"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	//function getInfo() {		
	// 영역의 남서쪽 좌표를 얻어옵니다 
    //var swLatLng = bounds.getSouthWest(); 
   // System.out.println(swLatLng);
    // 영역의 북동쪽 좌표를 얻어옵니다 
    //var neLatLng = bounds.getNorthEast();     
	//}
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
</script>
