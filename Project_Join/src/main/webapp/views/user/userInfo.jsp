<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/basic.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function(){
	defaultSetting();
});


	/**
	 * ver1.주소 API
	 * 주소 API 팝업
	 * @param context
	 * @returns

	 function goPopup(context){
	 event.preventDefault();
	 // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	 var pop = window.open(context+"/views/api/jusoPop.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	 // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	 //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
	
	 return pop;
	 }
	 */
	/**
	 * 주소 API 팝업 콜백 함수

	 function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
	 , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	 // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	 document.regForm.roadAddrPart1.value = roadAddrPart1;
	 document.regForm.addr1.value = roadAddrPart1;
	 // document.regForm.roadAddrPart2.value = roadAddrPart2;
	 document.regForm.addrDetail.value = addrDetail;
	 document.regForm.addr2.value = addrDetail;
	 // document.regForm.zipNo.value = zipNo;
	 }
	 */

	/**
	 * ver2. Daum 주소 API
	 */

	function goPopup(context) {
		event.preventDefault();
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}
						var f = document.regForm;
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						f.roadAddrPart0.value = data.zonecode; //5자리 새우편번호 사용
						f.roadAddrPart1.value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						f.addrDetail.focus();
					}
				}).open();
	}
	function imgChange(obj) {
		var name = $(obj).val();
		var i = name.lastIndexOf('.');
		var sub = name.substring(i + 1);
		if ($.inArray(sub, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
			$(obj).val(""); //폼 초기화
			window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
			return false;
		}
		file = $('#file').prop("files")[0];
		blobURL = window.URL.createObjectURL(file);
		$('#image_preview img').attr('src', blobURL)
	}

	function modify() {
		var f = document.regForm;
		f.phone.value = f.phone1.value +"-"+ f.phone2.value +"-"+ f.phone3.value;
		f.email.value = f.email1.value +"@"+ f.email2.value;
		f.addr1.value = f.roadAddrPart1.value;
		f.addr2.value = f.roadAddrPart2.value;
		f.addr3.value = f.roadAddrPart3.value;
	}
	
	function defaultSetting(){
		var $sel = $("#sel1").val(${sessionScope.userVO.age});
		$sel.attr("selected","selected");
		var $sel2 = $("#sel1").val(${sessionScope.userVO.blooad});
		$sel2.attr("selected","seleted");
		var pArr = ${sessionScope.userVO.age}
		
		
	}
	
</script>
<div class="w3-main" style="margin-left: 320px">
	<div class="w3-container w3-padding-large w3-grey">
		<h2>Information</h2>
		<div id="plan_m">
			<div class="register">
				<form name="regForm"
					action="${pageContext.request.contextPath}/modifyUser"
					method="post" enctype="multipart/form-data">
					<table class="table">
						<tr>
							<th>ID</th>
							<td>${sessionScope.userVO.id }</td>

							<td rowspan="6"><div class="well">
									<label for="file">이미지</label> <input type="file" id="file"
										name="upload" onchange="imgChange(this);" /><br />
									<div id="image_preview">
										<img src="" class="img-thumbnail" alt="" width="304"
											height="236">
									</div></td>
						</tr>
						<tr>
							<th>Password</th>
							<td><input type="password" placeholder="PASSWORD" name="pwd"></td>
						</tr>
						<tr>
							<th>Name</th>
							<td>${sessionScope.userVO.name}</td>
						</tr>
						<tr>
							<th>NickName</th>
							<td><input type="text" placeholder="NickName"
								name="nickname" value="${sessionScope.userVO.nickname }"></td>
						</tr>
						<tr>
							<th>Age</th>
							<td><select class="form-control" id="sel1" name="age">
									<option value="0">-선택-</option>
									<option value="1">10대</option>
									<option value="2">20대</option>
									<option value="3">30대</option>
									<option value="4">40대</option>
									<option value="5">50대</option>
							</select></td>
						</tr>
						<tr>
							<th>Blood</th>
							<td><select class="form-control" id="sel2" name="blood">
									<option value="0">-선택-</option>
									<option value="1">A</option>
									<option value="2">AB</option>
									<option value="3">B</option>
									<option value="4">O</option>
							</select></td>
						</tr>
						<tr>
							<th>Phone Number</th>
							<td colspan="2"><input type="hidden" name="phone" value="${sessionScope.userVO.phone }"/> <input
								type="text" style="width: 30%;" placeholder="010" name="phone1">
								- <input type="text" style="width: 30%;" placeholder="0000"
								name="phone2"> - <input type="text" style="width: 30%;"
								placeholder="0000" name="phone3"></td>
						</tr>
						<tr>
							<th>Email</th>
							<td colspan="2"><input type="hidden" name="email" value="${sessionScope.userVO.email }"/> <input
								type="text" style="width: 40%;" placeholder="ID" name="email1">
								@ <input type="text" style="width: 40%;" placeholder="ADDRESS"
								name="email2"></td>
						</tr>

						<tr>
							<th>Gender</th>
							<td colspan="2"><input type="radio" name="gender" value="1"
								selected>남 <input type="radio" name="gender" value="2"
								class="female">여</td>
						</tr>

						<tr>
							<th>Address</th>
							<td colspan="2"><button class="w3-button w3-black search"
									onclick="goPopup('${pageContext.request.contextPath}');">검색</button>
								<input type="hidden" name="addr1" value="${sessionScope.userVO.addr1 }"/> 
								<input type="hidden" name="addr2" value="${sessionScope.userVO.addr2 }"/> 
								<input type="hidden" name="addr3" value="${sessionScope.userVO.addr3 }"/> 
								<input type="text" style="width: 50%;" placeholder="우편번호"
								name="roadAddrPart3" value="${sessionScope.userVO.addr3 }"><br /> 
								<input type="text" style="width: 55%;" placeholder="주소" name="roadAddrPart1" value="${sessionScope.userVO.addr1 }" />
								<input type="text" style="width: 35%;" placeholder="상세주소" value="${sessionScope.userVO.addr2 }"
								name="roadAddrPart2"></td>
							</td>
						</tr>
						<tr>
							<th>Introdution</th>
							<td colspan="2"><textarea class="form-control" rows="5"
									id="intro_content" name="intro_content">${sessionScope.userVO.intro_content }</textarea></td>
						</tr>
						<tr>
							<th>Profile's exposure of assent</th>
							<td colspan="2"><input type="radio" name="viewyn" value="Y"
								selected>동의 <input type="radio" name="viewyn" value="N"
								class="female">반대</td>
						</tr>
						<tr>
							<th></th>
							<td align="center" colspan="2"><button
									class="w3-button w3-black" style="width: 30%;"
									onclick="modify();">수 정</button></td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
