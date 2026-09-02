<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    .checkbox-group {
        display: flex; /* 가로 정렬 */
        gap: 15px;      /* 체크박스 사이 간격 */
        padding: 10px 0;
    }
    .checkbox-group label {
        display: flex;
        align-items: center;
        cursor: pointer;
    }
</style>
<meta charset="UTF-8">
<title>상품등록 - 관리자</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productWriteForm.css">
</head>
<body>
  <div class="product-wrap">
    <h3>상품 등록</h3>
    <a href="/admin/productManage">상품관리</a>
    <br><br>

    <form action="/admin/insertProduct" method="post" enctype="multipart/form-data">
      <div class="input-group">
        <label>상품번호</label>
        <input type="text" name="pnum" required>
      </div>
      <div class="input-group">
        <label>상품명</label>
        <input type="text" name="pname" required>
      </div>
      <div class="input-group">
        <label>가격</label>
        <input type="text" name="pdecimal" required>
      </div>
      <div class="input-group">
        <label>수량</label>
        <input type="text" name="pquantity" required>
      </div>
      <div class="input-group">
        <label>카테고리</label>
        <select name="pcategory">
          <option value="신상품">신상품</option>
          <option value="베스트">베스트</option>
          <option value="올인원">올인원</option>
        </select>
      </div>
     <div class="input-group">
	    <label>사이즈 선택</label>
	    <div class="checkbox-group">
	        <label><input type="checkbox" name="psize" value="XS"> XS</label>
	        <label><input type="checkbox" name="psize" value="S"> S</label>
	        <label><input type="checkbox" name="psize" value="M"> M</label>
	        <label><input type="checkbox" name="psize" value="L"> L</label>
	        <label><input type="checkbox" name="psize" value="XL"> XL</label>
	    </div>
	</div>
      <div class="input-group">
        <label>색상</label>
        <input type="text" name="pcolor">
      </div>
      <div class="input-group">
        <label>대상</label>
        <input type="text" name="pobject" placeholder="강아지/고양이">
      </div>
      <div class="input-group">
        <label>계절</label>
        <input type="text" name="pfoutseaeons" placeholder="봄/여름/가을/겨울/사계절">
      </div>
      <div class="input-group">
        <label>이미지</label>
        <input type="file" name="pupload">
      </div>
      <div class="input-group">
        <label>상품설명</label>
        <textarea name="pmemo" rows="4" cols="30"></textarea>
      </div>
      
      <div class="btn-group">
        <input type="submit" value="등록">
        <input type="reset" value="등록취소">
      </div>
    </form>
  </div>
</body>
</html>