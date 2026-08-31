<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록 - PUPPY STYLE</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/produstList.css">
</head>
<body>
<div class="product-wrap">
    <div class="list-header">
        <a href="/" class="main-page-btn">◀ 메인페이지</a>
        <h2>상품 목록</h2>
        <sec:authorize access="hasRole('ROLE_ADMIN')"> 
        	<a href="/admin/productWriteForm">상품등록</a>
            <a href="/admin/productManage">상품관리</a>
            <a href="/admin/memberList">회원목록</a>            
        </sec:authorize>
    </div>    
    <div class="product-container">
        </div>
</div>
  <div class="product-container">
    <c:forEach var="p" items="${productList}">
        <div class="product-card">
            <div class="img-box">
                <img src="/images/${p.pimage}" alt="${p.pname}">
            </div>
           <div class="info-box">
			    <p class="pname">${p.pname}</p>
			    
			   <span class="price"> 정상가격 <s>${p.pdecimal}원</s></span><br>
			    
			   <span class="prices"> 할인가격 ${Math.round(p.pdecimal * 0.9)}원</span>
			</div>
            <a href="${pageContext.request.contextPath}/guest/productDetail?pnum=${p.pnum}" 
               style="display:block; margin-bottom:10px; color:#555; text-decoration:none;">상세보기</a>
            <button class="cart-btn">찜하기</button>
        </div>
        
    </c:forEach>
  </div>
</div>
</body>
</html>