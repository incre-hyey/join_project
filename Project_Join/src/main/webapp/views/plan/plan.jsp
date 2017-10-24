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
			<!--('글쓰기'버튼을 눌렀을때 함께 보낼 값) idx=${idx}&nickname=${nickname} -->
		
			
			<c:forEach var="vo" items="${list }">
				<!-- join.plan메뉴에 게시물이 한개 없을때 -->
				<c:if test="${empty list }">
					<tr>
				 		 <td bgcolor="#F2F7F9" colspan="5" height="70" align="center">등록된 게시물이 없습니다.</td>
					</tr>
       			</c:if>
       			
			<div class="plan_list">
			
				<div class="thumb">
					<c:if test="${vo.file_id == null }">
					<img src="${pageContext.request.contextPath}/resources/images/default_image.png">					
				</c:if>
				<c:if test="${vo.file_id != null }">
				<img src="${pageContext.request.contextPath}/viewImg?fileid=${vo.file_id }&module=PLAN"  class="w3-round">
				</c:if>
				</div>
				<div class="list_view">
					<ul>
						<li><a href="${pageContext.request.contextPath}/plan_view?idx=${vo.idx}" >
								<ul>
									<li><strong>작성자:</strong>${vo.writer }</li>
									<li><strong>제목:</strong>${vo.title }</li>
									<li><strong>일정:</strong></li>
									<li><strong>장소:</strong>${vo.location1 }${vo.location2 }</li>
									<li><strong>참여인원:</strong>${fn:length(vo.u_list)}/${vo.tnop }</li>
								</ul>
						</a></li>
					</ul>
				</div>
				<div class="list_join">
					<form action="">
						<button id="" name="" action="">참가신청</button>
						<a href="#" class="like">찜하기&nbsp;<i class="fa fa-gratipay" style="font-size:20px;color:red"></i></a>
					
					</form>
				</div>
			</div>				
	</c:forEach>
					
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
