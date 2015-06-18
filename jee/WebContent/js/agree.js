/**
 * @ Date : 2015.6.18
 * @ Story : 회원가입시 동의 여부체크
 */
var  agreeChk = function(){  // 객체 선언한 방식 자료형없이 var로 선언한다고? var 가 없으면 static(전역변수)으로 된다/ 있으면 인스턴스 변수/ 함수 내부에 있으면 지역변수
   var req = document.form.req.checked; // boolean 값으로 대입한다. window가 젤 위...... 그다음이 document 최상위.
   var num = 0;
   if(req == true){
    num = 1;
   }
   if(num==1){
    document.form.submit();
   }else{
    alert("개인정보 약관에 동의하셔야 합니다.");
   }
}

function nochk(url){
	   alert("동의하지 않으면 가입하실 수 없습니다");
	   location.href=url;
}