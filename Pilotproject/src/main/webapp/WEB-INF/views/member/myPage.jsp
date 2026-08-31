<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - PUPPY STYLE</title>
</head>
<body>
  <h3>마이페이지</h3>
  <a href="/">홈으로</a>
  <a href="/logout">로그아웃</a>
  <br><br>

  <sec:authentication property="name"/> 님, 환영합니다!
  <br><br>

  <table border="1" width="400">
    <tr>
      <td align="center"><a href="#">주문내역</a></td>
      <td align="center"><a href="/member/cartList">장바구니</a></td>
      <td align="center"><a href="/member/updateForm">회원정보 수정</a></td>
    </tr>
  </table>
</body>
</html>