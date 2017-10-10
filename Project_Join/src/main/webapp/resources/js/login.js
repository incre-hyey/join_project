/**
 * Form submit Function
 * @returns
 */
function formSubmit(f){
	
}

function chatBtnClick(){
	window.location.href="http://localhost:8088/joinapp/views/chat/chatList.jsp";
}

function joinFunc(f){
	event.preventDefault();
//	var form = jQuery(f)[0];
//	form.action = "/views/login/register.jsp";
//	form.submit();
	window.location.href="";
}
function regBtnFunc(f){
	alert(2);
	$(f).attr("action", "/register");
	$(f).submit();
}

