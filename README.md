## 인터페이스 구현 (v9.0.0)
 
---

- [학습목차](https://github.com/miniplugin/human)
- 능력단위 요소: 2001020212_16v4

---

### 학습목표(아래)

- 모듈 간의 분산이 이루어진 경우를 포함하여 단위 모듈 간의 데이터 관계를 분석하고 이를 기반으로 한 메커니즘을 통해 모듈 간의 효율적인 연계를 구현하고 검증할 수 있다.

### 핵심키워드(아래)

- 인터페이스 공통 기능, 인터페이스 표준, 인터페이스 예외 처리, 인터페이스 보안 기능, 인터페이스 검증, 인터페이스 오류 처리, 인터페이스 보고서 

### 인터페이스 설계서 확인하기(아래)

- 외부, 내부 모듈 간 공통 기능 및 데이터 인터페이스 확인.
- 외부 및 내부 모듈 연계를 위한 인터페이스 기능 식별.
- 외부 및 내부 모듈 간 인터페이스 데이터 표준 확인.
- 기존 소스 확인 및 내용 추가

```
탐식기에서 이클립스 workspace 폴더로 이동한 후
탐색기 상단경로에서 CMD 워크스페이스 폴더경로 엔터
git clone https://github.com/miniplugin/Dbinterface_ora.git
이클립스에서 프로젝트 Import 실행
이 후 강사와 수업 함께 진행.
작업순서1: member테이블과 매칭되는 MemberVO 클래스 제작 [/src/main/java/org/edu/vo/MemberVO.java]
작업순서2: Mapper쿼리작성 [/src/main/resources/mappers/sampleMapper.xml]
작업순서3: IF와 매칭되는 구현클래스 생성
//DAO인터페이스 경로: /src/main/java/org/edu/service/IF_SampleService.java, IF_SampleDAO.java
작업순서4: IF클래스(DAO, Service)에 아래 4개의 메서드 추가 후 구현클래스 자동 생성 후 구현클래스에서 쿼리 호출
// 회원정보 입력-조회-수정-삭제 메서드 명세
	public void insertMember(MemberVO vo) throws Exception;
	public List<MemberVO> selectMember() throws Exception;
	public void updateMember(MemberVO vo) throws Exception;
	public void deleteMember(String userid)throws Exception;
구현클래스 쿼리 추가 핵심(구현 SampleDAO.java, SampleService.java 클래스에 아래 @inject 추가
@Inject
	private SqlSession sqlSession;
작업순서5: Junit 테스트 사용 [/src/test/java/org/edu/test/SampleMapperTest.java]
작업순서6: log4jdbc/AOP용디버그용 설정추가 [/src/main/webapp/WEB-INF/spring/root-context.xml]
작업순서7: log4설정변경 [/src/main/resources/log4j.xml]
작업순서8: AOP파일 [/src/main/java/org/edu/aop/SampleAdvice.java]
작업순서9: view 화면구현 [/src/main/webapp/WEB-INF/views/home.jsp]
작업순서10: 컨트롤러 클래스에서 @RequestMapping 경로추가 [/src/main/java/org/edu/controller/HomeController.java]
```

### 인터페이스 기능 구현하기(아래)

- 인터페이스 기능 구현 정의.
- 인터페이스 구현.
- 인터페이스 예외 처리 방안 정의.
- 인터페이스 보안 기능 적용.
- 기존 Mysql용 인터페이스 프로젝트를 Oracle용으로 변환

```
오라클용 root-context.xml 설정 추가.
오라클용 으로 테이블 쿼리 변경 및 오라클용 외부 ojdbc6.jar 라이브러리 추가.
create table member
	(
	 userid varchar(50) not null
	    ,userpw varchar(50) not null
	    ,username varchar(50) not null
	    ,email varchar(100)
	    ,regdate DATE DEFAULT SYSDATE NOT NULL
	    ,updatedate DATE DEFAULT SYSDATE NOT NULL
	    ,CONSTRAINT MEMBERS_PK PRIMARY KEY (userid)
	)
    INSERT INTO member VALUES ('user2','1234','kimilguk','user02@test.com',SYSDATE,SYSDATE);
```

### 인터페이스 구현 검증하기(아래)

- 인터페이스 구현 검증.
- 인터페이스 오류 처리 확인 및 보고서 작성.

### 참고자료 출처(아래)

- 위에 사용된 소프트웨어는 자유SW 또는 GNU / LGPL / MIT license 입니다.
- [NCS학습모듈] https://ncs.go.kr/unity/th03/ncsSearchMain.do :/정보통신/정보기술/정보기술개발/응용SW엔지니어링/인터페이스 구현
