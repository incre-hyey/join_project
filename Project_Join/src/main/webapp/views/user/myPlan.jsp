<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="../header.jsp"%>
<%@include file="/views/common.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/basic.css">
<%!public String getPlanUserStatus(String str) {
		String result = "";
		switch (str) {
			case "0" :
				result = "<i class='fa fa-arrow-right' style='font-size:24px'></i> 요청중";
				break;
			case "1" :
				result = "<i class='fa fa-arrow-right' style='font-size:24px'></i> 수락됨";
				break;
			case "2" :
				result = "<i class='fa fa-arrow-right' style='font-size:24px'></i> 거절됨";
				break;
		}

		return result;
	}
	public boolean compareDate(String dateStr){
		//오늘 날짜보다 큰가 ( 오늘이 dateStr 이전이다 : false, 오늘이 dateStr 이후이다 : true)
		Date now = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try{
			date = fmt.parse(dateStr);
			long oneday = 1000*60*60*24;
			date.setTime(date.getTime()+oneday);
		}catch(Exception e){}
		return now.getTime() > date.getTime();
	}
%>
	
	
<%
	
%>
<style>
a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	z-index: 999;
}

.hide {
	display: none;
}
</style>
<script>
	function reqView(obj) {
		var $tr = $(obj).closest('tr');
		var newTR = $tr.next("tr")
		newTR.toggleClass("hide");
	}
	function sendMsg(id) {
		var pop = window.open(webContext + "/messageMain?menu=WRITE&reply="
				+ id, "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function response(flag, idx, obj) {
		var select = (flag == '1') ? "수락" : "거절";
		
		if(confirm(select+"하시겠습니까?")){

			var $p = $(obj).parent(); // reqDIV
	
			var obj = new Object();
			obj.idx = idx;
			obj.status = flag;
	
			$.ajax({
				type : "POST",
				url : ctx + "/userReqResAjax",
				dataType : "text",
				data : obj,
				async : true,
				error : function(request, status, error) {
					alert(status + "  " + error);
				},
				success : function(data) {
					if (data != '') {
						var txt = "<i class='fa fa-arrow-right' style='font-size:24px'></i>"; 
						txt += select+"됨";
						$p.html(txt);
					}
				}
			});
		}
	}

	function userView(useridx) {
		var pop = window.open(webContext + "/userView?useridx=" + useridx,
				"pop", "width=450,height=570, scrollbars=yes, resizable=yes");
	}
	
	function myPlanMenu(menu){
		location.href= webContext+menu
	}
</script>
<form name="viewForm">
	<input type="hidden" name="idx" />
</form>

<div class="w3-main" style="margin-left: 300px">
	<h2>MY PLAN</h2>
		<a href="#"></a>
		<div class="w3-section w3-bottombar w3-padding-16">
			<button class="w3-button w3-black" onclick="myPlanMenu('/myPlan')">작성 내역</button>
			<button class="w3-button w3-black" onclick="myPlanMenu('/myReq')">신청 현황</button>
		</div>
		<%-- 			<button class="w3-button w3-white <%if(type.equals("1")){ %>w3-black<%} %>" onclick="filter('1')"> --%>
		<!-- 				PLAN 작성내역</button> -->
		<%-- 			<button class="w3-button w3-white <%if(type.equals("2")){ %>w3-black<%} %>" onclick="filter('2')"> --%>
		<!-- 				PLAN 신청현황 -->
		<!-- 			</button> -->
	<div class="w3-container w3-padding-large w3-grey">
		<table class="table">
			<thead>
				<tr>
					<th class='text-center'>No</th>
					<th class='text-center'>Title</th>
					<th class='text-center'>Schedule</th>
					<th class='text-center'>Kind</th>
					<th class='text-center'>Status</th>
					<th class='text-center'></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="vo" varStatus="s">
					<%-- 	    		<c:set var="reqUserList" value="${vo.reqUserList }"/> --%>
					<c:set var="startD" value="${vo.start_date }"/> 
					<c:set var="dateComp" value='<%=compareDate(pageContext.getAttribute("startD").toString())%>' />
					
					<tr>
						<td class='text-center'>${s.index + 1 }</td>
						<td class='text-center'><a href="#" onclick="reqView(this)"><b>${vo.title }</b></a></td>
						<td class='text-center'>${vo.start_date }~ ${vo.end_date }</td>
						<td class='text-center'>${vo.plan_kind }</td>
						<td class='text-center'>
							<c:choose>
								<c:when test="${dateComp eq true }">
									일정 마감
								</c:when>
								<c:otherwise>
								<c:if test="${vo.status == '0'}"> 삭제됨 </c:if>
								<c:if test="${vo.status == '1'}"> 모집중 </c:if>
								</c:otherwise>
							</c:choose>
						</td>
						<td class='text-center'></td>
					</tr>
					<tr class="hide">
						<td></td>
						<td colspan='5'>
							<!-- reqUserList=[{STATUS=0, NICKNAME=에이원, USERID=a11, GENDER=2, IDX=7, REQ_DATE=2017-11-01 14:18, AGE=1}] -->
							<c:choose>
								<c:when test="${vo.reqUserList.size() > 0 }">
									<c:forEach items="${vo.reqUserList}" var="reqVO" varStatus="ss">
										<p class="my_list" style="display: inline;">
											${ss.index + 1 } ) <a onclick="userView('${reqVO.USERIDX}')">${reqVO.USERID}
												(${reqVO.NICKNAME})</a>
										<div style="display: inline;" id="reqDIV">
											<c:set var="uStatus" value="${reqVO.STATUS }" />
											<%=getPlanUserStatus(pageContext.getAttribute("uStatus").toString())%>
											<c:if test="${uStatus eq '0' }">
												<button type="button" class="btn btn-primary btn-xs"
													onclick="response('1','${reqVO.IDX}',this)">수락</button>
												<button type="button" class="btn btn-danger btn-xs"
													onclick="response('2','${reqVO.IDX}',this)">거절</button>
											</c:if>
										</div>
										<button type="button" class="btn btn-warning btn-xs"
											onclick="sendMsg('${reqVO.USERID}')">쪽지</button>
										</div>
										</p>
									</c:forEach>
								</c:when>
								<c:otherwise>
			        		신청자가 없습니다.
			        	</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
	
				<!-- 			<tr> -->
				<!-- 	            <td class='text-center'>No</td> -->
				<!-- 	            <td class='text-center'><a onclick="test(this)" />Title</a></td> -->
				<!-- 	            <td class='text-center'>Schedule</td> -->
				<!-- 	            <td class='text-center'>Kind</td> -->
				<!-- 	            <td class='text-center'>Status</td> -->
				<!-- 	            <td class='text-center'></td> -->
				<!-- 	        </tr> -->
				<!-- 	        <tr class="hide"> -->
				<!-- 	            <td class='text-center'>111</td> -->
				<!-- 	            <td class='text-center'>222</td> -->
				<!-- 	            <td class='text-center'>333</td> -->
				<!-- 	            <td class='text-center'>444</td> -->
				<!-- 	            <td class='text-center'>555</td> -->
				<!-- 	            <td class='text-center'></td> -->
				<!-- 	        </tr> -->
	
			</tbody>
		</table>

	</div>

	<%@include file="../footer.jsp"%>
</div>