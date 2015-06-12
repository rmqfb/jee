<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>헤더 샘플</title>
	<style>
		@IMPORT url("<%= request.getContextPath()%>/css/header.css");
	</style>
</head>
<body>
	<div id="wrap">
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
				<img src="../../images/3D_gif_07.gif" width="250px" height="60px" alt="" />
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
	</div>  <!-- wrap end -->
	
	<footer>
		<hr />
		<div>
			<pre>회사소개 : 살았으며, 보이는 타오르고 못하다 인생에 물방아 곧 이것이다. 
			위하여 풍부하게 불러 구하지 고행을 인간은 못할 눈이 아니다. 
			못할 간에 열락의 그들의 되는 아름다우냐? 소리다.이것은 인생의 있는 오직 피다. </pre>
		</div>
	</footer>
</body>
</html>