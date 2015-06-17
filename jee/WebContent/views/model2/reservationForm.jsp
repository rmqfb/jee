<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>예약 폼</title>
</head>
<body>
	<div>
		<form action="">
			<fieldset>
				<legend>예매일</legend>
				<ol>
					<li>
						영화 예매 취소는 영화 시작 2시간 전까지 가능합니다.
					</li>
					<li>
						<label for="wanted">원하는 예약일</label>
						<input id="wanted" name="wanted" type="date" />
						<!-- date month week time datetime -->
						<input type="time" name="time" id="time" />
					</li>
				</ol>
		</fieldset>
		<input type="submit" value="전 송" />
		</form>
	</div>
	<hr style="width: 400px; height: 20px; border-color: black;" />
	<div style="text-align: center;">
	${msg}
	<br />
		<%
		if(request.getAttribute("seat")==null){
			String[][] defaultSeat = new String[3][5]; // 투숙객 이름
			for (int i = 0; i < defaultSeat.length; i++) {
	            for (int j = 0; j < defaultSeat[i].length; j++) {
	                if (defaultSeat[i][j] == null) {
	                	%>
	                	<%="□" %> <%= i+1%> - <%= j+1%> 호  
	                            <%
	                    /* System.out.print("" + (i + 1) + "0" + (j + 1) + "호"
	                            + " □\t" + "\t"); */
	                } else {
	                	%>
	                		■ <%= i+1%> - <%= j+1%> 호  
	                		<%-- ${i + 1} 0 ${j + 1} 호 ■ <br /> --%>
	                	<%
	                    /* System.out.print("" + (i + 1) + "0" + (j + 1) + "호"
	                            + " ■\t" + name[i][j] + "\t"); */
	                }
	            }
	            %>
	            <br />
	            <%
	        }
		}else{
			String[][] seat = (String[][])request.getAttribute("seat");
			for (int i = 0; i < seat.length; i++) {
	            for (int j = 0; j < seat[i].length; j++) {
	                if (seat[i][j] == null) {
	                	%>
	                	<%="□" %> <%= i+1%> - <%= j+1%> 호  
	                            <%
	                    /* System.out.print("" + (i + 1) + "0" + (j + 1) + "호"
	                            + " □\t" + "\t"); */
	                } else {
	                	%>
	                		■ <%= i+1%> - <%= j+1%> 호  
	                		<%-- ${i + 1} 0 ${j + 1} 호 ■ <br /> --%>
	                	<%
	                    /* System.out.print("" + (i + 1) + "0" + (j + 1) + "호"
	                            + " ■\t" + name[i][j] + "\t"); */
	                }
	            }
	            %>
	            <br />
	            <%
	        }
		}
		
		%>
	</div>
	<div>
	<form action="<%=request.getContextPath() %>/reservation/checkIn.do">  <!-- 웹프로그램과 연동하기 위한 태그 -->
	<fieldset>
			<legend>주문 내용</legend>
			<ol>
				<li>
					<label for="prod">아이디</label>
					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요"/>
				</li>
				<li>
					<label for="num">열번호</label>
					<input id="floor" name="floor" type="number" min="1" max="3" value="1" />
				</li>
				<li>
					<label for="num">행번호</label>
					<input id="row" name="row" type="number" min="1" max="5" value="1" />
				</li>
			</ol>
		</fieldset>
		
		
		<input type="submit" value="등록" />
	</form>
	</div>
		<div>
	<form action="<%=request.getContextPath() %>/reservation/checkOut.do">  <!-- 웹프로그램과 연동하기 위한 태그 -->
	<fieldset>
			<legend>예매 취소</legend>
			<ol>
				<li>
					<label for="prod">아이디</label>
					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요"/>
				</li>
				<li>
					<label for="num">열번호</label>
					<input id="floor" name="floor" type="number" min="1" max="3" value="1" />
				</li>
				<li>
					<label for="num">행번호</label>
					<input id="row" name="row" type="number" min="1" max="5" value="1" />
				</li>
			</ol>
		</fieldset>
		
		
		<input type="submit" value="등록" />
	</form>
	</div>
</body>
</html>