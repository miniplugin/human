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
- DDL활용: 아래 스프링 웹프로젝트에서 사용되는 Mysql 스키마 4개의 테이블 DDL문을 오라클용으로 변경 확인.

```
--
-- 첨부파일 테이블 구조
--
CREATE TABLE `tbl_attach` (
  `full_name` varchar(150) NOT NULL,
  `bno` int(11) NOT NULL,
  `regdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`full_name`),
  KEY `fk_board_attach` (`bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- 게시판 테이블 구조 
--
CREATE TABLE `tbl_board` (
  `bno` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text,
  `writer` varchar(50) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `view_count` int(11) DEFAULT '0',
  `reply_count` int(11) DEFAULT '0',
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
--
-- 회원가입 테이블 구조
--
CREATE TABLE `tbl_member` (
  `user_id` varchar(50) NOT NULL,
  `user_pw` varchar(255) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `level` varchar(50) NOT NULL DEFAULT 'ROLE_USER',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- 댓글 테이블 구조
--
CREATE TABLE `tbl_reply` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `bno` int(11) NOT NULL DEFAULT '0',
  `replytext` varchar(1000) NOT NULL,
  `replyer` varchar(50) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rno`),
  KEY `fk_board` (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
--
-- 첨부파일 테이블의 제약사항 
--
ALTER TABLE `tbl_attach`
  ADD CONSTRAINT `fk_board_attach` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`);
--
-- 댓글 테이블의 제약사항
--
ALTER TABLE `tbl_reply`
  ADD CONSTRAINT `fk_board` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`);
COMMIT;
```
- Mysql용 테이블 구조 및 제약조건 확인 명령: DESC 테이블명,SELECT * FROM information_schema.table_constraints;
- 오라클용 테이블 구조 및 제약조건 확인 명령: SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME='테이블명' 

- DML활용: 아래 스프링 웹프로젝트에서 사용되는Mysql용 mybatis 쿼리매퍼 Insert구문을 오라클용으로 변경 및 오라클용으로 더미데이터 입력 확인.

```
<!-- 게시판 입력 쿼리 -->
<insert id="create">
	 insert into tbl_board (title, content, writer) 
	 values(#{title},#{content}, #{writer})
 </insert>
INSERT INTO `tbl_board` (`bno`, `title`, `content`, `writer`, `regdate`, `update_date`, `view_count`, `reply_count`) VALUES
(1, '새로운 글입니다.', '입력 테스트 ', 'user00', '2019-10-10 03:20:01', '2019-10-10 03:20:01', 0, 0);
<!-- 댓글 입력 쿼리 -->
<insert id="insertReply">
	insert into tbl_reply (bno, replytext, replyer)
	values (#{bno},#{replytext},#{replyer})
</insert>
INSERT INTO `tbl_reply` (`rno`, `bno`, `replytext`, `replyer`, `regdate`, `update_date`) VALUES
(1, 1, '1:댓글 입력', 'user02', '2019-10-17 02:39:01', '2019-10-18 01:52:51');
```

- DCL활용: 위 입력 값으로 Mysql 트랜잭션 자동커밋 과 오라클 트랜잭션 수동커밋  내용 확인.(트랜잭션: 커밋과 커밋사이)

```
--
-- 현재 트랜잭션 수준 파악 REPETABLE READ, READ COMMITTED = 최종 커밋된 결과만 조회가 가능하다. 명령어 commit, rollback 
-- Mysql 워크벤치에서는 자동commit이기 때문에 위 insert문 자료가 최종 결과물로 인식 합니다.
-- 오라클 SQL디벨러퍼에서는 commit 명령어 사용하기 전까지 위 insert문 자료가 없는것이 최종 결과물로 인식 합니다.
-- 롤백 명령은 최종 COMMIT 명령의 결과를 없던 것으로 되돌 립니다.  
--
COMMIT;
ROLLBACK;
```

### 고급 SQL 작성하기(아래)
- 교사가 제시한 인덱스 활용.
- 교사가 제시한 뷰테이블 활용.
- 교사가 제시한 다중테이블 검색(테이블조인) 활용.

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