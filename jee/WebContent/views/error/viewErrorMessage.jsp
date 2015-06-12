<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>에러페이지</title>
</head>
<body>
	에러타입 : <%= exception.getClass().getName() %>
	에러메세지 : <%= exception.getMessage() %> <br />
	<img src="<%= request.getContextPath() %>/images/12137253264c515cfa242e7.png" width="100%" alt="" border="0"/>
</body>
</html>