--테이블 생성
DROP TABLE COMM CASCADE CONSTRAINTS PURGE;
CREATE TABLE COMM(
		COMM_NUM		NUMBER,					--댓글 번호
		COMM_NAME		VARCHAR2(30),			--작성자
		COMM_PASS		VARCHAR2(30) NOT NULL,	--비밀번호
		COMM_CONTENT	VARCHAR2(200) NOT NULL,	--내용
		COMM_BOARD_NUM	NUMBER	REFERENCES FREE(FREE_NUM) ON DELETE CASCADE,--COMM 테이블이 참조하는 FREE글 번호
		COMM_RE_REF		NUMBER,	--원문은 자신 글번호, 답글이면 원문 글번호
		COMM_RE_LEV		NUMBER(1) 	CHECK(COMM_RE_LEV IN (0,1,2)), --원문이면0 답글이면1
		COMM_RE_SEQ		NUMBER,	--원문이면 0, 1레벨이면 1레벨 시퀀스 + 1
		COMM_REG_DATE 	DATE DEFAULT SYSDATE,	--댓글 작성일
		PRIMARY KEY(COMM_NUM));
		-- 게시판 글삭제시 참조댓글도 삭제	


--시퀀스를 생성합니다.
DROP SEQUENCE COM_SEQ;
CREATE SEQUENCE COM_SEQ;

--값 입력
INSERT INTO REPLY(REPLY_NO, REPLY_REG_DATE, REPLY_CONTENT, REPLY_PASS)
VALUES(SEQ_REPLY_NO.NEXTVAL, SYSDATE, '댓글1내용입니다.', '1234')
;
INSERT INTO REPLY(REPLY_NO, REPLY_REG_DATE, REPLY_CONTENT, REPLY_PASS)
VALUES(SEQ_REPLY_NO.NEXTVAL, SYSDATE, '댓글2내용입니다.', '1234')
;
INSERT INTO REPLY(REPLY_NO, REPLY_REG_DATE, REPLY_CONTENT, REPLY_PASS)
VALUES(SEQ_REPLY_NO.NEXTVAL, SYSDATE, '댓글3내용입니다.', '1234')
;

--REPLY 테이블 조회
SELECT * FROM REPLY;