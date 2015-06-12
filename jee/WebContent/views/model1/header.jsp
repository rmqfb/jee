<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<style>
		@IMPORT url("<%= request.getContextPath()%>/css/header.css");
	</style>

	<!-- wrap, wrapper 의미로 주어지는 클래스나 아이디는 body 바로 밑 최상위 div에게
	보통 주어진다. 문법적 의미는 없다. -->
		<header id="top">
		<div id="login">
			<a href="#">login</a>  |
			<a href="#">join</a>
		</div>
		<div class="clear"></div>
		<div id="logo">
			<a href="#">
				<img src="<%= request.getContextPath()%>/images/3D_gif_07.gif" width="250px" height="60px" alt="" />
			</a>
		</div>
		<nav id="topMenu">
			<ul>
				<li><a href="#">HOME</a></li>
				<li><a href="#">COMPANY</a></li>
				<li><a href="#">SOLUTION</a></li>
				<li><a href="#">CUSTOMER CONTER</a></li>
				<li><a href="#">CONTACT US</a></li>
			</ul>
		</nav>
	</header>
	<div class="clear"></div>
