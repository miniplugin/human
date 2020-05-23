## SQL활용 (v7.0.0)
 
---

- [학습목차](https://github.com/miniplugin/human)
- 능력단위 요소: LM2001020413_16v3

---

### 학습목표(아래)
- 관계형 데이터베이스에서 SQL을 사용하여 목적에 적합한 데이터를 정의하고, 조작하며, 제어할 수 있다.

### 핵심키워드(아래)
- 테이블(Table), 기본키(Primary Key), 외래키(Foreign Key), 무결성 제약 조건(Integrity Constraint), 참조
무결성(Referential Integrity), 트랜잭션(Transaction), DDL(Data Definition Language), DML(Data Manipulation
Language), DCL(Data Control Language), 인덱스(Index)

### 기본 SQL 작성하기(아래)
- DDL활용: 교사가 제시한 스프링 웹프로젝트에서 사용되는 스키마생성 DDL 파일 검토.
- DCL활용: 교사가 제시한 스프링 웹프로젝트에서 사용되는 스키마변경 DCL 파일 검토.
- DML활용: 교사가 제시한 스프링 웹프로젝트에서 사용되는 mybatis 쿼리매퍼 DML 파일 검토.

### 고급 SQL 작성하기(아래)
- 교사가 제시한 인덱스 활용.
- 교사가 제시한 뷰테이블 활용.
- 교사가 제시한 다중테이블 검색(테이블조인) 활용.

### 참고자료 출처(아래)
- 개발PC에 오라클 11g EX 교육용Free: https://www.oracle.com/database/technologies/oracle-database-software-downloads.html
- 개발PC에 오라클 SQL Development 설치: https://www.oracle.com/tools/downloads/sqldev-v192-downloads.html (JDK포함버전으로)
- 오라클 설치 후 8080포트변경: Get Started With Oracle Database 11g Express Edition 웹 툴에서 사용하는 포트와 톰캣서버가 충돌 때문에.(아래)
- SQL Development 에서 아래 2줄 명령어 실행 후 OK
- SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;
- EXEC DBMS_XDB.SETHTTPPORT(9000);
-(참고) 오라클 DB의 문자설정 확인: select * from v$nls_parameters where parameter like '%CHARACTERSET%';
- 실습에 필요한 오라클 구글드라이브링크: 
- 실습에 필요한 SQL디벨러퍼(Java포함버전)구글드라이브링크:  
- 학습모듈: https://ncs.go.kr/unity/th03/ncsSearchMain.do 20.정보통신 > 01.정보기술 > 02.정보기술개발 > 04.DB엔지니어링