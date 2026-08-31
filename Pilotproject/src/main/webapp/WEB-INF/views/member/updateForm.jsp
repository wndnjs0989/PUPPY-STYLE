<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정 - PUPPY STYLE</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateForm.css">
    
    <script>
        function goPopup(){
            window.open("/member/jusoPopup", "pop", "width=570,height=420,scrollbars=yes,resizable=yes");
        }
        
        function jusoCallBack(maddr1, maddr2, mzip){
            document.updateForm.maddr1.value = maddr1;
            document.updateForm.maddr2.value = maddr2;
            document.updateForm.mzip.value = mzip;
        }
    </script>
</head>
<body>
    <header class="header">
        <div class="top-header">
            <div class="logo">
                <img src="/images/최종로고.png" alt="logo">
                <h1>PUPPY STYLE</h1>
            </div>
            <div class="right-menu">
                <sec:authorize access="isAuthenticated()">
                    <span><sec:authentication property="name"/>님</span>
                    <span>|</span>
                    <a href="/member/updateForm">회원정보수정</a>
                    <span>|</span>
                    <a href="/logout">로그아웃</a>
                </sec:authorize>
            </div>
        </div>
    </header>

    <nav class="menu">
        <a href="/">홈</a>
        <a href="#">마이페이지</a>
        <a href="#">장바구니</a>
    </nav>

    <div class="update-wrap">
        <h2>회원정보 수정</h2>
        <form action="/member/updateMember" method="post" id="updateForm" name="updateForm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            
            <table class="update-table">
                <tr>
                    <th>아이디</th>
                    <td>
                        ${member.mid}
                        <input type="hidden" name="mid" value="${member.mid}">
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                   	 ${member.mname}
                    <input type="hidden" name="mname" value="${member.mname}"></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="text" name="mtel1" maxlength="3" class="tel" value="${fn:split(member.mtel,'-')[0]}"> -
                        <input type="text" name="mtel2" maxlength="4" class="tel" value="${fn:split(member.mtel,'-')[1]}"> -
                        <input type="text" name="mtel3" maxlength="4" class="tel" value="${fn:split(member.mtel,'-')[2]}">
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td><input type="date" name="mbirth" value="${member.mbirth}"></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input type="text" name="maddr1" value="${fn:substringBefore(member.mprofile,',')}">
                        <input type="button" value="주소검색" onclick="goPopup();">
                    </td>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <td><input type="text" name="maddr2" value="${fn:substringAfter(member.mprofile,',')}"></td>
                </tr>
                <tr>
                    <th>우편번호</th>
                    <td><input type="text" name="mzip" value="${member.mzip}"></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="memail" value="${member.memail}"></td>
                </tr>
                <tr>
                    <th>가입인사</th>
                    <td><textarea name="mmemo" rows="5">${member.mmemo}</textarea></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td class="radio-group">
                    	${member.mgender}
                        <label><input type="hidden" name="mgender" value="남성" ${member.mgender=='남성'?'checked':''}></label>
                    </td>
                </tr>
                <tr>
                    <th>취미</th>
                    <td class="check-group">
                        <label><input type="checkbox" name="mhobby" value="운동" ${fn:contains(member.mhobby,'운동')?'checked':''}> 운동</label>
                        <label><input type="checkbox" name="mhobby" value="게임" ${fn:contains(member.mhobby,'게임')?'checked':''}> 게임</label>
                        <label><input type="checkbox" name="mhobby" value="독서" ${fn:contains(member.mhobby,'독서')?'checked':''}> 독서</label>
                        <label><input type="checkbox" name="mhobby" value="등산" ${fn:contains(member.mhobby,'등산')?'checked':''}> 등산</label>
                    </td>
                </tr>
            </table>            
        </form>
        <div class="btn-area">
		    <button type="submit" form="updateForm" class="save-btn"onclick="alert('수정이 되었습니다.');">수정완료</button>
		    <a href="/" class="cancel-btn">돌아가기</a>
		    
		    <form action="/member/esc" method="POST" style="display:inline-block;">
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        <button type="submit" class="withdraw-btn">회원탈퇴</button>
		    </form>
		</div>

    <footer class="footer">
        <h3>PUPPY STYLE</h3>
        <p>대표 : 홍길슌 | 전화번호 : 02-1234-0000 | 이메일 : puppy@test.com</p>
    </footer>
</body>
</html>