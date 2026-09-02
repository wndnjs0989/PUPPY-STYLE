<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 - PUPPY STYLE</title>
</head>
<body>
	 <table border="1" width="100%">
    <tr>
      <td align="center">
        <h1>PUPPY STYLE</h1>
        <img src="/images/최종로고.png" alt="로고" width="150">
      </td>
    </tr>
    <tr>
      <td align="center">
        <a href="/">홈</a>
        <a href="/guest/productList">상품목록</a>
        <a href="/member/myPage">마이페이지</a>
        <a href="/member/cartList">장바구니</a>
        <a href="/logout">로그아웃</a>
      </td>
    </tr>
  </table>

  <br>
  <h3 align="center">장바구니 (${cartList.size()} items)</h3>
  <br>

  <table border="1" width="800" align="center">
    <tr>
      <th>상품명</th>
      <th>사이즈</th>
      <th>가격</th>
      <th>수량</th>
      <th>소계</th>
      <th>삭제</th>
    </tr>

    <c:choose>
      <c:when test="${empty cartList}">
        <tr>
          <td colspan="6" align="center">장바구니가 비어있습니다.</td>
        </tr>
      </c:when>
      <c:otherwise>
        <c:forEach var="c" items="${cartList}">
        <tr>
          <td align="center">${c.pname}</td>
          <td align="center">${c.psize}</td>
          <td align="center">
            <fmt:formatNumber value="${c.pdecimal}" pattern="#,###"/>원
          </td>
          <td align="center">
            <form action="/member/updateCart" method="post">
              <input type="hidden" name="pnum" value="${c.pnum}">
              <input type="number" name="cartcount" value="${c.cartcount}" min="1" max="99" style="width:50px">
              <input type="submit" value="변경">
            </form>
          </td>
          <td align="center">
            <fmt:formatNumber value="${c.pdecimal * c.cartcount}" pattern="#,###"/>원
          </td>
          <td align="center">
            <a href="/member/deleteCart?pnum=${c.pnum}"
               onclick="return confirm('삭제하시겠습니까?')">X</a>
          </td>
        </tr>
        </c:forEach>
      </c:otherwise>
    </c:choose>

    <tr>
      <td colspan="4" align="right"><b>총 금액</b></td>
      <td align="center" colspan="2">
        <b><fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</b>
      </td>
    </tr>
  </table>

  <br>
  <table width="800" align="center">
    <tr>
      <td align="left"><a href="/guest/productList">← 쇼핑 계속하기</a></td>
      <td align="right">
        <input type="button" value="구매하기" onclick="alert('준비중입니다.')">
      </td>
    </tr>
  </table>

  <br>
  <table width="100%" border="1">
    <tr>
      <td align="center">
        <h3>PUPPY STYLE</h3>
        대표 : 홍길슌<br>
        전화번호 : 02-1234-0000<br>
        이메일 : puppy@test.com
      </td>
    </tr>
  </table>
</body>
</html>