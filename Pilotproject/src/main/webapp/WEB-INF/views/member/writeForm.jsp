<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/writeForm.css">
<script src="/js/memberValidate.js"></script>
<script language="javascript">
</script>
</head>
<body>
	<form action="/insertMember" name="member" method="post" onsubmit="return validateForm()">
		<div class="title-container">
		<h3>회원가입</h3>
		<img src="/images/100235.png" class="underline-img">
		</div>
		<input type="hidden" name="mauthority" value="USER">
		아이디 <input type="text" name="mid"><br>
		비밀번호 <input type="password" name="mpasswd" ><br>
		비밀번호확인  <input type="password" name="mpasswdCheck" ><br>
		이름 <input type="text" name="mname" ><br>
		전화번호 <input type="text" name="mtel1" size="3" maxlength="3" > - 
				<input type="text" name="mtel2" size="4" maxlength="4" > - 
				<input type="text" name="mtel3" size="4" maxlength="4" ><br>
		생년월일  <input type="date" name="mbirth"><br>
		주소 <input type="text" name="maddr1" ><input type="button" onClick="goPopup();" value="주소 검색"><br>
		상세주소<input type="text" name="maddr2"><br>
		우편번호 <input type="text" name="mzip" ><br>
		이메일 <input type="email" name="memail" placeholder="puppy123@naver.com"><br>
		 <textarea rows="8" cols="55" name="mmemo" placeholder="가입인사를 작성해주세요"></textarea> <br>
		성별 <input type="radio" name="mgender" value="남성" >남성
			<input type="radio" name="mgender" value="여성" >여성<br>
		취미 <input type="checkbox" name="mhobby" value="운동">운동 
			<input type="checkbox" name="mhobby" value="게임">게임
			<input type="checkbox" name="mhobby" value="독서">독서
			<input type="checkbox" name="mhobby" value="등산">등산<br>
		<input type="submit" value="회원가입">
		<input type="reset" value="회원가입취소">
	
	</form>
</body>
</html>