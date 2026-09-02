<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품수정 - 관리자</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productUpdateForm.css">
</head>
<body>
<div class="product-wrap">
    <h3>상품 수정</h3>
    <a href="/admin/productManage">목록으로</a>

    <form action="/admin/updateProduct" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pnum" value="${product.pnum}">

        <div class="input-group">
            <label>상품명</label>
            <input type="text" name="pname" value="${product.pname}" required>
        </div>
        <div class="input-group">
            <label>가격</label>
            <input type="text" name="pdecimal" value="${product.pdecimal}" required>
        </div>
        <div class="input-group">
            <label>수량</label>
            <input type="text" name="pquantity" value="${product.pquantity}" required>
        </div>
        <div class="input-group">
            <label>카테고리</label>
            <select name="pcategory">
                <option value="신상품" ${product.pcategory == '신상품' ? 'selected' : ''}>신상품</option>
                <option value="베스트" ${product.pcategory == '베스트' ? 'selected' : ''}>베스트</option>
                <option value="올인원" ${product.pcategory == '올인원' ? 'selected' : ''}>올인원</option>
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
            <input type="text" name="pcolor" value="${product.pcolor}">
        </div>
        <div class="input-group">
            <label>대상</label>
            <input type="text" name="pobject" value="${product.pobject}">
        </div>
        <div class="input-group">
            <label>계절</label>
            <input type="text" name="pfoutseaeons" value="${product.pfoutseaeons}">
        </div>
        <div class="input-group">
            <label>이미지</label>
            <input type="file" name="pupload">
        </div>
        <div class="input-group">
            <label>메모</label>
            <textarea name="pmemo" rows="4">${product.pmemo}</textarea>
        </div>

        <div class="btn-group">
            <input type="submit" value="수정">
            <input type="reset" value="취소" onclick="location.href='/admin/productManage'">
        </div>
    </form>
</div>
</body>