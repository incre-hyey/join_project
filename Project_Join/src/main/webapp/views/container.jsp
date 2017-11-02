<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%!
public String getImgPath(String ctx , String fileid){
	
	String path = ctx +"/resources/images/default_user_img.png";
	if(!fileid.equals(""))
		path = ctx + "/viewImg?module=USERfileid="+fileid;
	return path;	
}
%>
<section id="sliderFrame">
	<div id="slider">
		<img src="${pageContext.request.contextPath}/resources/images/date1.jpg" />
		<img src="${pageContext.request.contextPath}/resources/images/date2.jpg" />
		<img src="${pageContext.request.contextPath}/resources/images/coffee2.jpg" />
		<img src="${pageContext.request.contextPath}/resources/images/wine.jpg" />
	</div>
</section>

<section id="container">
	<div class="inner">
		<div class="main_left">
			<h3>Recent Plan <a href="${pageContext.request.contextPath}/plan" class="more_btn">more</a></h3>
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
			<h3>Recent Profile <a href="${pageContext.request.contextPath}/profile" class="more_btn">more</a></h3></h3>
			<div class="">
				<c:set var="mainUserList" value="${mainUserList }"/>
				<c:set var="mainUserListSize" value="${mainUserList.size() }"/>
				<c:if test="${mainUserListSize > 0 }">
					<c:set var="mainUserVo" value="${mainUserList.get(0) }"/>
					<c:set var="mUserImg" value="${mainUserVo.file_id }" />
					<div class="product-item w3-card-4 w3-margin w3-white">
						<a class="thumb mfp-image" data-lightbox="image"> <img
							src="<%=getImgPath(request.getContextPath(),pageContext.getAttribute("mUserImg").toString()) %>"
							alt="imag_1"> <span class="thumb__overlay"></span></a>
						<h5>
							${mainUserVo.id } ( ${mainUserVo.nickname } ) <br/>
							${mainUserVo.getAgeStr() } / ${mainUserVo.getGenderStr() }
							
						</h5>
					</div>
				</c:if>
				<c:if test="${mainUserListSize > 1 }">
					<c:set var="mainUserVo" value="${mainUserList.get(1) }"/>
					<div class="product-item w3-card-4 w3-white">
						<a class="thumb mfp-image" data-lightbox="image"> <img
							src="${pageContext.request.contextPath}/viewImg?fileid=${mainUserVo.file_id }&module=USER"
							alt="imag_1"> <span class="thumb__overlay"></span></a>
						<h5>
							${mainUserVo.id } ( ${mainUserVo.nickname } ) <br/>
							${mainUserVo.getAgeStr() } / ${mainUserVo.getGenderStr() }
							
						</h5>
					</div>
				</c:if>
				<c:if test="${mainUserListSize > 2 }">
					<c:set var="mainUserVo" value="${mainUserList.get(2) }"/>
					<div class="product-item w3-card-4 w3-margin w3-white">
						<a class="thumb mfp-image" data-lightbox="image"> <img
							src="${pageContext.request.contextPath}/viewImg?fileid=${mainUserVo.file_id }&module=USER"
							alt="imag_1"> <span class="thumb__overlay"></span></a>
						<h5>
							${mainUserVo.id } ( ${mainUserVo.nickname } ) <br/>
							${mainUserVo.getAgeStr() } / ${mainUserVo.getGenderStr() }
							
						</h5>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</section>
