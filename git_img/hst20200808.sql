-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: hst
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comtecopseq`
--

DROP TABLE IF EXISTS `comtecopseq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comtecopseq` (
  `TABLE_NAME` varchar(20) NOT NULL,
  `NEXT_ID` decimal(30,0) DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`),
  UNIQUE KEY `COMTECOPSEQ_PK` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comtecopseq`
--

LOCK TABLES `comtecopseq` WRITE;
/*!40000 ALTER TABLE `comtecopseq` DISABLE KEYS */;
INSERT INTO `comtecopseq` VALUES ('USRCNFRM_ID',12);
/*!40000 ALTER TABLE `comtecopseq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `comvnusermaster`
--

DROP TABLE IF EXISTS `comvnusermaster`;
/*!50001 DROP VIEW IF EXISTS `comvnusermaster`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `comvnusermaster` AS SELECT 
 1 AS `ESNTL_ID`,
 1 AS `USER_ID`,
 1 AS `PASSWORD`,
 1 AS `USER_NM`,
 1 AS `USER_ZIP`,
 1 AS `USER_ADRES`,
 1 AS `USER_EMAIL`,
 1 AS `GROUP_ID`,
 1 AS `USER_SE`,
 1 AS `ORGNZT_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ids`
--

DROP TABLE IF EXISTS `ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ids` (
  `TABLE_NAME` varchar(20) NOT NULL,
  `NEXT_ID` decimal(30,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids`
--

LOCK TABLES `ids` WRITE;
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
INSERT INTO `ids` VALUES ('BBS_ID',1),('FILE_ID',1),('SAMPLE',1),('SCHDUL_ID',1),('TMPLAT_ID',1);
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettccmmnclcode`
--

DROP TABLE IF EXISTS `lettccmmnclcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettccmmnclcode` (
  `CL_CODE` char(3) NOT NULL,
  `CL_CODE_NM` varchar(60) DEFAULT NULL,
  `CL_CODE_DC` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettccmmnclcode`
--

LOCK TABLES `lettccmmnclcode` WRITE;
/*!40000 ALTER TABLE `lettccmmnclcode` DISABLE KEYS */;
INSERT INTO `lettccmmnclcode` VALUES ('LET','전자정부 프레임워크 경량환경 템플릿','전자정부 프레임워크 경량환경 템플릿','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM');
/*!40000 ALTER TABLE `lettccmmnclcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettccmmncode`
--

DROP TABLE IF EXISTS `lettccmmncode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettccmmncode` (
  `CODE_ID` varchar(6) NOT NULL,
  `CODE_ID_NM` varchar(60) DEFAULT NULL,
  `CODE_ID_DC` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `CL_CODE` char(3) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`),
  KEY `R_179` (`CL_CODE`),
  CONSTRAINT `LETTCCMMNCODE_ibfk_1` FOREIGN KEY (`CL_CODE`) REFERENCES `lettccmmnclcode` (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettccmmncode`
--

LOCK TABLES `lettccmmncode` WRITE;
/*!40000 ALTER TABLE `lettccmmncode` DISABLE KEYS */;
INSERT INTO `lettccmmncode` VALUES ('COM001','등록구분','게시판, 커뮤니티, 동호회 등록구분코드','Y','LET','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM003','업무구분','업무구분코드','Y','LET','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM004','게시판유형','게시판유형구분코드','Y','LET','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM005','템플릿유형','템플릿유형구분코드','Y','LET','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM009','게시판속성','게시판 속성','Y','LET','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM013','회원상태','회원 가입 신청/승인/삭제를 위한 상태 구분','Y','LET','2020-08-08 17:57:23','SYSTEM','2020-08-08 17:57:23','SYSTEM'),('COM019','일정중요도','일정중요도 낮음/보통/높음 상태구분','Y','LET','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM030','일정구분','일정구분 코드','Y','LET','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM031','반복구분','일정 반복구분 코드','Y','LET','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM');
/*!40000 ALTER TABLE `lettccmmncode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettccmmndetailcode`
--

DROP TABLE IF EXISTS `lettccmmndetailcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettccmmndetailcode` (
  `CODE_ID` varchar(6) NOT NULL,
  `CODE` varchar(15) NOT NULL,
  `CODE_NM` varchar(60) DEFAULT NULL,
  `CODE_DC` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`,`CODE`),
  CONSTRAINT `LETTCCMMNDETAILCODE_ibfk_1` FOREIGN KEY (`CODE_ID`) REFERENCES `lettccmmncode` (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettccmmndetailcode`
--

LOCK TABLES `lettccmmndetailcode` WRITE;
/*!40000 ALTER TABLE `lettccmmndetailcode` DISABLE KEYS */;
INSERT INTO `lettccmmndetailcode` VALUES ('COM001','REGC01','단일 게시판 이용등록','단일 게시판 이용등록','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM001','REGC07','게시판사용자등록','게시판사용자등록','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM003','BBS','게시판','게시판','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM004','BBST01','일반게시판','일반게시판','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM004','BBST02','익명게시판','익명게시판','N','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM004','BBST03','공지게시판','공지게시판','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM005','TMPT01','게시판템플릿','게시판템플릿','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM009','BBSA01','유효게시판','유효게시판','N','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM009','BBSA02','갤러리','갤러리','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM009','BBSA03','일반게시판','일반게시판','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM013','A','회원 가입 신청 상태','회원 가입 신청 상태','Y','2020-08-08 17:57:23','SYSTEM','2020-08-08 17:57:23','SYSTEM'),('COM013','D','회원 가입 삭제 상태','회원 가입 삭제 상태','Y','2020-08-08 17:57:23','SYSTEM','2020-08-08 17:57:23','SYSTEM'),('COM013','P','회원 가입 승인 상태','회원 가입 승인 상태','Y','2020-08-08 17:57:23','SYSTEM','2020-08-08 17:57:23','SYSTEM'),('COM019','A','높음','높음','Y','2011-08-02 21:02:00','SYSTEM','2011-08-02 21:02:00','SYSTEM'),('COM019','B','보통','보통','Y','2011-08-02 21:02:00','SYSTEM','2011-08-02 21:02:00','SYSTEM'),('COM019','C','낮음','낮음','Y','2011-08-02 21:02:00','SYSTEM','2011-08-02 21:02:00','SYSTEM'),('COM030','1','회의','회의','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM030','2','세미나','세미나','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM030','3','강의','강의','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM030','4','교육','교육','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM030','5','기타','기타','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM031','1','당일','당일','Y','2011-08-02 21:01:59','SYSTEM','2011-08-02 21:01:59','SYSTEM'),('COM031','2','반복','반복','Y','2011-08-02 21:02:00','SYSTEM','2011-08-02 21:02:00','SYSTEM'),('COM031','3','연속','연속','Y','2011-08-02 21:02:00','SYSTEM','2011-08-02 21:02:00','SYSTEM'),('COM031','4','요일반복','요일반복','Y','2011-08-02 21:02:00','SYSTEM','2011-08-02 21:02:00','SYSTEM');
/*!40000 ALTER TABLE `lettccmmndetailcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnauthorgroupinfo`
--

DROP TABLE IF EXISTS `lettnauthorgroupinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnauthorgroupinfo` (
  `GROUP_ID` char(20) NOT NULL DEFAULT '',
  `GROUP_NM` varchar(60) NOT NULL,
  `GROUP_CREAT_DE` char(20) NOT NULL,
  `GROUP_DC` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnauthorgroupinfo`
--

LOCK TABLES `lettnauthorgroupinfo` WRITE;
/*!40000 ALTER TABLE `lettnauthorgroupinfo` DISABLE KEYS */;
INSERT INTO `lettnauthorgroupinfo` VALUES ('GROUP_00000000000000','기본 그룹입니다','2011-08-02 21:01:59','기본 그룹');
/*!40000 ALTER TABLE `lettnauthorgroupinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnbbs`
--

DROP TABLE IF EXISTS `lettnbbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnbbs` (
  `NTT_ID` decimal(20,0) NOT NULL,
  `BBS_ID` char(20) NOT NULL,
  `NTT_NO` decimal(20,0) DEFAULT NULL,
  `NTT_SJ` varchar(2000) DEFAULT NULL,
  `NTT_CN` mediumtext,
  `ANSWER_AT` char(1) DEFAULT NULL,
  `PARNTSCTT_NO` decimal(10,0) DEFAULT NULL,
  `ANSWER_LC` int(11) DEFAULT NULL,
  `SORT_ORDR` decimal(8,0) DEFAULT NULL,
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `NTCE_BGNDE` char(20) DEFAULT NULL,
  `NTCE_ENDDE` char(20) DEFAULT NULL,
  `NTCR_ID` varchar(20) DEFAULT NULL,
  `NTCR_NM` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NTT_ID`,`BBS_ID`),
  KEY `LETTNBBS_ibfk_1` (`BBS_ID`),
  CONSTRAINT `LETTNBBS_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `lettnbbsmaster` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnbbs`
--

LOCK TABLES `lettnbbs` WRITE;
/*!40000 ALTER TABLE `lettnbbs` DISABLE KEYS */;
INSERT INTO `lettnbbs` VALUES (1,'BBSMSTR_AAAAAAAAAAAA',1,'홈페이지 샘플공지1','홈페이지 샘플공지1','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2020-08-08 15:53:37','USRCNFRM_00000000000',NULL,NULL),(2,'BBSMSTR_AAAAAAAAAAAA',1,'홈페이지 샘플공지2','홈페이지 샘플공지2','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2020-08-08 15:53:37','USRCNFRM_00000000000',NULL,NULL),(3,'BBSMSTR_AAAAAAAAAAAA',1,'홈페이지 샘플공지3','홈페이지 샘플공지3','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2020-08-08 15:53:37','USRCNFRM_00000000000',NULL,NULL),(4,'BBSMSTR_AAAAAAAAAAAA',1,'홈페이지 샘플공지4','홈페이지 샘플공지4','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2020-08-08 15:53:37','USRCNFRM_00000000000',NULL,NULL),(5,'BBSMSTR_AAAAAAAAAAAA',1,'홈페이지 샘플공지5','홈페이지 샘플공지5','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2020-08-08 15:53:37','USRCNFRM_00000000000',NULL,NULL),(6,'BBSMSTR_BBBBBBBBBBBB',1,'홈페이지 샘플게시1','홈페이지 샘플게시1','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2020-08-08 15:53:37','USRCNFRM_00000000000',NULL,NULL),(7,'BBSMSTR_BBBBBBBBBBBB',1,'홈페이지 샘플게시2','홈페이지 샘플게시2','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2020-08-08 15:53:37','USRCNFRM_00000000000',NULL,NULL),(8,'BBSMSTR_BBBBBBBBBBBB',1,'홈페이지 샘플게시3','홈페이지 샘플게시3','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2020-08-08 15:53:37','USRCNFRM_00000000000',NULL,NULL),(9,'BBSMSTR_BBBBBBBBBBBB',1,'홈페이지 샘플게시4','홈페이지 샘플게시4','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2020-08-08 15:53:37','USRCNFRM_00000000000',NULL,NULL),(10,'BBSMSTR_BBBBBBBBBBBB',1,'홈페이지 샘플게시5','홈페이지 샘플게시5','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2020-08-08 15:53:37','USRCNFRM_00000000000',NULL,NULL);
/*!40000 ALTER TABLE `lettnbbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnbbsmaster`
--

DROP TABLE IF EXISTS `lettnbbsmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnbbsmaster` (
  `BBS_ID` char(20) NOT NULL,
  `BBS_NM` varchar(255) NOT NULL,
  `BBS_INTRCN` varchar(2400) DEFAULT NULL,
  `BBS_TY_CODE` char(6) NOT NULL,
  `BBS_ATTRB_CODE` char(6) NOT NULL,
  `REPLY_POSBL_AT` char(1) DEFAULT NULL,
  `FILE_ATCH_POSBL_AT` char(1) NOT NULL,
  `ATCH_POSBL_FILE_NUMBER` decimal(2,0) NOT NULL,
  `ATCH_POSBL_FILE_SIZE` decimal(8,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `TMPLAT_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnbbsmaster`
--

LOCK TABLES `lettnbbsmaster` WRITE;
/*!40000 ALTER TABLE `lettnbbsmaster` DISABLE KEYS */;
INSERT INTO `lettnbbsmaster` VALUES ('BBSMSTR_AAAAAAAAAAAA','공지사항','공지사항게시판','BBST03','BBSA03','Y','Y',2,5242880,'Y','TMPLAT_BOARD_DEFAULT','USRCNFRM_00000000000','2011-08-31 12:00:00','USRCNFRM_00000000000','2011-08-31 12:00:00'),('BBSMSTR_BBBBBBBBBBBB','갤러리','갤러리게시판','BBST01','BBSA02','Y','Y',2,5242880,'Y','TMPLAT_BOARD_DEFAULT','USRCNFRM_00000000000','2011-08-31 12:00:00','USRCNFRM_00000000000','2011-08-31 12:00:00'),('BBSMSTR_CCCCCCCCCCCC','자료실','자료실게시판','BBST01','BBSA03','Y','Y',2,5242880,'Y','TMPLAT_BOARD_DEFAULT','USRCNFRM_00000000000','2011-08-31 12:00:00','USRCNFRM_00000000000','2011-08-31 12:00:00');
/*!40000 ALTER TABLE `lettnbbsmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnbbsmasteroptn`
--

DROP TABLE IF EXISTS `lettnbbsmasteroptn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnbbsmasteroptn` (
  `BBS_ID` char(20) NOT NULL DEFAULT '',
  `ANSWER_AT` char(1) NOT NULL DEFAULT '',
  `STSFDG_AT` char(1) NOT NULL DEFAULT '',
  `FRST_REGIST_PNTTM` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL DEFAULT '',
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnbbsmasteroptn`
--

LOCK TABLES `lettnbbsmasteroptn` WRITE;
/*!40000 ALTER TABLE `lettnbbsmasteroptn` DISABLE KEYS */;
/*!40000 ALTER TABLE `lettnbbsmasteroptn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnbbsuse`
--

DROP TABLE IF EXISTS `lettnbbsuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnbbsuse` (
  `BBS_ID` char(20) NOT NULL,
  `TRGET_ID` char(20) NOT NULL DEFAULT '',
  `USE_AT` char(1) NOT NULL,
  `REGIST_SE_CODE` char(6) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`,`TRGET_ID`),
  CONSTRAINT `LETTNBBSUSE_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `lettnbbsmaster` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnbbsuse`
--

LOCK TABLES `lettnbbsuse` WRITE;
/*!40000 ALTER TABLE `lettnbbsuse` DISABLE KEYS */;
INSERT INTO `lettnbbsuse` VALUES ('BBSMSTR_AAAAAAAAAAAA','SYSTEM_DEFAULT_BOARD','Y','REGC01','2011-08-31 12:00:00','USRCNFRM_00000000000','2011-09-05 18:15:31',''),('BBSMSTR_BBBBBBBBBBBB','SYSTEM_DEFAULT_BOARD','Y','REGC01','2011-08-31 12:00:00','USRCNFRM_00000000000','2011-08-31 12:00:00','USRCNFRM_00000000000'),('BBSMSTR_CCCCCCCCCCCC','SYSTEM_DEFAULT_BOARD','Y','REGC01','2011-08-31 12:00:00','USRCNFRM_00000000000','2011-08-31 12:00:00','USRCNFRM_00000000000');
/*!40000 ALTER TABLE `lettnbbsuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnemplyrinfo`
--

DROP TABLE IF EXISTS `lettnemplyrinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnemplyrinfo` (
  `EMPLYR_ID` varchar(20) NOT NULL,
  `ORGNZT_ID` char(20) DEFAULT NULL,
  `USER_NM` varchar(60) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `EMPL_NO` varchar(20) DEFAULT NULL,
  `IHIDNUM` varchar(200) DEFAULT NULL,
  `SEXDSTN_CODE` char(1) DEFAULT NULL,
  `BRTHDY` char(20) DEFAULT NULL,
  `FXNUM` varchar(20) DEFAULT NULL,
  `HOUSE_ADRES` varchar(100) DEFAULT NULL,
  `PASSWORD_HINT` varchar(100) NOT NULL,
  `PASSWORD_CNSR` varchar(100) NOT NULL,
  `HOUSE_END_TELNO` varchar(4) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `ZIP` varchar(6) DEFAULT NULL,
  `OFFM_TELNO` varchar(20) DEFAULT NULL,
  `MBTLNUM` varchar(20) DEFAULT NULL,
  `EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `OFCPS_NM` varchar(60) DEFAULT NULL,
  `HOUSE_MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `GROUP_ID` char(20) DEFAULT NULL,
  `PSTINST_CODE` char(8) DEFAULT NULL,
  `EMPLYR_STTUS_CODE` varchar(15) NOT NULL,
  `ESNTL_ID` char(20) NOT NULL,
  `CRTFC_DN_VALUE` varchar(20) DEFAULT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  PRIMARY KEY (`EMPLYR_ID`),
  KEY `LETTNEMPLYRINFO_ibfk_2` (`GROUP_ID`),
  KEY `LETTNEMPLYRINFO_ibfk_1` (`ORGNZT_ID`),
  CONSTRAINT `LETTNEMPLYRINFO_ibfk_1` FOREIGN KEY (`ORGNZT_ID`) REFERENCES `lettnorgnztinfo` (`ORGNZT_ID`) ON DELETE CASCADE,
  CONSTRAINT `LETTNEMPLYRINFO_ibfk_2` FOREIGN KEY (`GROUP_ID`) REFERENCES `lettnauthorgroupinfo` (`GROUP_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnemplyrinfo`
--

LOCK TABLES `lettnemplyrinfo` WRITE;
/*!40000 ALTER TABLE `lettnemplyrinfo` DISABLE KEYS */;
INSERT INTO `lettnemplyrinfo` VALUES ('admin','ORGNZT_0000000000000','관리자','JfQ7FIatlaE5jj7rPYO8QBABX8yb7bNbQy4AKY1QIfc=','',NULL,'','','','관리자 주소','','','','','','','','','','','','GROUP_00000000000000','00000000','P','USRCNFRM_00000000000','','2011-08-02 21:01:59');
/*!40000 ALTER TABLE `lettnemplyrinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnentrprsmber`
--

DROP TABLE IF EXISTS `lettnentrprsmber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnentrprsmber` (
  `ENTRPRS_MBER_ID` varchar(20) NOT NULL DEFAULT '',
  `ENTRPRS_SE_CODE` char(15) DEFAULT NULL,
  `BIZRNO` varchar(10) DEFAULT NULL,
  `JURIRNO` varchar(13) DEFAULT NULL,
  `CMPNY_NM` varchar(60) NOT NULL,
  `CXFC` varchar(50) DEFAULT NULL,
  `ZIP` varchar(6) DEFAULT NULL,
  `ADRES` varchar(100) DEFAULT NULL,
  `ENTRPRS_MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `FXNUM` varchar(20) DEFAULT NULL,
  `INDUTY_CODE` char(15) DEFAULT NULL,
  `APPLCNT_NM` varchar(50) NOT NULL,
  `APPLCNT_IHIDNUM` varchar(200) DEFAULT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  `ENTRPRS_MBER_STTUS` varchar(15) DEFAULT NULL,
  `ENTRPRS_MBER_PASSWORD` varchar(200) NOT NULL,
  `ENTRPRS_MBER_PASSWORD_HINT` varchar(100) NOT NULL,
  `ENTRPRS_MBER_PASSWORD_CNSR` varchar(100) NOT NULL,
  `GROUP_ID` char(20) DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `ENTRPRS_END_TELNO` varchar(4) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `APPLCNT_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `ESNTL_ID` char(20) NOT NULL,
  PRIMARY KEY (`ENTRPRS_MBER_ID`),
  KEY `LETTNENTRPRSMBER_ibfk_1` (`GROUP_ID`),
  CONSTRAINT `LETTNENTRPRSMBER_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `lettnauthorgroupinfo` (`GROUP_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnentrprsmber`
--

LOCK TABLES `lettnentrprsmber` WRITE;
/*!40000 ALTER TABLE `lettnentrprsmber` DISABLE KEYS */;
/*!40000 ALTER TABLE `lettnentrprsmber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnfile`
--

DROP TABLE IF EXISTS `lettnfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnfile` (
  `ATCH_FILE_ID` char(20) NOT NULL,
  `CREAT_DT` datetime NOT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnfile`
--

LOCK TABLES `lettnfile` WRITE;
/*!40000 ALTER TABLE `lettnfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `lettnfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnfiledetail`
--

DROP TABLE IF EXISTS `lettnfiledetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnfiledetail` (
  `ATCH_FILE_ID` char(20) NOT NULL,
  `FILE_SN` decimal(10,0) NOT NULL,
  `FILE_STRE_COURS` varchar(2000) NOT NULL,
  `STRE_FILE_NM` varchar(255) NOT NULL,
  `ORIGNL_FILE_NM` varchar(255) DEFAULT NULL,
  `FILE_EXTSN` varchar(20) NOT NULL,
  `FILE_CN` mediumtext,
  `FILE_SIZE` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`,`FILE_SN`),
  CONSTRAINT `LETTNFILEDETAIL_ibfk_1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `lettnfile` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnfiledetail`
--

LOCK TABLES `lettnfiledetail` WRITE;
/*!40000 ALTER TABLE `lettnfiledetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lettnfiledetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettngnrlmber`
--

DROP TABLE IF EXISTS `lettngnrlmber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettngnrlmber` (
  `MBER_ID` varchar(20) NOT NULL DEFAULT '',
  `PASSWORD` varchar(200) NOT NULL,
  `PASSWORD_HINT` varchar(100) NOT NULL,
  `PASSWORD_CNSR` varchar(100) NOT NULL,
  `IHIDNUM` varchar(200) DEFAULT NULL,
  `MBER_NM` varchar(50) NOT NULL,
  `ZIP` varchar(6) DEFAULT NULL,
  `ADRES` varchar(100) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `MBER_STTUS` varchar(15) DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `END_TELNO` varchar(4) DEFAULT NULL,
  `MBTLNUM` varchar(20) DEFAULT NULL,
  `GROUP_ID` char(20) DEFAULT NULL,
  `MBER_FXNUM` varchar(20) DEFAULT NULL,
  `MBER_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  `SEXDSTN_CODE` char(1) DEFAULT NULL,
  `ESNTL_ID` char(20) NOT NULL,
  PRIMARY KEY (`MBER_ID`),
  KEY `LETTNGNRLMBER_ibfk_1` (`GROUP_ID`),
  CONSTRAINT `LETTNGNRLMBER_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `lettnauthorgroupinfo` (`GROUP_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettngnrlmber`
--

LOCK TABLES `lettngnrlmber` WRITE;
/*!40000 ALTER TABLE `lettngnrlmber` DISABLE KEYS */;
/*!40000 ALTER TABLE `lettngnrlmber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnorgnztinfo`
--

DROP TABLE IF EXISTS `lettnorgnztinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnorgnztinfo` (
  `ORGNZT_ID` char(20) NOT NULL DEFAULT '',
  `ORGNZT_NM` varchar(20) NOT NULL,
  `ORGNZT_DC` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ORGNZT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnorgnztinfo`
--

LOCK TABLES `lettnorgnztinfo` WRITE;
/*!40000 ALTER TABLE `lettnorgnztinfo` DISABLE KEYS */;
INSERT INTO `lettnorgnztinfo` VALUES ('ORGNZT_0000000000000','기본조직','기본조직');
/*!40000 ALTER TABLE `lettnorgnztinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnschdulinfo`
--

DROP TABLE IF EXISTS `lettnschdulinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettnschdulinfo` (
  `SCHDUL_ID` char(20) NOT NULL,
  `SCHDUL_SE` char(1) DEFAULT NULL,
  `SCHDUL_DEPT_ID` varchar(20) DEFAULT NULL,
  `SCHDUL_KND_CODE` varchar(20) DEFAULT NULL,
  `SCHDUL_BEGINDE` datetime DEFAULT NULL,
  `SCHDUL_ENDDE` datetime DEFAULT NULL,
  `SCHDUL_NM` varchar(255) DEFAULT NULL,
  `SCHDUL_CN` varchar(2500) DEFAULT NULL,
  `SCHDUL_PLACE` varchar(255) DEFAULT NULL,
  `SCHDUL_IPCR_CODE` char(1) DEFAULT NULL,
  `SCHDUL_CHARGER_ID` varchar(20) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `REPTIT_SE_CODE` char(3) DEFAULT NULL,
  PRIMARY KEY (`SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnschdulinfo`
--

LOCK TABLES `lettnschdulinfo` WRITE;
/*!40000 ALTER TABLE `lettnschdulinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lettnschdulinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettntmplatinfo`
--

DROP TABLE IF EXISTS `lettntmplatinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettntmplatinfo` (
  `TMPLAT_ID` char(20) NOT NULL DEFAULT '',
  `TMPLAT_NM` varchar(255) DEFAULT NULL,
  `TMPLAT_COURS` varchar(2000) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `TMPLAT_SE_CODE` char(6) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`TMPLAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettntmplatinfo`
--

LOCK TABLES `lettntmplatinfo` WRITE;
/*!40000 ALTER TABLE `lettntmplatinfo` DISABLE KEYS */;
INSERT INTO `lettntmplatinfo` VALUES ('TMPLAT_BOARD_DEFAULT','게시판 기본템플릿','/css/egovframework/cop/bbs/egovbbsTemplate.css','Y','TMPT01','USRCNFRM_00000000000','2011-08-02 21:01:59','USRCNFRM_00000000000','2011-08-08 16:12:57');
/*!40000 ALTER TABLE `lettntmplatinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hst'
--

--
-- Final view structure for view `comvnusermaster`
--

/*!50001 DROP VIEW IF EXISTS `comvnusermaster`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comvnusermaster` AS select `lettngnrlmber`.`ESNTL_ID` AS `ESNTL_ID`,`lettngnrlmber`.`MBER_ID` AS `USER_ID`,`lettngnrlmber`.`PASSWORD` AS `PASSWORD`,`lettngnrlmber`.`MBER_NM` AS `USER_NM`,`lettngnrlmber`.`ZIP` AS `USER_ZIP`,`lettngnrlmber`.`ADRES` AS `USER_ADRES`,`lettngnrlmber`.`MBER_EMAIL_ADRES` AS `USER_EMAIL`,' ' AS `GROUP_ID`,'GNR' AS `USER_SE`,' ' AS `ORGNZT_ID` from `lettngnrlmber` union all select `lettnemplyrinfo`.`ESNTL_ID` AS `ESNTL_ID`,`lettnemplyrinfo`.`EMPLYR_ID` AS `EMPLYR_ID`,`lettnemplyrinfo`.`PASSWORD` AS `PASSWORD`,`lettnemplyrinfo`.`USER_NM` AS `USER_NM`,`lettnemplyrinfo`.`ZIP` AS `ZIP`,`lettnemplyrinfo`.`HOUSE_ADRES` AS `HOUSE_ADRES`,`lettnemplyrinfo`.`EMAIL_ADRES` AS `EMAIL_ADRES`,`lettnemplyrinfo`.`GROUP_ID` AS `GROUP_ID`,'USR' AS `USER_SE`,`lettnemplyrinfo`.`ORGNZT_ID` AS `ORGNZT_ID` from `lettnemplyrinfo` union all select `lettnentrprsmber`.`ESNTL_ID` AS `ESNTL_ID`,`lettnentrprsmber`.`ENTRPRS_MBER_ID` AS `ENTRPRS_MBER_ID`,`lettnentrprsmber`.`ENTRPRS_MBER_PASSWORD` AS `ENTRPRS_MBER_PASSWORD`,`lettnentrprsmber`.`CMPNY_NM` AS `CMPNY_NM`,`lettnentrprsmber`.`ZIP` AS `ZIP`,`lettnentrprsmber`.`ADRES` AS `ADRES`,`lettnentrprsmber`.`APPLCNT_EMAIL_ADRES` AS `APPLCNT_EMAIL_ADRES`,' ' AS `Name_exp_28`,'ENT' AS `USER_SE`,' ' AS `ORGNZT_ID` from `lettnentrprsmber` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-08 18:15:42
