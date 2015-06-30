<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <!-- c(임의의 이름이라고 생각하면 되지만 정해진 태크명이다.)는 앞의 uri(ID : 아이덴티파이드)을 갖고 있다 
     JSTL(자바스텐다드 라이브러리) 을 쓸 수 있도록 설정한것...
    "http://java.sun.com/jsp/jstl/core"는 가상의 경로(내부적으로 이어지도록 코딩되어있다)
     	prefix="c" 로 되있는 기능을 불러오는것 -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <c:set var="context" value="<%= request.getContextPath() %>"></c:set>
    	<!-- java의 c.set 같은 느낌적 느낌? 태그 라이브러리 라 함. var는 key값. Map과 같은 형태-->
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>회원목록</title>
</head>
<body>
	<table style="width: 100%; border: 1px solid black;">
		<tr style="align:center; border: 1px solid black;">
			<th style="width: 20%">ID</th>
			<th style="width: 30%">이름</th>
			<th style="width: 10%">나이</th>
			<th style="width: 40%">이메일</th>
		</tr>
		<c:forEach var="member" items="${memberList}" varStatus="status">  <!-- var의 member는 memberList의 안의 memberBean의 변수를 의미한다tus는 고정으로 함.. -->
		<tr style="align:center; border: 1px solid black;">
			<td>${member.id}</td>
			<td>${member.name}</td>
			<td>${member.age}</td>
			<td>${member.email}</td>
		</tr>
		</c:forEach>  <!-- for문 -->
	</table>
</body>
</html>