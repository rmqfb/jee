/**
 * @ Date : 2015.6.18
 * @ Author : kimyo!
 * @ Stroy : member.jsp, memberForm.jsp 관련 js 파일
 */

var searchId = function(url){
	window.open(url, "searchId", 
			"scrollbar,toolbar=no,location=no,directories=no,status=no,menubar=yes,resizable=yes,width=600,height=500,top=200,left=400")
}
var searchPass = function(url) {
	window.open(url, "searchPass", 
		"scrollbar,toolbar=no,location=no,directories=no,status=no,menubar=yes,resizable=yes,width=600,height=500,top=200,left=400")
}

var join = function() {
	// location.href = "<%=request.getContextPath()%>/member/joinForm.do"; 
	document.frmJoin.submit();
}
var login = function() {
/* if(document.frmLogin.id.value.length == 0){
		alert("아이디를 써주세요");
		frmLogin.id.focus(); // 커서를 인풋텍스트 칸에 위치시킨다.
		// return false;
	}
	if(document.frmLogin.password.value == ""){
		alert("비밀번호는 반드시 입력해야 합니다.");
		frmLogin.password.focus(); // 커서를 인풋텍스트 칸에 위치시킨다.
		// return false;
	} */
	// return false;
	document.frmLogin.submit();
}