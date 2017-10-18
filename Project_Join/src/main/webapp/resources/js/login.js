/**
 * Form submit Function
 * @returns
 */
function formSubmit(f){
	
};

var loginFunc = function(){
	event.preventDefault();
	var obj = new Object();
	obj.id = $("#id").val();
	obj.pwd = $("#pwd").val();
	var flag = false;
	$.ajax({
        type : "POST",
        url : ctx+"/loginAjax",
        dataType : "text",
        data : obj,
        async: false,
        error : function(request,status,error){
        	alert(status + "로그인 실패 : " + error);
        },
        success : function(data){
//        	alert(typeof data);
        	if(data != ""){
        		alert(data);
        	}
        	flag = true;
        }
    });
	//ajax success시 이동
	if(flag)
		window.location.href=webContext+"/index";
}

function chatBtnClick(){
	window.location.href = webContext + "/chatList";
}
function chatHisBtnClick(){
	window.location.href = webContext + "/chatHistory";
}

function joinFunc(){
	event.preventDefault();
	
	window.location.href = webContext + "/views/user/register.jsp";
}