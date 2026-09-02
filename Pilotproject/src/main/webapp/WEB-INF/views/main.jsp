<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PUPPY STYLE</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<header class="header">
    <div class="top-header">
        <div class="logo">
            <img src="/images/최종로고.png" alt="logo">
            <h1>PUPPY STYLE</h1>
        </div>
        <div class="right-menu">
            <sec:authorize access="isAnonymous()">
                <a href="/loginForm">로그인</a>
                <span>|</span>
                <a href="/member/writeForm">회원가입</a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <sec:authentication property="name"/>님
                <span>|</span>
                <a href="/member/updateForm">회원정보수정</a>
                <span>|</span>
                <a href="/logout">로그아웃</a>
            </sec:authorize>
            <div class="search-box">
                <input type="text" placeholder="검색">
                <button>검색</button>
            </div>
        </div>
    </div>
</header>

<nav class="menu">
    <a href="/">홈</a>
    <a href="/guest/productList">신상품</a>
    <a href="#">베스트</a>
    <a href="#">아우터</a>
    <a href="#">올인원</a>
    <a href="#">세일</a>
    <a href="#">커뮤니티</a>
</nav>

<section class="banner">
    <div class="banner-text">
        <h2>더운 여름,<br>우리 댕댕이를 위한 시원한 선물</h2>
        <a href="/guest/productList" class="custom-btn">신상품 보러가기</a>
    </div>
    <div class="banner-image">
        <img src="/images/10385.png">
    </div>
</section>

<section class="product-wrap">
    <h2 class="title">NEW ARRIVALS</h2>
    <div class="product-list">
        <div class="product-card">
            <div class="img-slider" onclick="slideImg(this)">
                <div class="slider-track">
                    <img src="${pageContext.request.contextPath}/images/085038.png">
                    <img src="${pageContext.request.contextPath}/images/085043.png">
                    <img src="${pageContext.request.contextPath}/images/085048.png">
                    <img src="${pageContext.request.contextPath}/images/085053.png">
                    <img src="${pageContext.request.contextPath}/images/085059.png">
                    <img src="${pageContext.request.contextPath}/images/085104.png">
                    <img src="${pageContext.request.contextPath}/images/085109.png">
                    <img src="${pageContext.request.contextPath}/images/085114.png">
                </div>
            </div>
            <h3>체리핑 호박 몸빼 바지 옷</h3>
            <p class="price">23,900원</p>
            <button onclick="return addCart();">장바구니 담기</button>
        </div>
        <div class="product-card">
            <div class="img-slider" onclick="slideImg(this)">
                <div class="slider-track">
                    <img src="${pageContext.request.contextPath}/images/172309.png">
                    <img src="${pageContext.request.contextPath}/images/172315.png">
                    <img src="${pageContext.request.contextPath}/images/172322.png">
                    <img src="${pageContext.request.contextPath}/images/172326.png">
                </div>
            </div>
            <h3>음료수 쿨링 나시 냉감 티셔츠</h3>
            <p class="price">16,920원</p>
            <button onclick="return addCart();">장바구니 담기</button>
        </div>
        <div class="product-card">
            <div class="img-slider" onclick="slideImg(this)">
                <div class="slider-track">
                    <img src="${pageContext.request.contextPath}/images/171851.png">
                    <img src="${pageContext.request.contextPath}/images/171858.png">
                    <img src="${pageContext.request.contextPath}/images/171903.png">
                    <img src="${pageContext.request.contextPath}/images/171908.png">
                </div>
            </div>
            <h3>피크닉 원피스 세트</h3>
            <p class="price">24,700원</p>
            <button onclick="return addCart();">장바구니 담기</button>
        </div>
        <div class="product-card">
            <div class="img-slider" onclick="slideImg(this)">
                <div class="slider-track">
                    <img src="${pageContext.request.contextPath}/images/093054.png">
                    <img src="${pageContext.request.contextPath}/images/093057.png">
                    <img src="${pageContext.request.contextPath}/images/093101.png">
                    <img src="${pageContext.request.contextPath}/images/093105.png">
                    <img src="${pageContext.request.contextPath}/images/093109.png">
                    <img src="${pageContext.request.contextPath}/images/093114.png">
                    <img src="${pageContext.request.contextPath}/images/093118.png">
                </div>
            </div>
            <h3>쿨링 조끼 쿨링 티</h3>
            <p class="price">18,800원</p>
            <button onclick="return addCart();">장바구니 담기</button>
        </div>
    </div>
</section>

<footer class="footer">
    <h3>PUPPY STYLE</h3>
    <p>대표 : 홍길슌</p>
    <p>전화번호 : 02-1234-0000</p>
    <p>이메일 : puppy@test.com</p>
    
</footer>

<div id="deliveryModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <img src="${pageContext.request.contextPath}/images/배송관련.png" alt="배송 안내" style="width:100%;">
    </div>
</div>

<script>
// 슬라이더 초기화
document.querySelectorAll(".img-slider").forEach(function(slider){
    const imgs = slider.querySelectorAll("img");
    imgs.forEach(function(img,index){ if(index!=0) img.style.display="none"; });
    slider.dataset.cur=0;
});

// 이미지 변경
function slideImg(slider){
    const imgs=slider.querySelectorAll("img");
    let cur=parseInt(slider.dataset.cur);
    imgs[cur].style.display="none";
    cur=(cur+1)%imgs.length;
    imgs[cur].style.display="block";
    slider.dataset.cur=cur;
}

// 장바구니
function addCart(){
    var isLogin='<sec:authorize access="isAuthenticated()">true</sec:authorize>';
    if(isLogin.trim()!="true"){
        if(confirm("로그인이 필요합니다.\n로그인 페이지로 이동하시겠습니까?")){ location.href="/loginForm"; }
        return false;
    }
    alert("장바구니에 담았습니다.");
    return false;
}

//모달 기능
function openModal() { document.getElementById("deliveryModal").style.display = "block"; }
function closeModal() { document.getElementById("deliveryModal").style.display = "none"; }
window.onclick = function(event) {
    if (event.target == document.getElementById("deliveryModal")) { closeModal(); }
}

// 페이지 로드 시 모달 자동 실행
window.onload = function() {
    openModal();
};
</script>
</script>
</body>
</html>