<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 - 관리자</title>
<link rel="stylesheet" href="/css/productManage.css">
</head>
<body>

  <h3>상품 관리</h3>

  <div class="menu-container">
      <a href="/">홈</a>
      <a href="/guest/productList">상품 목록</a>
      <a href="/admin/productWriteForm">상품 등록</a>
      <a href="/logout">로그아웃</a>
  </div>
 
  <p style="text-align: center;">전체 상품 수 : ${productList.size()} 개</p>

  <table>
    <thead>
      <tr>
        <th>번호</th>
        <th>상품명</th>
        <th>이미지</th>
        <th>가격</th>
        <th>수량</th>
        <th>카테고리</th>
        <th>사이즈</th>
        <th>색상</th>
        <th>대상</th>
        <th>계절</th>
        <th>설명</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="p" items="${productList}" varStatus="s">
      <tr>
        <td>${s.count}</td>
        <td>${p.pname}</td>
        <td><img src="/images/${p.pimage}"></td>
        <td>${p.pdecimal}원</td>        
        <td>${p.pquantity}</td>
        <td>${p.pcategory}</td>
        <td>${p.psize}</td>
        <td>${p.pcolor}</td>
        <td>${p.pobject}</td>
        <td>${p.pfoutseaeons}</td>
        <td class="description-cell">${p.pmemo}</td>
        <td>
          <a href="/admin/productUpdateForm?pnum=${p.pnum}" class="btn-action btn-update">수정</a>
        </td>
        <td>
          <a href="/admin/deleteProduct?pnum=${p.pnum}" class="btn-action btn-delete" 
             onclick="return confirm('삭제하시겠습니까?')">삭제</a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
 
</body>
</html>