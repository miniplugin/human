## 통합구현 (v5.0.0)
 
---

- [학습목차](https://github.com/miniplugin/human)
- 능력단위 요소: 2001020206_16v4

---

### 학습목표(아래)
- 모듈 간의 분산이 이루어진 경우를 포함하여 단위 모듈 간의 데이터 관계를 분석한다.
- 이를 기반으로 한 메커니즘 모듈 간의 효율적인 연계를 구현하여 검증할 수 있다.

### 핵심키워드(아래)
- 연계 데이터, 연계 메커니즘, 송수신 현황 모니터링, 데이터 보안, 연계 모듈, EAI(Enterprise Application
Integration)/ESB(Enterprise Service Bus), 엔터티 관계도(ERD: Entity Relationship Diagram), 연계(인
터페이스) 정의서, 연계(인터페이스) 설계서

### 연계 데이터 구성하기
- HRD-Net 로그인 > 회원정보 > 오픈API신청 > 인증키 확인
- HRD-Net 연계데이터 구성 및 Online 테스트페이지 확인: http://www.hrd.go.kr/hrdp/ap/papco/PAPCO0700T.do

### 연계 메커니즘 구성하기
- [연계시스템 예시_원격모니터링시스템_Agent(중계)시스템으로 매커니즘 이해 PDF보기](/git_img/example.pdf).

### 내외부 연계 모듈 구현하기
- Hello World MVC 프로젝트에서 src/test/java 패키지에 OpenApi.java 클래스로 API모듈구현.

### 참고자료 출처(아래)
- 위에 사용된 소프트웨어는 자유SW 또는 GNU / LGPL / MIT license 입니다.
- HRD-Net 오픈API(정부3.0서비스): http://www.hrd.go.kr/hrdp/ap/papao/PAPAO0100D.do
- [연계시스템 예시_원격모니터링시스템_Agent(중계)시스템이해 PDF보기](/git_img/example.pdf)
- eclipse xmlutil pretty print(콘솔창에서 xml 이쁘게 출력)방법 : https://bryan7.tistory.com/83