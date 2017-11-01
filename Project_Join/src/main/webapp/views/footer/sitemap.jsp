<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/views/common.jsp"%>
	<div class="w3-main" style="margin-left: 300px">
		<%@include file="../header.jsp"%>
		<div class="w3-card_con w3-padding-large w3-grey">

			<h2>SITE MAP</h2>
			<div id="sitemap">
				<ul>
					<li class="map_area">
						<h4>JOIN.PLAN</h4>
						<ul><li><a href="${pageContext.request.contextPath}/plan" onclick="w3_close()"
				class="w3-bar-item w3-padding "> JOIN.PLAN</a></li></ul>
					</li>
					<li class="map_area">
						<h4>JOIN.PROFILE</h4>
						<ul><li><a href="${pageContext.request.contextPath}/profile" onclick="w3_close()"
				class="w3-bar-item w3-padding w3-text-teal"> JOIN.PROFILE</a></li></ul>
					</li>
					<li class="map_area">
						<h4>JOIN.TALK</h4>
						<ul><li><a href="#" class="w3-bar-item w3-padding">MY PLAN</a></li>
						<li><a href="#" class="w3-bar-item w3-padding">MY TALK</a></li></ul>
					</li>
					<li class="map_area">
						<h4>JOIN.LOG</h4>
						<ul>
							<li><a href="#" class="w3-bar-item w3-padding">MY PLAN</a></li>
							<li><a href="#"class="w3-bar-item w3-padding">MY MESSAGE</a></li>
						</ul>
					</li>
					
					<li class="map_area">
						<h4>JOIN.INFO</h4>
						<ul>
							<li><a href="#" class="w3-bar-item w3-padding">PRIVACY</a></li>
							<li><a href="#" class="w3-bar-item w3-padding">AGREEMENT</a></li>
						</ul>
					</li>

				</ul>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
