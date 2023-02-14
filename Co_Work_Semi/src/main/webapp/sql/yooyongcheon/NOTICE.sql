--테이블 삭제
DROP TABLE NOTICE CASCADE CONSTRAINTS PURGE;
--테이블 생성
CREATE TABLE NOTICE(
		NOTICE_NUM			NUMBER,						--글 번호
		USER_ID				VARCHAR2(30)	references USER_INFO(USER_ID),				--작성자
		NOTICE_SUBJECT		VARCHAR2(300)	NOT NULL,		--제목
		NOTICE_CONTENT		VARCHAR2(4000)	NOT NULL,	--내용
		NOTICE_FILE			VARCHAR2(50),				--첨부될 파일 명
		NOTICE_RE_REF		NUMBER,						--답변 글 작성시 참조되는 글의 번호
		NOTICE_RE_LEV		NUMBER,						--답변 글의 깊이
		NOTICE_RE_SEQ		NUMBER,						--답변 글의 순서
		NOTICE_READCOUNT	NUMBER,						--글의 조회수
		NOTICE_REG_DATE 	DATE DEFAULT SYSDATE,		--글의 작성 날짜
		PRIMARY KEY(NOTICE_NUM)
);

--시퀀스 삭제
DROP SEQUENCE NOTICE_NUM_SEQ;
--NOTICE_NUM 시퀀스
CREATE SEQUENCE NOTICE_NUM_SEQ
INCREMENT BY 1
START WITH 1;

--데이터 삭제 시 시퀀스 -1
ALTER SEQUENCE NOTICE_NUM_SEQ
INCREMENT BY -1;

SELECT NOTICE_NUM_SEQ.NEXTVAL
FROM dual;
 
ALTER SEQUENCE NOTICE_NUM_SEQ
INCREMENT BY 1;



