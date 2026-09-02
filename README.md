# PUPPY-STYLE [개인프로젝트]
Spring Boot를 이용한 개인 프로젝트입니다.


# 프로젝트 소개
강아지 옷 판매 쇼핑몰을 구현한 웹사이트 개발 프로젝트입니다.

# 개발 환경

- **Backend:** Java, Spring Boot, Spring MVC
- **Database / ORM:** MySQL, MyBatis
- **Frontend:** HTML, CSS, JavaScript
- **Tools & Environment:** ERwin, OpenOffice, StarUML, GitHub

# 주요 기능

- **회원 관리**
  - 회원가입 및 로그인
  - 회원정보 수정 및 회원탈퇴
- **상품 관리**
  - 상품 등록 및 조회
  - 상품 수정 및 삭제
- **주문 관리**
  - 주문 상품 등록 및 주문 내역 조회
- **권한 및 관리자**
  - 비회원 기능 및 관리자 전용 회원 관리 기능

# 담당한 부분 [개인프로젝트라 전부 담당하엿습니다.]
| 구분 | 팀원 이름 | 담당 부분 |
| :--- | :--- | :--- |
| **팀원** | 이창희 | DTO. DAO. CONTROLLER. XML. JSP. CSS. 발표자료 |


# Git 협업 규칙
1. `master` 브랜치 직접 Push 금지 🚫
2. 개인 브랜치에서 작업 💻
3. 작업 완료 후 Commit 💾
4. GitHub에 Push 🚀
5. Pull Request 생성 🔀
6. 리뷰 후 `master` Merge ✅

# 브랜치

```text
main
├── java/com/springboot/teasommelier
│   ├── auth
│   ├── config
│   ├── controller
│   ├── dao
│   ├── dto
│   └── service
├── resources
│   ├── mybatis
│   └── static
└── webapp/WEB-INF/views
    ├── admin
    ├── member
    └── guest
