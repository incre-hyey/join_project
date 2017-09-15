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
			<p>&copy; 2017 bbangjj & ningen & yuni & anh & jh ALL RIGHTS
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
</script>
<script type="text/javascript">
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
		acc[i].onclick = function() {
			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight) {
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#nav > li > a").on("click", function(e) {
			if ($(this).parent().has("ul")) {
				e.preventDefault();
			}

			if (!$(this).hasClass("open")) {
				// hide any open menus and remove all other classes
				$("#nav li ul").slideUp(350);
				$("#nav li a").removeClass("open");

				// open our new menu and add the open class
				$(this).next("ul").slideDown(350);
				$(this).addClass("open");
			}

			else if ($(this).hasClass("open")) {
				$(this).removeClass("open");
				$(this).next("ul").slideUp(350);
			}
		});
	});
</script>
<script type="text/javascript">
	function openCity(cityName, elmnt, color) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].style.backgroundColor = "";
		}
		document.getElementById(cityName).style.display = "block";
		elmnt.style.backgroundColor = color;

	}
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
</script>

</script>

</body>
</html>