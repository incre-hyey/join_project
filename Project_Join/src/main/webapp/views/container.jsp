<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<section id="sliderFrame">
	<div id="slider">
		<img src="http://www.menucool.com/slider/prod/image-slider-1.jpg" />
		<img src="http://www.menucool.com/slider/prod/image-slider-2.jpg" />
		<img src="http://www.menucool.com/slider/prod/image-slider-3.jpg" />
		<img src="http://www.menucool.com/slider/prod/image-slider-4.jpg" />
		<img src="http://www.menucool.com/slider/prod/image-slider-5.jpg" />
	</div>
</section>

<section id="container">
	<div class="inner">
		<div class="main_left">
			<h3>Recent Plan <a href="#" class="more_btn">more</a></h3>
			<c:forEach items="${mainPlanList}" var="mpvo" varStatus="s">
				
				<div class="grid_2">
					<div class="date_section">
						<div class="month">${mpvo.MON }</div>
						<div class="day">${mpvo.DAY }</div>
					</div>
					<h4>${mpvo.TITLE }</h4>
					<h6>${mpvo.WRITER }</h6>
					<h6>${mpvo.LOCATION1}</h6>
						
				</div>
			</c:forEach>
		</div>

		<div class="main_right">
			<h3>Recent Profile</h3>
			<div class="">
				<div class="product-item">
					<a class="thumb mfp-image" href="#" data-lightbox="image"> <img
						src="https://livedemo00.template-help.com/wt_58586/images/page01_img_08.jpg"
						alt="imag_1"> <span class="thumb__overlay"></span></a>
					<h5>
						<a href="#">Furniture Hire &amp; Venue Decorating </a>
					</h5>
				</div>
				<div class="product-item">
					<a class="thumb mfp-image" href="#" data-lightbox="image"> <img
						src="https://livedemo00.template-help.com/wt_58586/images/page01_img_08.jpg"
						alt="imag_1"> <span class="thumb__overlay"></span></a>
					<h5>
						<a href="#">Furniture Hire &amp; Venue Decorating </a>
					</h5>
				</div>
			</div>
		</div>
	</div>
</section>
