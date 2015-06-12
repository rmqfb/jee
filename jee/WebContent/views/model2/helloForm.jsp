<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>헬로우</title>
</head>
<body>
	<div>
		<form action="<%= request.getContextPath()%>/name/hello.nhn">
			<input type="text" id="name" name="name"/>
			<input type="submit" value="전 송" />  <!-- 버튼 -->
		</form>  <!-- form이 값을 전달할 필요가 없을때 a 로 해도 된다. -->
		<p></p>
		<form action="<%= request.getContextPath()%>/hi.do">
			<input type="text" id="name" name="name"/>
			<input type="submit" value="전 송" />  <!-- 버튼 -->
		</form>  <!-- form이 값을 전달할 필요가 없을때 a 로 해도 된다. -->
	</div>
</body>
</html>