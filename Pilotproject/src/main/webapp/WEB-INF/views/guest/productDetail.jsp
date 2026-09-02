<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.pname} - 상세 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetail.css">
</head>
<body>
  <div class="btn-box">
      <a href="${pageContext.request.contextPath}/guest/productList" class="back-btn">목록으로 돌아가기</a>
  </div>

  <div class="detail-container">
      <div class="detail-left">
          <img src="/images/${product.pimage}" alt="상품 이미지">
      </div>
      <div class="detail-right">
          <h2>${product.pname}</h2>
          <div class="info-box" style="margin: 20px 0;">
        <p style="color: #666; margin-bottom: 5px;">
            정상가격: <s style="color: #999;">${product.pdecimal}원</s>
        </p>
        <p style="color: #d32f2f; font-weight: bold; font-size: 1.2rem;">
            할인가격: ${Math.round(product.pdecimal * 0.9)}원
        </p>
    	</div>
          <div class="options">
              <p>색상: ${product.pcolor}</p>
              <p>사이즈: ${product.psize}</p>
          </div>
          <div class="btn-group">
              <button class="buy-btn">구매하기</button>
              <button class="cart-btn">장바구니 담기</button>
          </div>
          <div class="description">
              <h3>상세 설명</h3>
              <p>${product.pmemo}</p>
          </div>
      </div>
  </div>
</body>
</html>