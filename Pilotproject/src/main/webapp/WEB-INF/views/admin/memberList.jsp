<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>관리자 - 회원목록</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/memberList.css">
</head>
<body>

    <%-- 관리자 헤더 영역 --%>
    <div class="admin-header">
        <h3>관리자 페이지 - 회원목록</h3>
        <a href="/">홈으로</a>
        <a href="/admin/productManage">상품관리</a>
        <a href="/logout">로그아웃</a>
        <br><br>
        <span class="member-count">
            전체 회원 수: ${memberList.size()} 명
        </span>
    </div>

    <%-- 회원 목록 테이블 --%>
    <table class="member-table">
        <tr>
            <th>NO</th>
            <th>아이디</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>생년월일</th>
            <th>이메일</th>
            <th>성별</th>
            <th>취미</th>
            <th>권한</th>
            <th>가입일</th>
        </tr>

        <c:forEach var="m" items="${memberList}" varStatus="s">
        <tr>
            <%-- 번호 --%>
            <td align="center">${s.count}</td>

            <%-- 아이디 (상세보기 링크) --%>
            <td align="center">
                <a href="${pageContext.request.contextPath}
                         /admin/memberDetail?mid=${m.mid}">
                    ${m.mid}                    <%-- s.count → m.mid 수정 --%>
                </a>
            </td>

            <%-- 이름 --%>
            <td align="center">${m.mname}</td>

            <%-- 전화번호 --%>
            <td align="center">${m.mtel}</td>

            <%-- 생년월일 --%>
            <td align="center">${m.mbirth}</td>

            <%-- 이메일 --%>
            <td align="center">${m.memail}</td>

            <%-- 성별 --%>
            <td align="center">${m.mgender}</td>

            <%-- 취미 --%>
            <td align="center">${m.mhobby}</td>

            <%-- 권한 --%>
            <td align="center">${m.mauthority}</td>

            <%-- 가입일 (날짜 형식화) --%>
            <td align="center">
                <fmt:formatDate value="${m.mdate}"
                                pattern="yyyy-MM-dd"/>
            </td>
        </tr>
        </c:forEach>

    </table>

</body>
</html>