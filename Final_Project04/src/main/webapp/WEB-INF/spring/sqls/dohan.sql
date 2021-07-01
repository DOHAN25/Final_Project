DROP SEQUENCE USERSEQ;
DROP TABLE USERS;


CREATE SEQUENCE USERSEQ;

CREATE TABLE USERS(
	USERSEQ NUMBER PRIMARY KEY,
	USERID VARCHAR2(100) NOT NULL,
	PASSWORD VARCHAR2(100) NOT NULL,
	USEREMAIL VARCHAR2(1000) NOT NULL,
	USERPHONE VARCHAR2(1000) NOT NULL,
	USEROADDRESS VARCHAR2(4000) NOT NULL,
	USERADDRESS VARCHAR2(4000) NOT NULL,
	USERDETAILADDRESS VARCHAR2(4000) NOT NULL,
	USERROLE VARCHAR2(100) CHECK(USERROLE IN ('admin', 'user')),
	USERNAME VARCHAR2(100) NOT NULL,
	USERBIRTHDAY VARCHAR2(100) NOT NULL
);

INSERT INTO USERS
VALUES(USERSEQ.NEXTVAL, 'kim123', '1234q', 'ehgks3323@naver.com', 010123423112, '47500','서울 건대근처', '서울 연제구 거제동',
'admin', '김도한', '950511');
