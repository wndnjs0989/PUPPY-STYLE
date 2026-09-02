<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - PUPPY STYLE</title>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/loginForm.css">
</head>
<body>
  <table width="100%">
    <tr>
      <td align="center">
        <h1>PUPPY STYLE</h1>
        <img src="/images/최종로고.png" alt="최종로고" width="150">
      </td>
    </tr>
    <tr>
      <td align="center" class="menu-area">
        <a href="/" class="menu-link">홈</a>
        <a href="/guest/productList" class="menu-link">신상품</a>
        <a href="#" class="menu-link">베스트</a>
        <a href="#" class="menu-link">올인원</a>
        <a href="#" class="menu-link">커뮤니티</a>
      </td>
    </tr>
  </table>

  <br>

  <table width="400" align="center" class="login-wrapper">
    <tr>
        <td align="center">
            <div class="login-box">
                <h3>로그인</h3>
                <form action="/j_spring_security_check" name="login" method="post">
                    <input type="text" name="id" placeholder="아이디를 입력하세요"><br>
                    <input type="password" name="passwd" placeholder="비밀번호를 입력하세요"><br>
                    
                    <div class="btn-group">
                        <input type="submit" value="로그인" class="btn-submit">
                        <input type="reset" value="로그아웃" class="btn-reset">
                    </div>
                    <a href="/member/writeForm" class="join-link">회원가입</a>
                </form>
            </div>
            </td>
    </tr>
</table>

  <br>

  <table width="100%">
    <tr>
      <td align="center">
        <h3>PUPPY STYLE</h3>
        대표 : 홍길슌<br>
        전화번호 : 02-1234-0000<br>
        이메일 : puppy@test.com
      </td>
    </tr>
  </table>

<script>
  document.login.id.focus();
</script>
</body>
</html>