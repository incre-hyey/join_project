<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/views/common.jsp"%>
<script>
/**
 * 주소 API 팝업
 * @param context
 * @returns
 */
function goPopup(context){
	event.preventDefault();
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open(context+"/views/api/jusoPop.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
	
	return pop;
}

/**
 * 주소 API 팝업 콜백 함수
 */
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

function imgChange(obj){
	var name = $(obj).val();
	var i = name.lastIndexOf('.');
	var sub = name.substring(i+1);
	if($.inArray(sub, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
        $(obj).val(""); //폼 초기화
        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        return false;
    }
	file = $('#file').prop("files")[0];
    blobURL = window.URL.createObjectURL(file);
    $('#image_preview img').attr('src', blobURL)
}

function register(){
	var f = document.regForm;
	f.phone.value = f.phone1.value + f.phone2.value + f.phone3.value;
	f.email.value = f.email1.value + f.email2.value;
}
</script>
<div class="w3-main" style="margin-left: 320px">
	<div class="w3-container w3-padding-large w3-grey">
		<h2>Register</h2>
		<div id="plan_m">
			<div class="">
			<form name="regForm" action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th>ID</th>
						<td><input type="text" placeholder="ID" name="id"></td>
						
						<td rowspan="6"><div class="well"><label for="file">이미지</label>
							<input type="file" id="file" name="upload" onchange="imgChange(this);"/><br/>
							<div id="image_preview">
							<img src="" class="img-thumbnail" alt="" width="304" height="236"></div></td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input type="password" placeholder="PASSWORD" name="pwd"></td>
					</tr>
					<tr>
						<th>Name</th>
						<td><input type="text" placeholder="NAME" name="name"></td>
					</tr>
					<tr>
						<th>NickName</th>
						<td><input type="text" placeholder="NickName" name="nickname"></td>
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
							</select>
						</td>
					</tr>
					<tr>
						<th>Blood</th>
						<td><select class="form-control" id="sel2" name="blood">
							<option value="0">-선택-</option>
							<option value="1">A</option>
							<option value="2">AB</option>
							<option value="3">B</option>
							<option value="4">O</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>Phone Number</th>
						<td colspan="2">
							<input type="hidden" name="phone" />
							<input type="text" style="width: 30%;" placeholder="010" name="phone1">
							- <input type="text" style="width: 30%;" placeholder="0000" name="phone2"> -
							 <input type="text" style="width: 30%;" placeholder="0000" name="phone3">
						</td>
					</tr>
					<tr>
						<th>Email</th>
						<td colspan="2">
							<input type="hidden" name="email" />
							<input type="text" style="width: 40%;" placeholder="ID" name="email1"> @ 
							<input type="text" style="width: 40%;" placeholder="ADDRESS" name="email2"></td>
					</tr>
					
					<tr>
						<th>Gender</th>
						<td colspan="2"><input type="radio" name="gender" value="1" selected >남 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="gender" value="2">여
						</td>
					</tr>
					
					<tr>
						<th>Address</th>
						<td colspan="2"><button class="w3-button w3-black" onclick="goPopup('${pageContext.request.contextPath}');">검색</button>
							<input type="hidden" name="addr1"/>
							<input type="hidden" name="addr2"/>
							<input type="text" style="width: 55%;" placeholder="도로명주소" name="roadAddrPart1"> 
							<input type="text" style="width: 40%;" placeholder="상세주소" name="addrDetail"></td>
						</td>
					</tr>
					<tr>
						<th>Introdution</th>
						<td colspan="2">
							<textarea class="form-control" rows="5" id="intro_content" name="intro_content"></textarea>
						</td>
					</tr>
					<tr>
						<th></th>
						<td align="center" colspan="2"><button class="w3-button w3-black" style="width:30%;" onclick="register();">Register</button>
						</td>
					</tr>
				</table>
			</form>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
