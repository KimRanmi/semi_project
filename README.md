🏡 1인 가구 커뮤니티 웹사이트

> 1인 가구를 위한 중고 거래, 나눔, 커뮤니티 기능을 제공하는 웹 서비스입니다.  
> 사용자가 편리하게 소통하고 거래할 수 있도록 게시글 끌어올리기, 주소 자동 완성, 좋아요 기능 등을 구현했습니다.

---

📌 프로젝트 개요
- **프로젝트명**: 1인 가구 커뮤니티 플랫폼
- **개발기간**: 2024.06.03 ~ 2024.07.24
- **팀원 구성**: 5인
- **담당 역할**: 판매/나눔 게시판 기능 전체 구현

---

🔨 사용 기술
| 구분 | 기술 |
|------|------|
| Language | Java, HTML5, CSS, JavaScript |
| Back-end | JSP, Servlet |
| Front-end | jQuery, Bootstrap |
| DB | MariaDB (HeidiSQL) |
| Server | Apache Tomcat 9 |
| Tool | Eclipse, GitHub |

---

💻 주요 기능

📌 게시판 기능
- 판매/나눔 게시글 CRUD
<img width="1200" height="1149" alt="sl1-2" src="https://github.com/user-attachments/assets/f59a6e24-d00f-4111-ad72-e259ee3f298a" />
- 좋아요 기능
<img width="1502" height="1132" alt="sl1" src="https://github.com/user-attachments/assets/d59aec99-19fb-4121-9830-9abea59813f7" />
- 게시글 끌어올리기
- 게시글 등록일 기준 시간 표시 (ex. 1분 전, 3시간 전 등)
- 주소 자동완성 기능 (카카오 주소 API)

---

🔍 트러블슈팅

🐞 좋아요 기능 오류
- 문제: 좋아요 상태가 새로고침 시 초기화됨
- 원인: 세션 상태와 DB 상태 미동기화
- 해결: 세션-DB 동기화 로직 추가 → 상태 유지 정상 작동

---


📝 회고 & 느낀점
- 사용자 경험에 맞춘 인터페이스와 기능 구현의 중요성을 체감했습니다.
- 실습을 통해 동기화 문제를 직접 해결하며 문제 해결 역량이 성장했습니다.
- UI 흐름에 따른 기능 반응을 맞추는 것이 얼마나 중요한지 배웠습니다.

---


