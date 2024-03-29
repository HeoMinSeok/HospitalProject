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

create table SCOTT.PATIENTS
(
    PAT_NUM   NUMBER,
    PAT_ID    VARCHAR2(50)  not null constraint PATIENTS_PK primary key,
    PAT_PW    VARCHAR2(50)  not null,
    PAT_NAME  VARCHAR2(100) not null,
    PAT_PHONE VARCHAR2(20)  not null,
    PAT_BIRTH DATE,
    PAT_GEN   VARCHAR2(10)  not null,
    PAT_EMAIL VARCHAR2(100),
    PAT_ADDR  VARCHAR2(255)
)


CREATE TABLE EMR (
    EMR_NUM NUMBER PRIMARY KEY,
    EMR_CONTENTS VARCHAR2(1000) NOT NULL,
    EMR_PMH VARCHAR2(100),
    EMR_DATE date default sysdate NOT NULL,
    DOC_ID_FK VARCHAR2(20),
    PAT_NUM_FK NUMBER(10),
    CONSTRAINT FK_DOCTOR FOREIGN KEY (DOC_ID_FK) REFERENCES DOCTORS(DOC_ID),
    CONSTRAINT FK_PATIENT FOREIGN KEY (PAT_NUM_FK) REFERENCES PATIENTS(PAT_NUM)
);


create table SCOTT.REVIEW_BOARD
(
    RB_NUM        NUMBER                 not null primary key,
    RB_TITLE      VARCHAR2(200),
    RB_CONTENTS   VARCHAR2(2000),
    RB_POSTDATE   DATE   default sysdate not null,
    RB_OFILE      VARCHAR2(200),
    RB_SFILE      VARCHAR2(30),
    RB_VISITCOUNT NUMBER default 0       not null,
    PAT_NAME_FK   VARCHAR2(100),
    PAT_ID_FK     VARCHAR2(100)
)

select * from REVIEW_BOARD;
select rb_num, RB_POSTDATE, rownum From REVIEW_BOARD;

-- ALTER TABLE EMR MODIFY EMR_DATE date default sysdate NOT NULL;

-- ALTER TABLE Doctors
--     ADD CONSTRAINT doc_id_pk PRIMARY key(doc_id);
--
-- ALTER TABLE PATIENTS
--     ADD CONSTRAINT pat_num_pk PRIMARY key(pat_num);
--
-- ALTER TABLE COORDINATOR
--     ADD CONSTRAINT cood_num_pk PRIMARY key(cood_num);
--
-- INSERT INTO COORDINATOR
-- VALUES (900000, 'jiho', '0815', '최지호');
-- INSERT INTO COORDINATOR
-- VALUES (900001, 'minddo', '0919','허민석');
-- INSERT INTO DOCTORS
-- VALUES (800001, 'hansohee', '1118','hsh1118@gmail.com','한소희');
-- INSERT INTO DOCTORS
-- VALUES (800002, 'kasin', '1234','karina@gmail.com','카리나');

ALTER TABLE scott.REVIEW_BOARD ADD PAT_NUM_FK VARCHAR2(100);

SELECT rb.*, p.PAT_ID
FROM scott.REVIEW_BOARD rb
         JOIN scott.PATIENTS p ON rb.PAT_ID_FK = p.PAT_ID;
-- SELECT PAT_NAME_FK from REVIEW_BOARD;

-- SELECT rb.*, p.PAT_NAME
-- FROM scott.REVIEW_BOARD rb
--          JOIN scott.PATIENTS p ON rb.PAT_NAME = p.PAT_NAME;
-- SELECT rb.*, p.PAT_NAME
-- FROM scott.REVIEW_BOARD rb
--          JOIN scott.PATIENTS p ON rb.PAT_NAME = p.PAT_NAME;

SELECT rb.*, p.PAT_NUM
FROM scott.REVIEW_BOARD rb
         JOIN scott.PATIENTS p ON rb.PAT_ID_FK = p.PAT_ID;

-- ALTER TABLE REVIEW_BOARD RENAME COLUMN NEW_PAT_ID_FK TO PAT_ID_FK;

SELECT p.PAT_PW FROM scott.REVIEW_BOARD rb
JOIN SCOTT.PATIENTS p ON rb.PAT_ID_FK = p.PAT_ID
WHERE rb.RB_NUM = 89;

SELECT PAT_PW FROM SCOTT.PATIENTS WHERE PAT_ID = 'test';

create table APPOINT
(
    NUM     NUMBER  not null primary key,
    pId   VARCHAR2(50) NOT NULL,
    dId   VARCHAR2(50) NOT NULL,
    pDate   DATE    default sysdate not null,
    pTime   TIMESTAMP    NOT NULL,
    status  VARCHAR2(50)    DEFAULT 'Pending',
    FOREIGN KEY (pId) REFERENCES PATIENTS(PAT_ID),
    FOREIGN KEY (dId) REFERENCES DOCTORS(DOC_ID)
);

ALTER TABLE APPOINT RENAME COLUMN NUM TO ANUM;
ALTER TABLE APPOINT ADD CONSTRAINT ANUM_PK PRIMARY KEY (ANUM);

CREATE SEQUENCE SCOTT.SEQ_EMR_NUM INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 NOCYCLE NOCACHE NOORDER;

INSERT INTO SCOTT.APPOINT
VALUES (scott.SEQ_APPOINT_NUM.nextval,'test','hansohee','2024-02-28','2024-02-28 09:00:00', default);

CREATE TABLE EMR (
    eNUM     NUMBER  not null primary key,
    eContents   VARCHAR2(1000) NOT NULL,
    eDocId  VARCHAR2(50) NOT NULL,
    ePatId  VARCHAR2(50) NOT NULL,
    ePmh   VARCHAR2(100),
    eDate   DATE    NOT NULL,
    eTime   TIMESTAMP    NOT NULL,
    FOREIGN KEY (ePatId) REFERENCES PATIENTS(PAT_ID),
    FOREIGN KEY (eDocId) REFERENCES DOCTORS(DOC_ID)
);

SELECT * FROM SCOTT.APPOINT WHERE dId = 'hansohee';
SELECT * FROM SCOTT.PATIENTS WHERE PAT_ID = 'test';

