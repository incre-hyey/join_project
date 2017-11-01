<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@include file="/views/common.jsp"%>
<div class="w3-main" style="margin-left: 300px">
<%@include file="../header.jsp"%>
<script type="text/javascript">
 //'참가신청' 
	function appPeople(){	
 		var stat = '${vo.userStat}';
 		// alert("신청되었습니다"); 
 		if(stat == '0' || stat == '1'){
 			alert("이미 신청되었습니다.");
 			return false;
 		}
 		location.href='${pageContext.request.contextPath}/appPeople?idx=${vo.idx}';
	}
 
	//수정하기 버튼을 클릭했을대
 function sendEdit(){
	 var userPwd = $('#userPwd').val();
		var p_pwd = $('#p_pwd').val();
		//alert(userPwd+"앞뒤비교하기"+p_pwd);
		if(userPwd == p_pwd){
			location.href='${pageContext.request.contextPath}/planEdit?idx='+'${vo.idx}';
		}else{
			alert("비밀번호를 확인하세요");
		}
		
 }
	// 삭제하기를 눌렀을때 
	function delete(){
		
		
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
					<li><strong>일정 : </strong></li>
					<li><strong>장소 : </strong>${vo.location1 }${vo.location2 }</li>
					<li><strong>참여인원 : </strong>${fn:length(vo.u_list)}/${vo.tnop }</li>
					<li><strong>내용 : </strong><p>${vo.content }</p></li>
				</ul>
				
				<form name="viewForm">						
				<!-- 일반사용자들의 상세보기 버튼 -->		
				<div id="user">
					<input type="hidden" name="idx" value="${vo.idx }" />
					<input type="button" name="list" onclick="JavaScript:location.href='${pageContext.request.contextPath}/plan'" value="목록보기" class="btn btn-primary"/>
					<!-- <input type="button" name="profile" value="프로필보기" class="btn btn-primary"> -->
					<input type="button" name="talk" value="대화신청" class="btn btn-success"/>
					<input type="button" name="msg" value="쪽지" class="btn btn-warning"/>
					<button type="button" onclick="appPeople()" class="btn btn-info">참가신청</button>
				</div>				
				<!-- 플랜작성자의 상세보기 버튼 -->
				<div id="planer" style="display:block;">
					<input type="hidden" id="userIdx" name="userIdx" value="${sessionScope.USER.idx }"/>
					<input typw="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요"/>
					<input type="hidden" name="p_pwd" id="p_pwd" value="${vo.p_pwd }"/>
					<input type="button" name="edit_plan" onclick="sendEdit()" value="수정하기" class="button btn btn-primary"/>
					<input type="button" name="delete" onclick="delete()" value="삭제하기" class="button btn btn-default"/>
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

