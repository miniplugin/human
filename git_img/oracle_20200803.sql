--------------------------------------------------------
--  파일이 생성됨 - 화요일-8월-04-2020   
--------------------------------------------------------
DROP SEQUENCE "XE"."SEQ_BNO";
DROP SEQUENCE "XE"."SEQ_RNO";
DROP TABLE "XE"."TBL_ATTACH" cascade constraints;
DROP TABLE "XE"."TBL_BOARD" cascade constraints;
DROP TABLE "XE"."TBL_BOARD_TYPE" cascade constraints;
DROP TABLE "XE"."TBL_MEMBER" cascade constraints;
DROP TABLE "XE"."TBL_REPLY" cascade constraints;
DROP VIEW "XE"."VIEW_REPLY_CNT";
DROP PROCEDURE "XE"."SP_DUMMY_INSERT";
DROP PROCEDURE "XE"."SP_MYPAGE";
DROP FUNCTION "XE"."FN_REPLY_CNT";
--------------------------------------------------------
--  DDL for Sequence SEQ_BNO
--------------------------------------------------------

   CREATE SEQUENCE  "XE"."SEQ_BNO"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RNO
--------------------------------------------------------

   CREATE SEQUENCE  "XE"."SEQ_RNO"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 22 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table TBL_ATTACH
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_ATTACH" 
   (	"FULL_NAME" VARCHAR2(150 BYTE), 
	"BNO" NUMBER(11,0), 
	"REGDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TBL_BOARD
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_BOARD" 
   (	"BNO" NUMBER(11,0), 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" CLOB, 
	"WRITER" VARCHAR2(50 BYTE), 
	"REGDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"UPDATE_DATE" DATE DEFAULT sysdate, 
	"VIEW_COUNT" NUMBER(11,0) DEFAULT 0, 
	"REPLY_COUNT" NUMBER(11,0) DEFAULT 0, 
	"BOD_TYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "XE"."TBL_BOARD"."BOD_TYPE" IS '게시판타입';
--------------------------------------------------------
--  DDL for Table TBL_BOARD_TYPE
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_BOARD_TYPE" 
   (	"BOD_TYPE" VARCHAR2(20 BYTE), 
	"BOD_SUN" NUMBER(11,0), 
	"BOD_NAME" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TBL_MEMBER
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_MEMBER" 
   (	"USER_ID" VARCHAR2(50 BYTE), 
	"USER_PW" VARCHAR2(255 BYTE), 
	"USER_NAME" VARCHAR2(50 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE) DEFAULT NULL, 
	"POINT" NUMBER(11,0) DEFAULT 0, 
	"ENABLED" NUMBER(1,0) DEFAULT 0, 
	"LEVELS" VARCHAR2(50 BYTE) DEFAULT 'ROLE_USER', 
	"REG_DATE" DATE DEFAULT SYSDATE, 
	"UPDATE_DATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TBL_REPLY
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_REPLY" 
   (	"RNO" NUMBER(11,0), 
	"BNO" NUMBER(11,0) DEFAULT 0, 
	"REPLYTEXT" VARCHAR2(1000 BYTE), 
	"REPLYER" VARCHAR2(50 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"UPDATE_DATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View VIEW_REPLY_CNT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "XE"."VIEW_REPLY_CNT" ("BNO", "TITLE", "REPLYTEXT", "CNT") AS 
  SELECT 
    -- 게시물중 댓글이 존재하는 게시물 리스트 출력
    BOD.BNO, BOD.TITLE, REP.replytext, COUNT(REP.BNO) AS CNT
FROM 
    TBL_BOARD BOD
    INNER JOIN TBL_REPLY REP ON BOD.BNO = REP.BNO
GROUP BY BOD.BNO, BOD.TITLE, REP.replytext
ORDER BY BOD.BNO
;
REM INSERTING into XE.TBL_ATTACH
SET DEFINE OFF;
Insert into XE.TBL_ATTACH (FULL_NAME,BNO,REGDATE) values ('ABC.JPG',1,to_date('20/07/29','RR/MM/DD'));
Insert into XE.TBL_ATTACH (FULL_NAME,BNO,REGDATE) values ('0252ec8b-f135-47ab-912e-b3bb16a1b97d.jpg',99,to_date('20/07/31','RR/MM/DD'));
Insert into XE.TBL_ATTACH (FULL_NAME,BNO,REGDATE) values ('67b61df5-d7f7-4913-9c8d-05677aaadc02.jpg',97,to_date('20/07/31','RR/MM/DD'));
REM INSERTING into XE.TBL_BOARD
SET DEFINE OFF;
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (1,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),1,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (2,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (3,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (4,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (5,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (6,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (7,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (8,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (9,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (10,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (11,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (12,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (13,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (14,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (15,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (16,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (17,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (18,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (19,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (20,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (21,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (22,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (23,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (24,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (25,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (26,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (27,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (28,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (29,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (30,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),1,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (31,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (32,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (33,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (34,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (35,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (36,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (37,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (38,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (39,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (40,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (41,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (42,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (43,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (44,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (45,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (46,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (47,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (48,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (49,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (50,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),3,0,'notice');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (51,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (52,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (53,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (54,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (55,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (56,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (57,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (58,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (59,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (60,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),1,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (61,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (62,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (63,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (64,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (65,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (66,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (67,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (68,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (69,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (70,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (71,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (72,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (73,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (74,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (75,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (76,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (77,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (78,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (79,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (80,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (81,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (82,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (83,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (84,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (85,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (86,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (87,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (88,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (89,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (90,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (91,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (92,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (93,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (94,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (95,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (96,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (97,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/31','RR/MM/DD'),1,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (98,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/30','RR/MM/DD'),0,0,'gallery');
Insert into XE.TBL_BOARD (BNO,TITLE,WRITER,REGDATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT,BOD_TYPE) values (99,'게시물제목','관리자',to_timestamp('20/07/30 09:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),to_date('20/07/31','RR/MM/DD'),5,0,'gallery');
REM INSERTING into XE.TBL_BOARD_TYPE
SET DEFINE OFF;
Insert into XE.TBL_BOARD_TYPE (BOD_TYPE,BOD_SUN,BOD_NAME) values ('notice',1,'공지사항');
Insert into XE.TBL_BOARD_TYPE (BOD_TYPE,BOD_SUN,BOD_NAME) values ('gallery',2,'겔러리');
REM INSERTING into XE.TBL_MEMBER
SET DEFINE OFF;
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('admin','$2a$10$62oNpBjuKajlzZQdv6QbZOUIuJfa.gizJl9eLsgqIkYnhhLx31r2W','김일국','test@test.com',0,1,'ROLE_ADMIN',to_date('20/07/29','RR/MM/DD'),to_date('20/07/29','RR/MM/DD'));
REM INSERTING into XE.TBL_REPLY
SET DEFINE OFF;
Insert into XE.TBL_REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATE_DATE) values (1,1,'댓글내용','작성자',to_date('20/07/29','RR/MM/DD'),to_date('20/07/29','RR/MM/DD'));
REM INSERTING into XE.VIEW_REPLY_CNT
SET DEFINE OFF;
Insert into XE.VIEW_REPLY_CNT (BNO,TITLE,REPLYTEXT,CNT) values (1,'게시물제목','댓글내용',1);
--------------------------------------------------------
--  DDL for Index ATTACH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."ATTACH_PK" ON "XE"."TBL_ATTACH" ("FULL_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."BOARD_PK" ON "XE"."TBL_BOARD" ("BNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."MEMBER_PK" ON "XE"."TBL_MEMBER" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."REPLY_PK" ON "XE"."TBL_REPLY" ("RNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_BOARD_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_BOARD_TYPE_PK" ON "XE"."TBL_BOARD_TYPE" ("BOD_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure SP_DUMMY_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "XE"."SP_DUMMY_INSERT" AS 
BEGIN
  -- 1 부터 100 까지 게시물 반복(LOOP)등록하는 프로시저
  -- Mysql의 AI 역할을 SEQ_BNO.nextval
  FOR i IN 1..100 LOOP
        INSERT INTO TBL_BOARD(bno, title, content, writer) VALUES(SEQ_BNO.nextval, '게시물제목', '게시물내용', '관리자');
      END LOOP;
      -- 실행은 다음처럼 call sp_dummy_insert();
      COMMIT;
END SP_DUMMY_INSERT;

/
--------------------------------------------------------
--  DDL for Procedure SP_MYPAGE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "XE"."SP_MYPAGE" (
 P_USER_ID IN VARCHAR2,
 P_RESULT OUT SYS_REFCURSOR
) AS 
BEGIN
-- 매개변수로 회원아이디를 PARAMETER로 받아서 SELECT조건에 회원아이디와 일치하는 정보출력
-- 출력변수 CURSOR(테이블=표)를 사용.{ 회원아이디, 회원암호, 회원이름,... }
  OPEN P_RESULT FOR
    SELECT * FROM tbl_member WHERE user_id = P_USER_ID;
END SP_MYPAGE;

/
--------------------------------------------------------
--  DDL for Function FN_REPLY_CNT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "XE"."FN_REPLY_CNT" 
(
  P_BNO IN NUMBER 
) RETURN NUMBER AS
-- 게시물에 대한 댓글 카운트 구하기
-- 매개변수 게시물번호 P_BNO 받아서 출력은 숫자로 표시
V_REPLY_CNT number:=0;
-- 함수 내부에서 사용하는 변수 V_REPLY_CNT 생성: 초기값은 0;
BEGIN
  SELECT COUNT(*) INTO V_REPLY_CNT FROM TBL_REPLY WHERE bno = P_BNO;
  RETURN V_REPLY_CNT;
END FN_REPLY_CNT;

/
--------------------------------------------------------
--  Constraints for Table TBL_ATTACH
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_ATTACH" ADD CONSTRAINT "ATTACH_PK" PRIMARY KEY ("FULL_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "XE"."TBL_ATTACH" MODIFY ("BNO" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_ATTACH" MODIFY ("FULL_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_BOARD
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_BOARD" MODIFY ("BOD_TYPE" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_BOARD" ADD CONSTRAINT "BOARD_PK" PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "XE"."TBL_BOARD" MODIFY ("UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_BOARD" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_BOARD" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_BOARD" MODIFY ("BNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_BOARD_TYPE
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_BOARD_TYPE" ADD CONSTRAINT "TBL_BOARD_TYPE_PK" PRIMARY KEY ("BOD_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "XE"."TBL_BOARD_TYPE" MODIFY ("BOD_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_MEMBER
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "XE"."TBL_MEMBER" MODIFY ("UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_MEMBER" MODIFY ("REG_DATE" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_MEMBER" MODIFY ("LEVELS" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_MEMBER" MODIFY ("ENABLED" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_MEMBER" MODIFY ("POINT" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_MEMBER" MODIFY ("USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_MEMBER" MODIFY ("USER_PW" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_MEMBER" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_REPLY
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_REPLY" ADD CONSTRAINT "REPLY_PK" PRIMARY KEY ("RNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "XE"."TBL_REPLY" MODIFY ("UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_REPLY" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_REPLY" MODIFY ("REPLYER" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_REPLY" MODIFY ("REPLYTEXT" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_REPLY" MODIFY ("BNO" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_REPLY" MODIFY ("RNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TBL_ATTACH
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_ATTACH" ADD CONSTRAINT "FK_BOARD_ATTACH" FOREIGN KEY ("BNO")
	  REFERENCES "XE"."TBL_BOARD" ("BNO") ON DELETE CASCADE DISABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_BOARD
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_BOARD" ADD CONSTRAINT "TBL_BOARD_TBL_BOARD_TYPE_FK" FOREIGN KEY ("BOD_TYPE")
	  REFERENCES "XE"."TBL_BOARD_TYPE" ("BOD_TYPE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_REPLY
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_REPLY" ADD CONSTRAINT "FK_BOARD" FOREIGN KEY ("BNO")
	  REFERENCES "XE"."TBL_BOARD" ("BNO") ON DELETE CASCADE DISABLE;
