<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String name = request.getParameter("name");
 	String value = request.getParameter("value");
 	
 	if(name != null && value != null){
 		request.setAttribute(name, value);  
 		// application > session > request 모두 동일한 결과를 나오게 한다.
 		// application 은 클래스 변수이기 때문에 프로그램이 종료될때까지 클래스 변수를 갖고 있게 된다. 저장공간의 이용을 줄이기 위해 잘 사용하지 않고 request를 사용한다.
 	}
 %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>JSP 기본객체의 속성(Attribute)사용하기</title>
</head>
<body>
	<%
	if(name != null && value != null){
 		%>
 		<%= name %> = <%= value%>
 		<% 
	}else{
		%>
		request 객체의 속성 설정안함
		<%
	}
	%>
</body>
</html>