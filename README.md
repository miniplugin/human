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
- DDL활용: 아래 스프링 웹프로젝트에서 사용되는 스키마에서 4개의 테이블 DDL문을 오라클용으로 변경 확인.

```
--
-- 게시판 테이블 구조
--
CREATE TABLE tbl_board (
  bno NUMBER(11) NOT NULL,
  title varchar(200) NOT NULL,
  content CLOB,
  writer varchar(50) NOT NULL,
  regdate timestamp DEFAULT SYSDATE NOT NULL,
  update_date DATE DEFAULT SYSDATE NOT NULL,
  view_count NUMBER(11) DEFAULT 0,
  reply_count NUMBER(11) DEFAULT 0,
  CONSTRAINT BOARD_PK PRIMARY KEY (bno)
);
--
-- 첨부파일 테이블 구조 
--
CREATE TABLE tbl_attach (
  full_name varchar(150) NOT NULL,
  bno number(11) NOT NULL,
  regdate DATE DEFAULT SYSDATE,
  CONSTRAINT ATTACH_PK PRIMARY KEY (full_name),
  CONSTRAINT fk_board_attach FOREIGN KEY(bno)
         REFERENCES tbl_board(bno) ON DELETE CASCADE
);
--
-- 회원가입 테이블 구조
--
CREATE TABLE tbl_member (
  user_id varchar(50) NOT NULL,
  user_pw varchar(255) NOT NULL,
  user_name varchar(50) NOT NULL,
  email varchar(100) DEFAULT NULL,
  point NUMBER(11) DEFAULT 0 NOT NULL,
  enabled NUMBER(1) DEFAULT 0 NOT NULL,
  levels varchar(50) DEFAULT 'ROLE_USER' NOT NULL,
  reg_date DATE DEFAULT SYSDATE NOT NULL,
  update_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT MEMBER_PK PRIMARY KEY (user_id)
);
--
-- 댓글 테이블 구조
--
CREATE TABLE tbl_reply (
  rno NUMBER(11) NOT NULL,
  bno NUMBER(11) DEFAULT 0 NOT NULL ,
  replytext varchar(1000) NOT NULL,
  replyer varchar(50) NOT NULL,
  reg_date DATE DEFAULT SYSDATE NOT NULL,
  update_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT REPLY_PK PRIMARY KEY (rno),
  CONSTRAINT fk_board FOREIGN KEY(bno)
         REFERENCES tbl_board(bno) ON DELETE CASCADE
);
--
-- 오라클 전용 시퀸스 방식 게시판 시퀸스
--
CREATE SEQUENCE BNO_SEQ
  START WITH 101
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
--
-- 오라클 전용 시퀸스 방식 댓글 시퀸스
--
CREATE SEQUENCE RNO_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
```
- Mysql용 테이블 구조 및 제약조건 확인 명령: DESC 테이블명,SELECT * FROM information_schema.table_constraints;
- 오라클용 테이블 구조 및 제약조건 확인 명령: SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME='테이블명(대문자)' 

- 제약조건 끄고 tbl_board테이블 비우기(truncate) + 프로시저로 더미데이터 입력하기

```
-- Mysql 일때 외래키 제약조건 사용하지 않기 (아래):  SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;
truncate TABLE tbl_board; #AI 데이터까지 모두 지우기
-- Mysql 더미 데이터 입력 프로시저
CREATE PROCEDURE dummy_insert()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i <= 100 DO
		INSERT INTO tbl_board (bno, title, content, writer) VALUES
		(i, '수정된 글입니다.', '수정 테스트', 'user00');
		SET i = i + 1;
	END WHILE;
    -- 실행 CALL dummy_insert;
END
```

```
-- 오라클 일때 외래키 제약조건 사용하지 않기(아래)
ALTER TABLE TBL_BOARD DISABLE PRIMARY KEY CASCADE;
truncate TABLE tbl_board;
-- 오라클 더미 데이터 입력 프로시저
CREATE OR REPLACE PROCEDURE DUMMY_INSERT AS 
BEGIN
  FOR i IN 1..100 LOOP
  INSERT INTO tbl_board (bno, title, content, writer) VALUES (i,'게시물','게시물내용','관리자');
  END LOOP; -- 실행 CALL dummy_insert();
END DUMMY_INSERT;
```

- DML활용: 아래 스프링 웹프로젝트에서 사용되는Mysql용 mybatis 쿼리매퍼 Insert구문을 오라클용으로 변경 및 오라클용으로 더미데이터 입력 확인.

```
<!-- Mysql용 게시판 입력 쿼리 -->
<insert id="create">
	 insert into tbl_board (title, content, writer) 
	 values(#{title},#{content}, #{writer})
 </insert>
INSERT INTO `tbl_board` (`bno`, `title`, `content`, `writer`, `regdate`, `update_date`, `view_count`, `reply_count`) VALUES
(1, '새로운 글입니다.', '입력 테스트 ', 'user00', '2019-10-10 03:20:01', '2019-10-10 03:20:01', 0, 0);
<!-- Mysql용 댓글 입력 쿼리 -->
<insert id="insertReply">
	insert into tbl_reply (bno, replytext, replyer)
	values (#{bno},#{replytext},#{replyer})
</insert>
INSERT INTO `tbl_reply` (`rno`, `bno`, `replytext`, `replyer`, `regdate`, `update_date`) VALUES
(1, 1, '1:댓글 입력', 'user02', '2019-10-17 02:39:01', '2019-10-18 01:52:51');
```

