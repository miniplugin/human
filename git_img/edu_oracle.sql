--
-- 데이터베이스: XE
--

-- --------------------------------------------------------

--
-- 테이블 구조 tbl_board
--

-- DROP TABLE tbl_board;
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
SELECT to_char(SYSDATE,'yyyy/mm/dd hh24:mi:ss') FROM DUAL;
SELECT 
    TO_DATE('2019-10-10 22:20:01', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

--
-- 테이블의 덤프 데이터 tbl_board
--
INSERT INTO tbl_board VALUES (1, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (2, '수정된 글입니다.', '수정 테스트2 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (3, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (4, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (5, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (6, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (7, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (8, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (9, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (10, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (11, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (12, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (13, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (14, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (15, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (16, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (27, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (28, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (29, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (30, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (31, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (32, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (33, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (34, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (35, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (36, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (37, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (38, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (39, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (40, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (41, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (42, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (43, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (44, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (45, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (46, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (47, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (48, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (49, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (50, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (51, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (52, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (53, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (54, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (55, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (56, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (57, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (58, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (59, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (60, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (61, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (62, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (63, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (64, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (65, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (66, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (67, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (68, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (69, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (70, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (71, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (72, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (73, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (74, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (75, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (76, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (77, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (79, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (80, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (81, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (82, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (83, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (84, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (85, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (86, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (87, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (88, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (89, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (90, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (91, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (92, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (93, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (94, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (95, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (96, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (97, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (98, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (99, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (100, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (101, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (102, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (103, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (104, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (105, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (106, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (107, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (108, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (109, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (110, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (111, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (112, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (113, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (114, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (115, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (116, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (117, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (118, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (119, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (120, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (121, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (122, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (123, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (124, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (125, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (126, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (127, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (128, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (129, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (130, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (131, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (132, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (133, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (134, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (135, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (136, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (137, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (138, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (139, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (140, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (141, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (142, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (143, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (144, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (145, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (146, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (147, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (148, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (149, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (150, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (151, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (152, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (153, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (154, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (155, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (156, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (157, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (158, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (159, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (160, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (161, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (162, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (163, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (164, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (165, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (166, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (167, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (168, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (169, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (170, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (171, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (172, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (173, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (174, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (175, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (176, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (177, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (178, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (179, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (181, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (182, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (183, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (184, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (185, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (186, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (187, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (188, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (189, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (190, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (191, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (192, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (193, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (194, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (195, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (196, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (197, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (198, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (199, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (200, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (201, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (202, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (203, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (204, '홈페이지 오픈', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (205, '첨부파일 테스트', '내용 입력\r\n입니다.', '김일국', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (206, '홈페이지 오픈', '1234', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (207, '홈페이지 오픈', 'ㅅㄷㄴㅅ', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (208, '홈페이지 오픈 테스트', '내용:\r\n홈페이지 오픈 테스트', 'kim ilguk', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (209, '수정된 글입니다.', '수정 테스트 ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (210, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (211, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (212, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (213, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (214, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);
INSERT INTO tbl_board VALUES (215, '새로운 글을 넣습니다. ', '새로운 글을 넣습니다. ', 'user00', SYSDATE, SYSDATE, 0, 0);

-- --------------------------------------------------------

--
-- 테이블 구조 tbl_attach
--

-- DROP TABLE tbl_attach;
CREATE TABLE tbl_attach (
  full_name varchar(150) NOT NULL,
  bno number(11) NOT NULL,
  regdate DATE DEFAULT SYSDATE,
  CONSTRAINT ATTACH_PK PRIMARY KEY (full_name),
  CONSTRAINT fk_board_attach FOREIGN KEY(bno)
         REFERENCES tbl_board(bno) ON DELETE CASCADE
);

--
-- 테이블의 덤프 데이터 tbl_attach
--

INSERT INTO tbl_attach (full_name, bno, regdate) VALUES ('/2019/10/20/s_6628ae49-d5d6-4911-a79e-5728b513cfb6_웹툰사이트.jpg', 205, SYSDATE);
INSERT INTO tbl_attach (full_name, bno, regdate) VALUES ('/2019/10/20/s_cf415fbe-754b-4d47-9ecd-0339438dc24f_logo.png', 205, SYSDATE);

-- --------------------------------------------------------

--
-- 테이블 구조 tbl_member
--

-- DROP TABLE tbl_member;
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
-- 테이블의 덤프 데이터 tbl_member
--

INSERT INTO tbl_member VALUES ('user02', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', 'user02', 'user02@edu.com', 0, 1, 'ROLE_ADMIN', SYSDATE, SYSDATE);

-- --------------------------------------------------------

--
-- 테이블 구조 tbl_reply
--

-- DROP TABLE tbl_reply;
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
-- 테이블의 덤프 데이터 tbl_reply
--

--INSERT INTO tbl_reply VALUES (1, 15, '1:댓글을 수정   MOD', 'user02', SYSDATE, SYSDATE);

-- 오라클 전용 시퀸스 방식
CREATE SEQUENCE BNO_SEQ
  START WITH 215
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
CREATE SEQUENCE RNO_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
--SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG FROM USER_SEQUENCES; //시퀸스 종류확인
--select BNO_SEQ.nextval from dual; //시퀸스 번호 확인쿼리

--
-- 참고: 테이블의 시퀸스(자동증가) 전자정부 프레임워크 방식
--
-- DROP TABLE IDS CASCADE CONSTRAINTS;
--CREATE TABLE IDS  (
--  TABLE_NAME varchar2(20) NOT NULL,
--  NEXT_ID number(30,0)DEFAULT 0 NOT NULL ,
--  CONSTRAINT IDS_PK PRIMARY KEY (TABLE_NAME)
--);

-- ID Generation
--insert into IDS(TABLE_NAME,NEXT_ID) values ('TBL_BOARD',216);
--insert into IDS(TABLE_NAME,NEXT_ID) values ('TBL_REPLY',16);
