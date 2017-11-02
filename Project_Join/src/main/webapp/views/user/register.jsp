<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>
#upload{
position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;

}
</style>
<script>
/*
$(function() {
    $('#summernote').summernote({
    	height: 300,
    	maxHeight: 350,
    	minHeight: 200,
    	focus: true,
    	lang: 'ko-KR', // default: 'en-US'
    	callbacks:{
    		// 콜백을 사용!
    		// 이미지를 업로드할 경우 이벤트 발생
    		onImageUpload: function(files, editor, welEditable){
    			sendFile(files[0], this);
    		}
    	}
    });
    
    $('#summernote').summernote('lineHeight',.5);
});

function sendFile(file, editor){
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

*/

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
 
function goPopup(context){
	  event.preventDefault();
	  new daum.Postcode({
          oncomplete: function(data) {
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
              if(data.userSelectedType === 'R'){
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
              var f = document.regForm;
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              f.roadAddrPart3.value = data.zonecode; //5자리 새우편번호 사용
              f.roadAddrPart1.value = fullAddr;

              // 커서를 상세주소 필드로 이동한다.
              f.roadAddrPart2.focus();
          }
      }).open();
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
	file = $('#upload').prop("files")[0];
    blobURL = window.URL.createObjectURL(file);
    $('#image_preview img').attr('src', blobURL)
}

function register(){
	var f = document.regForm;
	f.phone.value = f.phone1.value +"-"+ f.phone2.value +"-"+ f.phone3.value;
	f.email.value = f.email1.value +"@"+ f.email2.value;
	f.addr1.value = f.roadAddrPart1.value;
	f.addr2.value = f.roadAddrPart2.value;
	f.addr3.value = f.roadAddrPart3.value;
	if(valiCheck())
		f.submit();
}
function valiCheck(){
	var flag = true;
	//1. input text 항목 체크
	var list = $(".vaildate");
	$(list).each(function(i, k){
		if( k.value == '' ){
			k.focus();
			flag = false;
		}
	});
	
	//2. select box 체크 ( default 값이 0 이여야함 )
	var selList = $("select");
	$(selList).each(function(i,k){
		if(k.value == 0) {
			k.focus();
			flag = false;
		}
	})
	if(!flag){
		alert("필수 항목을 확인해 주세요");
	}
	return flag;
	
}
function imgCancel(){
	var attachFile = $('#upload');
	$(attachFile).replaceWith($(attachFile).clone(true));
	$('#image_preview img').attr('src', '');
}

</script>
<div class="w3-main" style="margin-left: 320px">
	<div class="w3-container w3-padding-large w3-grey">
		<h2>Register</h2>
		<div id="plan_m">
			<div class="register">
			<form name="regForm" action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th>ID</th>
						<td><input type="text" placeholder="ID" name="id" class="vaildate"></td>
						
						<td rowspan="6"><div class="well"><label for="file">이미지</label>
							<input type="file" id="upload" name="upload" onchange="imgChange(this);"/><br/>
							<div id="image_preview">
							<img src="" class="img-thumbnail" alt="" width="304" height="236"></div>
							<br/>
							<button type="button" onclick="javascript:document.getElementById('upload').click();">업로드</button>
							<button type="button" onclick="imgCancel()">초기화</button>	
						</td>
							
					</tr>
					<tr>
						<th>Password</th>
						<td><input type="password" placeholder="PASSWORD" name="pwd" class="vaildate"></td>
					</tr>
					<tr>
						<th>Name</th>
						<td><input type="text" placeholder="NAME" name="name" class="vaildate"></td>
					</tr>
					<tr>
						<th>NickName</th>
						<td><input type="text" placeholder="NickName" name="nickname" class="vaildate"></td>
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
						<td colspan="2"><input type="radio" name="gender" value="1" checked>남
							<input type="radio" name="gender" value="2" class="female">여
						</td>
					</tr>
					
					<tr>
						<th>Address</th>
						<td colspan="2"><button class="w3-button w3-black search" onclick="goPopup('${pageContext.request.contextPath}');">검색</button>
							<input type="hidden" name="addr1"/>
							<input type="hidden" name="addr2"/>
							<input type="hidden" name="addr3"/>
							<input type="text" style="width: 50%;" placeholder="우편번호" name="roadAddrPart3"><br/>
							<input type="text" style="width: 55%;" placeholder="주소" name="roadAddrPart1">
							<input type="text" style="width: 35%;" placeholder="상세주소" name="roadAddrPart2"></td>
						</td>
					</tr>
					<tr>
						<th>Introdution</th>
						<td colspan="2">
							<textarea class="form-control" rows="5" id="intro_content" name="intro_content"></textarea>
<!-- 							<div id="summernote"></div> -->
						</td>
					</tr>
					<tr>
						<th>Profile's exposure of assent</th>
						<td colspan="2"><input type="radio" name="us_viewyn" value="Y" checked>동의
							<input type="radio" name="us_viewyn" value="N" class="female">반대
						</td>
					</tr>
					<tr>
						<th></th>
						<td align="center" colspan="2"><button type="button" class="w3-button w3-black" style="width:30%;" onclick="register();">Register</button>
						</td>
					</tr>
					
				</table>
			</form>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
