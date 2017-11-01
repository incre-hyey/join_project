<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
<%
	String paging = (String)request.getAttribute("paging");
	String type = (String)request.getAttribute("type"); // filter값 : 1-All, 2-Woman, 3-Man , 4-Like
	String scroll = (String)request.getAttribute("scroll");
	//int endPage = Integer.parseInt(paging) * 9;
%>
<%@include file="/views/common.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
<style>
a#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    z-index: 999;
}

</style>
<script>


//더보기 기능
//스크롤이 젤 하단에 왔을 경우 더 있는 데이터를 보여줌
// $(window).scroll(function() {
//     if ($(window).scrollTop() == $(document).height() - $(window).height()) {
//       var f = document.profileForm;
//       var page = f.paging.value; // 맨처음 : 1
//       var row = $("#profileDIV > div");
//       for(var i=0; i<3; i++){
//     	  var obj = $(row[(i*Number(page))+1]).children();
//     	  obj.css("display","");
//       }
//       f.paging.value = Number(page) + 1;
//     }
// });
	function moreView(obj){
		$(obj).remove();
		var f = document.profileForm;
	      var page = Number(f.paging.value); // 맨처음 : 1
	      var row = $("#profileDIV > div");
	      var obj = null;
	      for(var i = 1;i<4;i++){
	    	obj = $(row[(3*page)+i]);
	      	//obj = $(row[(3*page)+i]).children();
	      	obj.children().css("display","");
	      }
	      obj.append("<div class='profile_more'><button class='btn btn-primary btn-md' type='button' onclick='moreView(this)'>more</button></div>");
	      f.paging.value = page+ 1;
		
	}
	function likeAjax(idx, ic){
		
		var obj = new Object();
        obj.userid = idx;

        $.ajax({
            type : "POST",
            url : ctx+"/usLike",
            dataType: "text",
            data : obj,
            async: true,
            error : function(request,status,error){
                alert(status + "  " + error);
            },
            success : function(data){
               if(data == '1') {
            	   //document.location.href=ctx+"/profile";
            	   if(ic.style.color=='red')
            	   		ic.style.color="lightgray";
            	   else
            		   ic.style.color="red";
               }
            }
        });
	}
	function filter(num){
		var f = document.profileForm;
		//f.target = "hiddenFrm";
		f.type.value = num;
		f.paging.value="1";
		f.action = ctx + "/profile";
		f.submit();
	}
</script>
<iframe id="hiddenFrm" name="hiddenFrm" style="border:0px; height:1px; width:1px;"></iframe>
<form name="profileForm" id="profileForm" >
<input type="hidden" name="type" value="<%=type %>"/>
<input type="hidden" name="paging" value="<%= paging%>"/>
<div class="w3-main" style="margin-left: 300px">
	<header id="portfolio">
	<a href="#"></a>
	<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
		onclick="w3_open()"><i class="fa fa-bars"></i></span>
	<div class="w3-container">
	<h2>PROFILE</h2>
		<div class="w3-section w3-bottombar w3-padding-16">
			<span class="w3-margin-right"><b>Filter</b></span>
			<button class="w3-button w3-white <%if(type.equals("1")){ %>w3-black<%} %>" onclick="filter('1')">All</button>
			<button class="w3-button w3-white <%if(type.equals("2")){ %>w3-black<%} %>" onclick="filter('2')">
				Woman
			</button>
			<button class="w3-button w3-white <%if(type.equals("3")){ %>w3-black<%} %>" onclick="filter('3')">
				Man
			</button>
			<c:if test="${sessionScope.LOGINYN eq 'Y' }">
			<button class="w3-button w3-white <%if(type.equals("4")){ %>w3-black<%} %>" onclick="filter('4')">
				Like
			</button>
			</c:if>
		</div>
	</div>
	</header>
		<div class="w3-card_con w3-grey" id="profileDIV">
			
			<c:set var="endPage" value="<%=Integer.parseInt(paging) * 9 %>" />
			<c:set var="divView" value="" />
			<c:forEach items="${list }" var="userVO" varStatus="s" end="${list.size() }">
				<c:if test="${s.index%3 eq 0 }">
					<div class="row">
				</c:if>
						<div class="column" style="${divView}" name="colDIV">
							<div class="card">
								<img src="${pageContext.request.contextPath}/viewImg?fileid=${userVO.file_id }&module=USER" style="width: 100%">
								<div class="card_con">
									<h3><c:out value="${userVO.nickname }"/></h3>
									<p class="title"><c:out value="${userVO.getAgeStr() }"/> / 
													<c:out value="${userVO.getBloodStr() }"/> /
													 <c:out value="${userVO.getGenderStr() }"/>
									</p>
									<p><c:out value="${userVO.intro_content }"/></p>
									<p class="user_email"><c:out value="${userVO.email }"/></p>
									<p class="btn_like">
<!-- 										<button class="button">Contact</button> -->
									<c:if test="${sessionScope.LOGINYN eq 'Y' }">	
										<c:choose>
										<c:when test="${userVO.likeyn eq '1' }">
											<i class="fa fa-gratipay" style="font-size:50px;color:red" onclick="likeAjax('${userVO.idx}', this)"></i>
										</c:when>
										<c:otherwise>
											<i class="fa fa-gratipay" style="font-size:50px;color:lightgray" onclick="likeAjax('${userVO.idx}', this)"></i>
										</c:otherwise>
										</c:choose>
									</c:if>
									</p>
								</div><!-- card_con -->
							</div>
						</div>
						
				<c:if test="${s.index%3 eq 2 }">
					</div>
				</c:if>
				<c:if test="${s.index eq (endPage-1) && endPage < list.size() }">
				<c:set var="divView" value="display:none" />
				<div class="profile_more"><button class="btn btn-primary btn-md" type="button" onclick="moreView(this)">more</button></div>
				</c:if>
				<a id="MOVE_TOP_BTN" href="#"><button type="button" class="btn btn-info btn-sm btn-top">
					<span class="glyphicon glyphicon-hand-up"></span> top
				</button></a>
				
			</c:forEach>
			
		</div>
		
</form>

		<%@include file="../footer.jsp"%>
	</div>
