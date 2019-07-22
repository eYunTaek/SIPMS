-- 테이블
CREATE TABLE emp(
empno NUMBER PRIMARY KEY,
ename varchar2(30) NOT NULL,
pass varchar2(60) NOT NULL,
civilno varchar2(60) NOT NULL,
phone varchar2(60),
posi varchar2(50) DEFAULT '사원',
sal NUMBER DEFAULT 2000,
hiredate DATE DEFAULT sysdate,
regdate DATE ,
pjdo varchar2(30) DEFAULT 'N',
permi varchar2(50) DEFAULT '사원'
);
CREATE TABLE project(
	pjno NUMBER PRIMARY KEY,
	tno NUMBER,
	pjtitle varchar2(100) NOT NULL,
	comname varchar2(100) NOT NULL,
	area varchar2(100) DEFAULT '자사',
	stdte DATE DEFAULT SYSDATE,
	eddte DATE,
	cost NUMBER,
	allstage NUMBER DEFAULT 1,
	stage NUMBER DEFAULT 1,
	comple varchar2(50) DEFAULT 'N'
);
CREATE TABLE team(
	tno NUMBER PRIMARY KEY,
	pjno NUMBER,
	lno NUMBER,
	sales NUMBER DEFAULT 0
);
CREATE TABLE work(
	wno NUMBER PRIMARY KEY,
	empno NUMBER,
	winfo varchar2(1000),
	stage NUMBER NOT NULL,
	stdte DATE DEFAULT SYSDATE,
	enddte DATE NOT NULL,
	submi varchar2(50) DEFAULT 'N',
	comple varchar2(50) DEFAULT 'N'
);
CREATE TABLE team_detail(
	tno NUMBER,
	CONSTRAINT team_deatail_tno_fk FOREIGN KEY(tno) REFERENCES team(tno),
	empno NUMBER,
	CONSTRAINT team_deatail_empno_fk FOREIGN KEY(empno) REFERENCES emp(empno),
	wno NUMBER,
	CONSTRAINT team_deatail_wno_fk FOREIGN KEY(wno) REFERENCES work(wno),
	POSITION varchar2(50) DEFAULT '사원',
	indistage NUMBER DEFAULT 1
);
CREATE TABLE submission(
	wno NUMBER NOT NULL,
	fname varchar2(100),
	sbmdte DATE DEFAULT SYSDATE
);
CREATE TABLE message(
	mno NUMBER PRIMARY KEY,
	empno NUMBER,
	gno NUMBER,
	title varchar2(200),
	content varchar2(1000),
	sdte DATE DEFAULT SYSDATE,
	revstatus varchar2(100) DEFAULT 'N'
);
DROP TABLE message;
DROP TABLE SUBMISSION;
--DROP TABLE emp;
--DROP SEQUENCE emp_seq;
-- 시퀀스
CREATE SEQUENCE emp_seq 
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 99999;
CREATE SEQUENCE msg_seq
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 99999;
CREATE SEQUENCE project_seq
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 99999;
CREATE SEQUENCE sub_seq
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 99999;
CREATE SEQUENCE work_seq
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 99999;
