<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("memberId");    /* request 파라미터를 이동해주는 메소드 */
	if(id.equals("admin")){
		response.sendRedirect("now.jsp");   /*  response 경로를 정해주는 메소드  무조건 .jsp 를 넣는다 */
	}else{
	%>
	<!doctype html>
	<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<title>로그인 페이지</title>
	</head>
	<body>
	잘못된 아이디입니다.
	<%
	}
%>

	
</body>
</html>