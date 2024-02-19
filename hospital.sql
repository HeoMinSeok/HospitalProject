CREATE TABLE COORDINATOR
(
    cood_num NUMBER(10) NOT NULL,
    cood_id VARCHAR2(20) NOT NULL,
    cood_pw VARCHAR2(15) NOT NULL,
    cood_name VARCHAR(20) NOT NULL
);

CREATE TABLE DOCTORS
(
    doc_num NUMBER(10) NOT NULL,
    doc_id VARCHAR2(20) NOT NULL,
    doc_pw VARCHAR2(15) NOT NULL,
    doc_email VARCHAR2(50),
    doc_name varchar2(20) NOT NULL
);

CREATE TABLE PATIENTS
(
    pat_num NUMBER(10) NOT NULL,
    pat_id VARCHAR2(20) NOT NULL,
    pat_pw VARCHAR2(15) NOT NULL,
    pat_name VARCHAR2(20) NOT NULL,
    pat_gen VARCHAR2(10) NOT NULL,
    pat_jumin VARCHAR2(14) NOT NULL,
    pat_addr VARCHAR2(100),
    pat_phone VARCHAR2(15)
);

ALTER TABLE Doctors
    ADD CONSTRAINT doc_id_pk PRIMARY key(doc_id);

ALTER TABLE PATIENTS
    ADD CONSTRAINT pat_num_pk PRIMARY key(pat_num);

ALTER TABLE COORDINATOR
    ADD CONSTRAINT cood_num_pk PRIMARY key(cood_num);

INSERT INTO COORDINATOR
VALUES (900000, 'jiho', '0815', '최지호');
INSERT INTO COORDINATOR
VALUES (900001, 'minddo', '0919','허민석');
INSERT INTO DOCTORS
VALUES (800001, 'hansohee', '1118','hsh1118@gmail.com','한소희');

INSERT INTO PATIENTS
VALUES (SCOTT.SEQ_BOARD_NUM.nextval, 'test', '1234','환자','MALE','000219-2000000','부산광역시','010-1111-1234');

CREATE TABLE REVIEW_BOARD
(
    review_num NUMBER(10) NOT NULL,
    review_img VARCHAR2(200) NOT NULL,
    review_content VARCHAR2(300)
    pat_name VARCHAR2(20) NOT NULL,
    pat_gen VARCHAR2(10) NOT NULL,
    pat_jumin VARCHAR2(14) NOT NULL,
    pat_addr VARCHAR2(100),
    pat_phone VARCHAR2(15)
);