--값 입력
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('1', 'HTA1', '공지사항1', '공지사항1내용입니다.', '1', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('2', 'HTA1', '공지사항2', '공지사항2내용입니다.', '2', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('3', 'HTA1', '공지사항3', '공지사항3내용입니다.', '3', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('4', 'HTA1', '공지사항4', '공지사항4내용입니다.', '4', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('5', 'HTA1', '공지사항5', '공지사항5내용입니다.', '5', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('6', 'HTA1', '공지사항6', '공지사항6내용입니다.', '6', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('7', 'HTA1', '공지사항7', '공지사항7내용입니다.', '7', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('8', 'HTA1', '공지사항8', '공지사항8내용입니다.', '8', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('9', 'HTA1', '공지사항9', '공지사항9내용입니다.', '9', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('10', 'HTA1', '공지사항10', '공지사항10내용입니다.', '10', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('11', 'HTA1', '공지사항11', '공지사항11내용입니다.', '11', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('12', 'HTA1', '공지사항12', '공지사항12내용입니다.', '12', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('13', 'HTA1', '공지사항13', '공지사항13내용입니다.', '13', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('14', 'HTA1', '공지사항14', '공지사항14내용입니다.', '14', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('15', 'HTA1', '공지사항15', '공지사항15내용입니다.', '15', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('16', 'HTA1', '공지사항16', '공지사항16내용입니다.', '16', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('17', 'HTA1', '공지사항17', '공지사항17내용입니다.', '17', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('18', 'HTA1', '공지사항18', '공지사항18내용입니다.', '18', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('19', 'HTA1', '공지사항19', '공지사항19내용입니다.', '19', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('20', 'HTA1', '공지사항20', '공지사항20내용입니다.', '20', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('21', 'HTA1', '공지사항21', '공지사항21내용입니다.', '21', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('22', 'HTA1', '공지사항22', '공지사항22내용입니다.', '22', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('23', 'HTA1', '공지사항23', '공지사항23내용입니다.', '23', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('24', 'HTA1', '공지사항24', '공지사항24내용입니다.', '24', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('25', 'HTA1', '공지사항25', '공지사항25내용입니다.', '25', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('26', 'HTA1', '공지사항26', '공지사항26내용입니다.', '26', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('27', 'HTA1', '공지사항27', '공지사항27내용입니다.', '27', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('28', 'HTA1', '공지사항28', '공지사항28내용입니다.', '28', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('29', 'HTA1', '공지사항29', '공지사항29내용입니다.', '29', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('30', 'HTA1', '공지사항30', '공지사항30내용입니다.', '30', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('31', 'HTA1', '공지사항31', '공지사항31내용입니다.', '31', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('32', 'HTA1', '공지사항32', '공지사항32내용입니다.', '32', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('33', 'HTA1', '공지사항33', '공지사항33내용입니다.', '33', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('34', 'HTA1', '공지사항34', '공지사항34내용입니다.', '34', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('35', 'HTA1', '공지사항35', '공지사항35내용입니다.', '35', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('36', 'HTA1', '공지사항36', '공지사항36내용입니다.', '36', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('37', 'HTA1', '공지사항37', '공지사항37내용입니다.', '37', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('38', 'HTA1', '공지사항38', '공지사항38내용입니다.', '38', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('39', 'HTA1', '공지사항39', '공지사항39내용입니다.', '39', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('40', 'HTA1', '공지사항40', '공지사항40내용입니다.', '40', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('41', 'HTA1', '공지사항41', '공지사항41내용입니다.', '41', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('42', 'HTA1', '공지사항42', '공지사항42내용입니다.', '42', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('43', 'HTA1', '공지사항43', '공지사항43내용입니다.', '43', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('44', 'HTA1', '공지사항44', '공지사항44내용입니다.', '44', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('45', 'HTA1', '공지사항45', '공지사항45내용입니다.', '45', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('46', 'HTA1', '공지사항46', '공지사항46내용입니다.', '46', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('47', 'HTA1', '공지사항47', '공지사항47내용입니다.', '47', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('48', 'HTA1', '공지사항48', '공지사항48내용입니다.', '48', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('49', 'HTA1', '공지사항49', '공지사항49내용입니다.', '49', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('50', 'HTA1', '공지사항50', '공지사항50내용입니다.', '50', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('51', 'HTA1', '공지사항51', '공지사항51내용입니다.', '51', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('52', 'HTA1', '공지사항52', '공지사항52내용입니다.', '52', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('53', 'HTA1', '공지사항53', '공지사항53내용입니다.', '53', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('54', 'HTA1', '공지사항54', '공지사항54내용입니다.', '54', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('55', 'HTA1', '공지사항55', '공지사항55내용입니다.', '55', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('56', 'HTA1', '공지사항56', '공지사항56내용입니다.', '56', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('57', 'HTA1', '공지사항57', '공지사항57내용입니다.', '57', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('58', 'HTA1', '공지사항58', '공지사항58내용입니다.', '58', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('59', 'HTA1', '공지사항59', '공지사항59내용입니다.', '59', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('60', 'HTA1', '공지사항60', '공지사항60내용입니다.', '60', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('61', 'HTA1', '공지사항61', '공지사항61내용입니다.', '61', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('62', 'HTA1', '공지사항62', '공지사항62내용입니다.', '62', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('63', 'HTA1', '공지사항63', '공지사항63내용입니다.', '63', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('64', 'HTA1', '공지사항64', '공지사항64내용입니다.', '64', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('65', 'HTA1', '공지사항65', '공지사항65내용입니다.', '65', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('66', 'HTA1', '공지사항66', '공지사항66내용입니다.', '66', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('67', 'HTA1', '공지사항67', '공지사항67내용입니다.', '67', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('68', 'HTA1', '공지사항68', '공지사항68내용입니다.', '68', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('69', 'HTA1', '공지사항69', '공지사항69내용입니다.', '69', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('70', 'HTA1', '공지사항70', '공지사항70내용입니다.', '70', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('71', 'HTA1', '공지사항71', '공지사항71내용입니다.', '71', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('72', 'HTA1', '공지사항72', '공지사항72내용입니다.', '72', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('73', 'HTA1', '공지사항73', '공지사항73내용입니다.', '73', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('74', 'HTA1', '공지사항74', '공지사항74내용입니다.', '74', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('75', 'HTA1', '공지사항75', '공지사항75내용입니다.', '75', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('76', 'HTA1', '공지사항76', '공지사항76내용입니다.', '76', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('77', 'HTA1', '공지사항77', '공지사항77내용입니다.', '77', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('78', 'HTA1', '공지사항78', '공지사항78내용입니다.', '78', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('79', 'HTA1', '공지사항79', '공지사항79내용입니다.', '79', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('80', 'HTA1', '공지사항80', '공지사항80내용입니다.', '80', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('81', 'HTA1', '공지사항81', '공지사항81내용입니다.', '81', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('82', 'HTA1', '공지사항82', '공지사항82내용입니다.', '82', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('83', 'HTA1', '공지사항83', '공지사항83내용입니다.', '83', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('84', 'HTA1', '공지사항84', '공지사항84내용입니다.', '84', '0', '0', SYSDATE);
INSERT INTO NOTICE(NOTICE_NUM, USER_ID, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_RE_REF, NOTICE_RE_LEV, NOTICE_RE_SEQ, NOTICE_REG_DATE) VALUES('85', 'HTA1', '공지사항85', '공지사항85내용입니다.', '85', '0', '0', SYSDATE);

INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('85',	'HTA1',	'검색사항85',	'검색사항85내용입니다.',	'85',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('86',	'HTA1',	'검색사항86',	'검색사항86내용입니다.',	'86',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('87',	'HTA1',	'검색사항87',	'검색사항87내용입니다.',	'87',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('88',	'HTA1',	'검색사항88',	'검색사항88내용입니다.',	'88',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('89',	'HTA1',	'검색사항89',	'검색사항89내용입니다.',	'89',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('90',	'HTA1',	'검색사항90',	'검색사항90내용입니다.',	'90',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('91',	'HTA1',	'검색사항91',	'검색사항91내용입니다.',	'91',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('92',	'HTA1',	'검색사항92',	'검색사항92내용입니다.',	'92',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('93',	'HTA1',	'검색사항93',	'검색사항93내용입니다.',	'93',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('94',	'HTA1',	'검색사항94',	'검색사항94내용입니다.',	'94',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('95',	'HTA1',	'검색사항95',	'검색사항95내용입니다.',	'95',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('96',	'HTA1',	'검색사항96',	'검색사항96내용입니다.',	'96',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('97',	'HTA1',	'검색사항97',	'검색사항97내용입니다.',	'97',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('98',	'HTA1',	'검색사항98',	'검색사항98내용입니다.',	'98',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('99',	'HTA1',	'검색사항99',	'검색사항99내용입니다.',	'99',	'0',	'0',	SYSDATE);
INSERT	INTO	NOTICE(NOTICE_NUM,	USER_ID,	NOTICE_SUBJECT,	NOTICE_CONTENT,	NOTICE_RE_REF,	NOTICE_RE_LEV,	NOTICE_RE_SEQ,	NOTICE_REG_DATE)	VALUES('100',	'HTA1',	'검색사항100',	'검색사항100내용입니다.',	'100',	'0',	'0',	SYSDATE);



--NOTICE 테이블 조회
SELECT * FROM NOTICE;

--NOTICE 테이블 조건 검색
SELECT 