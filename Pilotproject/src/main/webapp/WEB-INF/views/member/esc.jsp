<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/esc.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="withdraw-wrap">
    <div class="header-section">
        <h2>회원탈퇴</h2>
        <p>회원탈퇴를 원하시나요? 정말 아쉬워요...</p>
    </div>

    <form id="processEsc" action="/member/esc" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        
        <div class="reason-section">
            <label><strong>이유 선택</strong></label>
            <div class="radio-group" style="margin: 10px 0;">
                <label><input type="radio" name="reason" value="1"> 서비스가 마음에 들지 않아요</label><br>
                <label><input type="radio" name="reason" value="2"> 상품이 다양하지 않아요</label><br>
                </div>
            <textarea name="otherReason" placeholder="기타 의견을 적어주세요"></textarea>
        </div>

        <button type="submit" class="btn-withdraw">탈퇴하기</button>
        <button type="button" class="btn-home" onclick="location.href='/'">홈으로 돌아가기</button>
    </form>
</div>
</body>
</html>