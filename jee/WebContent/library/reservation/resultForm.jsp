<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
 <meta charset="UTF-8" />
 <title>예약 확인 페이지</title>
</head>
<body>
 <div>
  <h3>예약 완료</h3>
  <form action="<%= request.getContextPath()%>/del.soso">
  <%= request.getAttribute("memberId") %> 님의 예약이 완료 되었습니다. <br />
  <mark>자리번호 확인 : <%= request.getAttribute("seatNo") %></mark>
  <mark>시간 확인 : <%= request.getAttribute("wanted") %>  <%= request.getAttribute("time") %></mark>
  
  <legend>열람실 예약 자리</legend>
   <ol>
    <li>
     <input type="radio" name="seatNo" value="one" checked="checked" />1번 자리    
     <input type="radio" name="seatNo" value="two" />2번 자리<br />
     <input type="radio" name="seatNo" value="three" />3번 자리      
     <input type="radio" name="seatNo" value="four" />4번 자리 <br />
     <input type="radio" name="seatNo" value="five" />5번 자리       
     <input type="radio" name="seatNo" value="six" />6번 자리 <br />
     <input type="radio" name="seatNo" value="seven" />7번 자리        
     <input type="radio" name="seatNo" value="eight" />8번 자리 <br />
     <input type="radio" name="seatNo" value="nine" />9번 자리        
     <input type="radio" name="seatNo" value="ten" />10번 자리 <br />
    </li>
   </ol>
  <input type="submit" value="예약 취소" />
  </form>
 </div>
</body>
</html>