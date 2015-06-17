<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
 <meta charset="UTF-8" />
 <title>예약 페이지</title>
</head>
<body>
 <form action="<%= request.getContextPath()%>/result.do" method="get">
 
  <fieldset>
  <table style="border: 1px solid black; border-collapse: collapse;">
   <tr style="border: 1px solid black;">
    <td style="border: 1px solid black;"> ID : </td>
    <td style="border: 1px solid black;">
     <input type="text" name = "memberId" id="memberId" placeholder="아이디" />
    </td>
   </tr >
   <tr style="border: 1px solid black;">
    <td style="border: 1px solid black;"> 비밀번호 : </td>
    <td style="border: 1px solid black;">
     <input type="password" name = "pass" id="pass" />
    </td>
   </tr> 
   </table>
    <fieldset>
   <legend>예약일</legend>
   <ol>
    <li>
     최대 예약일은 7일간 입니다.
    </li>
    <li>
     <label for="wanted">원하는 예약일</label>
     <input id="wanted" name="wanted" type="date" />
     <!-- date month week time datetime -->
     <input type="time" name="time" id="time" />
    </li>
   </ol>
  </fieldset>
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
   <input type="submit" value="등록" />
 </form>
</body>
</html> 