<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	// request.setCharacterEncoding("UTF-8");   method=post 일때만 작성한다.
%>

<!-- 
request.getParameter() 는 낱개 파라미터 키값과 밸류값을 리턴(ex> 로그인)
request.getParameterValues() 는 키값 없이 밸류값만 리턴 (체크박스)
request.getParameterNames() 는 키값 만 리턴(쓸모없는듯..)
request.getParameterMap() 는 파라미터 밸류가 복수인 경우(ex> 로그인, 회원가입)
 -->

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>폼값을 받은 페이지</title>
</head>
<body>
<div>
	<b>request.getParameter() 메소드 사용</b> <br />
	name 파라미터 = <%= request.getParameter("name") %> <br />
	address 파라미터 = <%= request.getParameter("address") %>
	<p></p>
	<p>request.getParameterValues() 메소드 사용</p> <br />
	<%
		String[] values = request.getParameterValues("pet");
		if(values != null){
			for(int i=0; i<values.length; i++){
				%>
				넘어온 밸류 : <%= values[i] %>
				<%
			}
		}
	%>
	
	<p>request.getParameterNames() 메소드 사용</p> <br />
	<%
		Enumeration paramEnum = request.getParameterNames();
		while(paramEnum.hasMoreElements()){
			String name = (String)paramEnum.nextElement();
			// System.out.println(name);
			%>
			<%= name %>
			<%
		}
	%>
	
	<p>request.getParameterMap() 메소드 사용</p> <br />
	<%
		Map paramMap = request.getParameterMap();
		String[] nameParam = (String[])paramMap.get("name");
		if(nameParam != null){
			%>
			이 름 = <%= nameParam[0]%>
			<%
		}
	%>
</div>	
</body>
</html>