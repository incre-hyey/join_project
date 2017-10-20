<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/views/common.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="w3-main" style="margin-left: 300px">
<%@include file="../header.jsp"%>

	<div class="w3-container w3-padding-large w3-grey">
		<h2>PLAN</h2>
		
<div id="plan_m">

			<form class="search">				
				<input type="text" name="search" placeholder="검색">
				<input type="hidden" name="useIdx" id="userIdx" value="${userVO.getIdx()}"/>
				<a href="" class="button">검색</a>
				<!-- 글쓰기버튼 -->
				
				<a href="${pageContext.request.contextPath}/plan_write"
				action="sendData(this.form)" class="button">글쓰기</a>
			</form>  		
			
			<c:forEach var="vo" items="${list }">
			<div class="plan_list">
				<div class="thumb">
					<img src="https://www.w3schools.com/w3images/avatar_g2.jpg"
						class="w3-round">
				</div>
				<div class="list_view">
					<ul>
						<li><a href="${pageContext.request.contextPath}/plan_view?idx=${vo.idx}" >
								<ul>
									
									<li><strong>제목:</strong>${vo.title }</li>
									<li><strong>일정:</strong>${vo.getDateStr(vo.reg_date) }</li>
									<li><strong>장소:</strong>${vo.location1 }</li>
									<li><strong>참여인원:</strong>${fn:length(vo.u_list)}/${vo.tnop }</li>
								</ul>
						</a></li>
					</ul>
				</div>
				<div class="list_join">
					<form action="">
						<button>참여하기</button>
						<a href="#" class="like">찜하기&nbsp;<i class="fa fa-gratipay" style="font-size:20px;color:red"></i></a>
					
					</form>
				</div>
			</div>				
	</c:forEach>
					
			<!-- 페이징 -->
			<div class="pagination">
				<a href="#">&laquo;</a> <a href="#">1</a> <a class="active" href="#">2</a>
				<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
				<a href="#">&raquo;</a>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
<script type="text/javascript">

	function sendDate(ff){
		//console.log(ff.userVO.idx);
			if(ff.userIdx == null){
				alert("로그인을 필수 사항 입니다.");
			}else{
				ff.submit();
			}
	}
</script>
