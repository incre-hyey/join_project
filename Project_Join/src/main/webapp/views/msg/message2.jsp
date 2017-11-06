<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>쪽지 보내기</title>

<style type="test/css">
	td{color:red;font-size:12pt;}
</style>
<script type="text/javascript">
	function goURI(input) {
		if(input == "SEND"){
			document.letterForm.action = "/StrutsProject/MVC/letter_write.action";			
		}
		document.letterForm.submit();
	}

	
</script>
</head>
<body>
	<form name="letterForm" method="post">
		
		<table name="lettt" border width="300" align="right">		
			<tr>
				<th bgcolor="blue">받는사람</th>
				<td colspan=4><s:property value="id"/></td>			
			</tr>
			
			<tr>
				<th bgcolor="blue">제목</th>
				<td><input type="text" name="title" size="20"></td>			
			</tr>
			
			<tr>
				<td colspan="4">
				<textarea rows="10" cols="30" name="content"></textarea>
				</td>		
			</tr>
		</table>
		
		
		<table width="300" align="right">
			<th>
				<input type="reset" value="다시 쓰기"/>
				<input type="button" value="보내기" onclick="goURI('SEND')"/>
				<input type="button" value="취소" onclick="self.close()"/>				
			</th>
		<input type="hidden"  name="id"  value="<s:property value='id'/>">
		</table>
		</form>
		
		<input type="button" value="받은쪽지함" onclick=""/>
		<input type="button" value="보낸쪽지함" onclick=""/>
		<input type="button" value="쪽지보내기" onclick=""/>
		
</body>
</html>






