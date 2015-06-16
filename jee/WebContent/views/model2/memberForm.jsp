<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>회원가입 및 로그인 폼</title>
	<style>
		@IMPORT url("../../css/model2/kaup.css");
	</style>
	<script type="text/javascript">
	function join() {
		<%-- location.href = "<%=request.getContextPath()%>/member/joinForm.do"; --%>
		document.frmJoin.submit();
	}
		function login() {
			/* if(document.frmLogin.id.value.length == 0){
				alert("아이디를 써주세요");
				frmLogin.id.focus(); // 커서를 인풋텍스트 칸에 위치시킨다.
				// return false;
			}
			if(document.frmLogin.password.value == ""){
				alert("비밀번호는 반드시 입력해야 합니다.");
				frmLogin.password.focus(); // 커서를 인풋텍스트 칸에 위치시킨다.
				// return false;
			} */
			// return false;
			document.frmLogin.submit();
		}
	</script>
</head>
<body>
	
	<form action="<%= request.getContextPath() %>/model2/join.do" method="post" name = "frmJoin">
	<fieldset>
		<legend>회원 가입</legend>
		<table>
			<tr>
				<td>이름 : </td>
				<td>
					<input type="text"	id="name" name="name"  placeholder="이름을 입력하세요"/>  <!-- placeholder 는 연하게 나오는 글 -->
				</td>
			</tr>
			<tr>
				<td>ID : </td>
				<td>
					<input type="text"	id="id" name="id"  placeholder="ID 값을 입력하세요"/>
				</td>
			</tr>
			<tr>
				<td>Password : </td>
				<td>
					<input type="password"	id="password" name="password"/>
				</td>
			</tr>
			<tr>
				<td>나이 : </td>
				<td>
					<input type="text"	id="age" name="age"  placeholder="나이를 입력하세요"/>
				</td>
			</tr>
			<tr>
				<td>주소 : </td>
				<td>
					<input type="text"	id="address" name="address"  placeholder="주소를 입력하세요"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- <input type="submit" value="전 송" /> -->
					<img src="<%=request.getContextPath() %>/images/btnJoin.jpg" style="cursor: pointer; width: 200px;" alt="" onclick="return join()" />
				</td>
			</tr>
		</table>
		</fieldset>
	</form>
	
	<form action="<%= request.getContextPath() %>/model2/login.do" method="post" name = "frmLogin">
		<table>
			<tr>
				<td>아이디 : </td>
				<td>
					<input type="text"	id="id" name="id"  placeholder="ID 입력하세요"/>  <!-- placeholder 는 연하게 나오는 글 -->
				</td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td>
					<input type="password"	id="password" name="password"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- <input type="submit" value="전 송" /> -->
					<img src="<%=request.getContextPath() %>/images/btnLogin.png" style="cursor: pointer; width: 200px;" alt="" onclick="return login()" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>