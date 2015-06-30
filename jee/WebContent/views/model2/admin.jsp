<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>관리자 페이지</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/member/searchAllMembers.do" name = "frmAdmin">
	<fieldset>
		<legend>회원관리</legend>
		<table>
			<tr>
				<td>전체회원 목록보기</td>
				<td>
					<!-- <input type="text"	id="id" name="id"  placeholder="ID 값을 입력하세요"/> -->
				</td>
			</tr>
			<tr>
				<td>ID 로 회원검색</td>
				<td>
					<!-- <input type="text"	id="password" name="password"/> -->
				</td>
			</tr>
			<tr>
				<td>이름으로 회원겁색(동명이인 허용)</td>
				<td>
					<!-- <input type="text"	id="age" name="age"  placeholder="나이를 입력하세요"/> -->
				</td>
			</tr>
			<tr>
				<td>회원삭제</td>
				<td>
					<!-- <input type="text"	id="address" name="address"  placeholder="주소를 입력하세요"/> -->
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="전 송" />
					
				</td>
			</tr>
		</table>
		</fieldset>
	</form>
</body>
</html>