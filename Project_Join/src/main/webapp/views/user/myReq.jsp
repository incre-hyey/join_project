<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="/views/common.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/basic.css">
<%!public String getPlanUserStatus(String str) {
		String result = "";
		switch (str) {
			case "0" :
				result = "요청중";
				break;
			case "1" :
				result = "수락됨";
				break;
			case "2" :
				result = "거절됨";
				break;
		}

		return result;
	}%>
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
	function cancelReq(idx, obj) {

		var $TR = $(obj).closest('tr'); // tr

		var obj = new Object();
		obj.idx = idx;

		$.ajax({
			type : "POST",
			url : ctx + "/myReqCancelAjax",
			dataType : "text",
			data : obj,
			async : true,
			error : function(request, status, error) {
				alert(status + "  " + error);
			},
			success : function(data) {
				if (data == 'OK') {
					$TR.remove();
				}
			}
		});
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
		<a href="#"></a> <span
			class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
			onclick="w3_open()"><i class="fa fa-bars"></i></span>

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
<!-- 					<th class='text-center'>Status</th> -->
					<th class='text-center'>Location</th>
					<th class='text-center'>Writer</th>
					<th class='text-center'>Result</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="vo" varStatus="s">
					<c:set var="p_status" value="${vo.P_STATUS }" />
					<tr>
						<td class='text-center'>${s.index + 1 }</td>
						<td class='text-center'><a href="#" onclick="reqView(this)"><b>${vo.TITLE }</b></a></td>
						<td class='text-center'>${vo.START_DATE }~ ${vo.END_DATE }</td>
						<td class='text-center'>${vo.PLAN_KIND }</td>
<%-- 						<td class='text-center'>${vo.STATUS }</td> --%>
						<td class='text-center'>${vo.LOCATION1 }</td>
						<td class='text-center'>${vo.WRITER }</td>
						<td class='text-center'><%=getPlanUserStatus(pageContext.getAttribute("p_status").toString())%>
							<button type="button" class="btn btn-danger btn-xs"
													onclick="cancelReq('${vo.P_IDX}',this)">취소/삭제</button>
						
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