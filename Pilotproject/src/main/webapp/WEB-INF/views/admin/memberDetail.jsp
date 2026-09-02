<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 상세 정보 - 관리자</title>
    <link rel="stylesheet" href="/css/memberDetail.css">
</head>
<body>

<div class="update-wrap">
    <h2>회원 상세 정보</h2>
    
    <table class="update-table">
        <tr>
            <th>아이디</th>
            <td>${member.mid}</td>
        </tr>
        <tr>
            <th>이름</th>
            <td>${member.mname}</td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>${member.mtel}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${member.memail}</td>
        </tr>
        <tr>
            <th>주소</th>
            <td>(${member.mzip}) ${member.mprofile}</td>
        </tr>
        <tr>
            <th>생년월일</th>
            <td>${member.mbirth}</td>
        </tr>
        <tr>
            <th>성별</th>
            <td>${member.mgender}</td>
        </tr>
        <tr>
            <th>취미</th>
            <td>${member.mhobby}</td>
        </tr>
        <tr>
            <th>가입인사</th>
            <td>${member.mmemo}</td>
        </tr>
    </table>

    <div class="btn-area">
        <a href="/admin/memberList" class="cancel-btn">목록으로</a>
        <a href="/admin/memberDelete?mno=${member.mno}" class="save-btn" 
           onclick="return confirm('정말 삭제하시겠습니까?')">회원 삭제</a>
    </div>
</div>

</body>
</html>