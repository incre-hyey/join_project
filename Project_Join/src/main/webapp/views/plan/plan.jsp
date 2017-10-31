<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/views/common.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="w3-main" style="margin-left: 300px">
<%@include file="../header.jsp"%>

<div class="w3-container w3-padding-large w3-grey">

		<h2>PLAN</h2>
		<div id="plan_m">

			<form name="planForm" class="search">
				<%-- <input type="hidden" name="nowPage" value="${nowPage }" />	 --%>			
				<input type="text" name="search" placeholder="검색">
				<input type="hidden" name="useIdx" id="userIdx" value="${userVO.getIdx()}"/>
				<a href="" class="button w3-button">검색</a>
				
				<!-- 글쓰기버튼 -->				
				<a href="${pageContext.request.contextPath}/plan_write"
				action="sendData(this.form)" class="button w3-button">글쓰기</a>
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
						<li><a href="${pageContext.request.contextPath}/plan_view?idx=${vo.idx}" >
								<ul>
									<li><strong>PLAN 종류 :</strong>${vo.plan_kind }</li>
									<li><strong>작성자 :</strong>${vo.writer }</li>
									<li><strong>제목 :</strong>${vo.title }</li>
									<li><strong>일정 :</strong>
									<fmt:parseDate value="${vo.start_date }" pattern="yyyy-MM-dd" var="startdate"/>									
									<fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd"/> ~
									<fmt:parseDate value="${vo.end_date }" pattern="yyyy-MM-dd hh:mm:ss" var="enddate"/>									
									<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd hh:mm"/></li>
									<li><strong>장소 :</strong>${vo.location1 }${vo.location2 }</li>
									<li><strong>참여인원 :</strong>${fn:length(vo.u_list)}/${vo.tnop }</li>
								</ul>
						</a></li>  
					</ul>
				</div>
				<div class="list_join">								
					<p class="button w3-button"><i class="fa fa-arrow-circle-up fa-spin" style="font-size:20px;color=:red"></i><c:out value="${vo.getPeople() }"/></p>							
					<a href="#" class="like">찜하기&nbsp;<i class="fa fa-gratipay" style="font-size:20px;color:red"></i></a>
					
				</div>
			</div>				
	</c:forEach>
	
		<%-- c:forEach var="vo" items="${list }" varStatus="status" > --%>
			<!-- 페이징  부분-->		
			<div class="pagination">
				<a href="#">&laquo;</a> <a href="#">1</a> <a class="active" href="#">2</a>
				<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
				<a href="#">&raquo;</a>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
<form name="hiddenForm">

</form>
<script type="text/javascript">
	function sendDate(ff){
		//console.log(ff.userVO.idx);
			if(ff.userIdx == null){
				alert("로그인은 필수 사항 입니다.");
			}else{
				ff.submit();
			}			
	}
	
/* 	function check(exp_yn,idx, tnop, ulistLen){
// 		var ff = document.app_plan;
// 		alert(ff.exp_yn.value+"일정이 가능한때 Y/N");
// 		alert(ff.list.value+"신청한사람들 수");
// 		alert(ff.tnop.value+"모지인원");
// 		alert(obj.length);
		alert(ulistLen);
		if(exp_yn != 'Y'){
			alert("지남");
			return false;
		}
		if(ulistLen > tnop){
			alert("꽉참");
			return false;
		}
// 		if(ff.exp_yn == 'Y' && ff.list.length> ff.tnop){			
// 			$('#app_plan').action="${pageContext.request.contextPath}/addPoeple";
// 			alert("신청되었습니다");
// 			//submit();			
// 			return true;
// 		}
// 		else{
// 			alert("이미 일정이 마감되었습니다");
// 			return false;
// 		}
	}	 */
	
</script>
