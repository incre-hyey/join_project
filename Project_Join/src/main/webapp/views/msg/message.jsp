<%@page import="join.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<title>쪽지 보내기</title>

<style type="test/css">
	td{color:red;font-size:12pt;}
</style>
<script type="text/javascript">
	function send() {
		rcvCheck();
		document.letterForm.submit();
	}
	
	function addTO(){
		var $tab = $("#rcvTab").find("tbody");
		var $TR = $("<tr></tr>");
		var $TD = "<td><input type='text' name='userid'></td>";
		$TR.append($TD);
		$tab.append($TR);
	}
	function rcvCheck(){
		var rows = document.getElementById("rcvTab").rows;
// 		alert(document.getElementById("rcvTab").rows.length);

		var rcv ="";
		for(var i=0;i<rows.length;i++){
			var td = $(rows).find('td')[i];
			var val = $(td).find('input[name=userid]').val();
			if(val)
				rcv += val+";";
// 				alert(val);
		}
		if(rcv != "")
			rcv = rcv.substr(0,rcv.length-1);

		document.letterForm.rcvList.value=rcv;

	}
	
</script>


</head>
<body>
<form name="letterForm" action="${pageContext.request.contextPath}/messageMain" method="post" enctype="multipart/form-data">
<input type="hidden" name="menu" value="ADD" />
<input type="hidden" name="rcvList" />
<input type="hidden" name="sender" value="${sessionScope.USER.idx }"/>

		<table class="table" id="send_msg">
			<tr>
				<th>TO<i class="material-icons" onclick="addTO()" style="color:#5bc0de">&#xe7fe;</i></th>
				<td>
					<table id="rcvTab" id="send_msg">
					<tbody>
					<tr><td><input type="text" name="userid"></td></tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="7" cols="60" name="content"></textarea></td>
			</tr>

			<%-- <table width="300">
				<th><input type="reset" value="다시 쓰기" />
					<button class="btn btn-warning" onclick="submit();">보내기</button> <input
					type="button" value="취소" onclick="self.close()" /></th>
				<input type="hidden"  name="id"  value="<s:property value='id'/>">
			</table> --%>
		</table>
		
		<div class="send_btn">
			<input class="btn btn-info" type="reset" value="다시 쓰기" />
			<button class="btn btn-warning" type="button" onclick="send();">보내기</button> 
			<input type="button" value="취소" onclick="self.close()" class="btn btn-default" />
		</div>
	</form>
				
</body>
</html>






