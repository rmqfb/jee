<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 디렉티브 -->
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
	<!-- 선언부 -->
<%!
	public int multiPly(int a, int b){
	int c = a*b;
	return c;
	}
%>
	<!-- 스크립트릿 -->
<%
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd E요일 HH:mm:ss a");
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>chap02\now.jsp</title>
</head>
<body>
	현재 시각 :
	<%= sdf.format(now) %>
	<!-- 표현식  < % -->
	10 * 25 = <%= multiPly(10, 25) %>
	<!--
	JSP 에서 제공하는 것들.
	1. 디렉티브 : 설정 정보를 지정, < % 뒤에 있는 @ 표시는 디렉티브라 한다.
	2. 스크립트
		(1) 스크립트릿 : 자바 코드를 실행한다.
		(2) 표현식 : 값을 출력한다.   < %= 
		(3) 선언부 : 자바 메소드를 만든다. < %!
	3. EL
	4. 기본객체
	5. JSTL
	 -->
</body>
</html>