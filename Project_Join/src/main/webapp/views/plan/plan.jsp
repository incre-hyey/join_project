<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/views/common.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="w3-main" style="margin-left: 300px">
<%@include file="../header.jsp"%>
<script type="text/javascript">

	$(function(){
		$("#pageDIV").html("${pagingHtml }");		
				
	});
	
	function pagingFunc(num){
		var f = document.planForm;	
		f.paging.value=num;
		f.submit();
	}
	function sendDate(ff){
		//console.log(ff.userVO.idx);
			if(ff.userIdx == null){
				alert("로그인은 필수 사항 입니다.");
			}else{
				ff.submit();
			}			
	}
	function search(){
		var f = document.planForm;	
		f.submit();
	}
	

	
</script>

<div class="w3-container w3-padding-large w3-grey">

		<h2>PLAN</h2>
		<div id="plan_m">

			<form name="planForm" class="search">
				<input type="hidden" name="paging" value="${paging }" />			
				<input type="text" name="search" placeholder="작성자, 제목, 내용, 위치를 검색하세요" value="${search }">				
				<button type="button" class="button w3-button" onclick="search()">검색</button></p>
				
				<!-- 글쓰기버튼 -->		
				<c:if test="${sessionScope.USER != null }">
				<a href="${pageContext.request.contextPath}/plan_write" action="sendData(this.form)" class="button w3-button">글쓰기</a>
				</c:if>
			</form>  

			<c:forEach var="vo" items="${list }" varStatus="status" >
				<!-- join.plan메뉴에 게시물이 한개 없을때 -->
				<c:if test="${empty list }">
					<tr>
					 <td bgcolor="#F2F7F9" colspan="5" height="70" align="center">등록된 게시물이 없습니다.</td>
					</tr>
       			</c:if>
       			
			<div class="plan_list">
			
				<div class="thumb">
				<c:if test="${empty vo.file_id }">
					<img src="${pageContext.request.contextPath}/resources/images/default_image.png">					
				</c:if>
				<c:if test="${null ne vo.file_id }">
				<img src="${pageContext.request.contextPath}/viewImg?fileid=${vo.file_id }&module=PLAN"  class="w3-round">
				</c:if>
				</div>
				<div class="list_view">
					<ul>
						<li><a href="${pageContext.request.contextPath}/plan_view?idx=${vo.idx}&paging=${paging }" >
								<ul>
									<li><strong>PLAN 종류 :</strong>${vo.plan_kind }</li>
									<li><strong>작성자 :</strong>${vo.writer }</li>
									<li><strong>제목 :</strong>${vo.title }</li>
									<li><strong>일정 :</strong>${vo.start_date } ~ ${vo.end_date }</li>					
									<li><strong>장소 :</strong>${vo.location1 }${vo.location2 }</li>
									<li><strong>참여인원 :</strong>${fn:length(vo.u_list)+1}/${vo.tnop }</li>
								</ul>
						</a></li>  
					</ul>
				</div>
				
				<c:if test="${sessionScope.USER != null && sessionScope.USER.idx != vo.writer_idx }">								
				<p class="button w3-button"><i class="fa fa-arrow-circle-up fa-spin" style="font-size:20px;color=:red"></i>
				<c:out value="${vo.getPeople() }"/></p>
				</c:if>			
				
			</div>				
		</c:forEach>

	<!-- 페이징  부분-->		
			<div class="pagination" >
  	 			 <div id="pageDIV" style="display:inline;">    
   				 </div>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>


