<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<footer class="w3-container w3-padding-32 w3-dark-grey">
	<div class="w3-row-padding">
		<div>
			<!-- <h3>join</h3> -->
			<ul id="footer_list">
				<li><a href="https://www.lwt.co.kr/footer/siteMap.do">회사소개</a></li>
				<li><a href="https://www.lwt.co.kr/footer/siteMap.do">고객센터</a></li>
				<li><a href="https://www.lwt.co.kr/footer/siteMap.do">사이트맵</a></li>
				<li><a href="https://www.lwt.co.kr/footer/privacy.do">개인정보처리방침</a></li>
				<li><a href="https://www.lwt.co.kr/footer/agreement.do">이용약관</a></li>
			</ul>
		</div>

		<div class="w3-third">
			<p>서울특별시 관악구 시흥대로 552 석천빌딩 7F</p>
			<p>&copy; 2017 bbangjj & jjung & anh & jh & yuni ALL RIGHTS
				RESERVED.</p>
		</div>
		<div class="w3-third footer_right">
			<p>
				<i class="fa fa-envelope w3-hover-opacity" alt="문의하기"></i> <i
					class="fa fa-facebook-official w3-hover-opacity"></i> <i
					class="fa fa-instagram w3-hover-opacity"></i> <i
					class="fa fa-twitter w3-hover-opacity"></i>
			</p>
		</div>

	</div>
</footer>
<script type="text/javascript">
	// Script to open and close sidebar
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("myOverlay").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("myOverlay").style.display = "none";
	}
	
	// 파일 업로드
	function myFunction() {
	    var x = document.getElementById("myFile").type;
	    document.getElementById("demo").innerHTML = x;
	}
</script>
<script type="text/javascript">
	//nav submenu
	$(document).ready(
		function() {
			if ($('#nav li').hasClass("current_page_parent")) {
				$('#nav .current_page_parent ul').addClass("display-list");
			}
	
			$('#nav li ul').hide();
			$("#nav li:has(ul)").addClass("nav-parent");
			$("#nav li ul").addClass("nav-child");
			$('#nav li.nav-parent').mouseover(
				function() {
					$(this).children('.nav-child').slideDown(1000)
							.removeClass("display-list");
				}).mouseout(function() {
			});
	
		});
	
	//달력
	$( function() {
	    $( "#datepicker" ).datepicker();
	  } );
</script>
<script type="text/javascript">
	//summernote
	$(document).ready(function() {
	  $('#summernote').summernote({
	    lang: 'ko-KR', // default: 'en-US'
	    height : 300
	  });
	});
</script>
</body>
</html>