```
<!-- 오라클용 추가 ibatis
	<selectKey keyProperty="id" resultClass="int" order="BEFORE"> 
	오라클용 추가 Mybatis
	<selectKey keyProperty="bno" resultType="int" order="BEFORE">
	SELECT BNO_SEQ.nextval From DUAL
-->
<insert id="create">
	<selectKey keyProperty="bno" resultType="int" order="BEFORE">
        select BNO_SEQ.nextval from dual  
   </selectKey>
 insert into tbl_board (bno, title, content, writer) 
 values(#{bno},#{title},#{content}, #{writer})
 </insert>
 쿼리: INSERT INTO tbl_board VALUES (1, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
 <!-- 
	오라클용 추가 ibatis
	<selectKey keyProperty="id" resultClass="int" order="BEFORE"> 
	오라클용 추가 Mybatis
	<selectKey keyProperty="rno" resultType="int" order="BEFORE">
	SELECT RNO_SEQ.nextval From DUAL
	</selectKey>
-->
<insert id="insertReply">
    <selectKey keyProperty="rno" resultType="int" order="BEFORE">
		SELECT RNO_SEQ.nextval From DUAL
	</selectKey>
	insert into tbl_reply (rno, bno, replytext, replyer)
	values (#{rno},#{bno},#{replytext},#{replyer})
</insert>
INSERT INTO tbl_reply VALUES (1, 100, '1:댓글을 수정   MOD', 'user02', SYSDATE, SYSDATE);
INSERT INTO tbl_reply VALUES (2, 100, '2:댓글을 수정   MOD', 'user02', SYSDATE, SYSDATE);
INSERT INTO tbl_reply VALUES (3, 99, '2:댓글을 수정   MOD', 'user02', SYSDATE, SYSDATE);
```

- DCL활용: 위 입력 값으로 Mysql 트랜잭션 자동커밋 과 오라클 트랜잭션 수동커밋  내용 확인.(트랜잭션: 커밋과 커밋사이)

```
--
-- 현재 트랜잭션 수준 파악 REPETABLE READ, READ COMMITTED = 최종 커밋된 결과만 조회가 가능하다. 명령어 commit, rollback 
-- Mysql 워크벤치에서는 자동commit이기 때문에 위 insert문 자료가 최종 결과물로 인식 합니다.
-- 오라클 SQL디벨러퍼에서는 commit 명령어 사용하기 전까지 위 insert문 자료가 없는것이 최종 결과물로 인식 합니다.(주의)
-- 롤백 명령은 최종 COMMIT 명령의 결과를 없던 것으로 되돌 립니다.  
--
INSERT INTO tbl_board VALUES (256, '256번글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (257, '2571번글입니다.', '수정 테스트2 ', 'user00', SYSDATE, SYSDATE, 0, 0);
SAVEPOINT S1;
INSERT INTO tbl_board VALUES (258, '258번글입니다.. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
ROLLBACK TO S1;
SELECT * FROM tbl_board ORDER BY bno DESC; 
COMMIT;
ROLLBACK;
```

### 고급 SQL 작성하기(아래)
- 실습자료 오라클용 ERD 파일 다운로드: [download this](git_img/oracle_xe.dmd) 
- 실습자료 오라클용 sql 더미 데이터 다운로드: [download this](git_img/edu_oracle.sql)
- SQL DEVELOPER 에서 위에서 생성한 오라클용 테이블의 인덱스 확인.

- 게시물별 댓글 갯수를 표시하는 뷰테이블 생성.

```
CREATE VIEW REPLY_CNT_VIEW
AS SELECT BOD.bno, BOD.title, COUNT(REP.bno) AS CNT 
FROM tbl_board BOD
INNER JOIN tbl_reply REP ON REP.bno = BOD.bno
GROUP BY BOD.bno, BOD.title
ORDER BY BOD.bno;
```

- 게시물별 첨부파일 갯수를 검색하는 쿼리를 테이블 조인을 이용해서 작성.

```
SELECT BOD.bno, BOD.title, COUNT(ATTA.bno) AS CNT 
FROM tbl_board BOD
INNER JOIN tbl_attach ATTA ON ATTA.bno = BOD.bno
GROUP BY BOD.bno, BOD.title
ORDER BY BOD.bno DESC;
```

### 참고자료 출처(아래)
- 개발PC에 오라클 11g EX 교육용Free: https://www.oracle.com/database/technologies/oracle-database-software-downloads.html
- 개발PC에 오라클 SQL Development 설치: https://www.oracle.com/tools/downloads/sqldev-v192-downloads.html (JDK포함버전으로)
- 오라클 설치 후 8080포트변경: Get Started With Oracle Database 11g Express Edition 웹 툴에서 사용하는 포트와 톰캣서버가 충돌 때문에.(아래의 처리 실행)
- SQL Development 에서 아래 2줄 명령어 실행 후 OK
- SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;
- EXEC DBMS_XDB.SETHTTPPORT(9000);
- (참고) 오라클 DB의 문자설정 확인: select * from v$nls_parameters where parameter like '%CHARACTERSET%';
- 실습에 필요한 오라클 XE서버 구글드라이브링크: https://drive.google.com/file/d/1L2XZuH-j47PaoscLNn16kqjPxFYmhi_F/view?usp=sharing
- 실습에 필요한 SQL디벨러퍼(Java포함버전)구글드라이브링크:  https://drive.google.com/file/d/1n7jy85OeI06ipmDjKWFYxaYpTJY16lj-/view?usp=sharing
- 학습모듈: https://ncs.go.kr/unity/th03/ncsSearchMain.do 20.정보통신 > 01.정보기술 > 02.정보기술개발 > 04.DB엔지니어링