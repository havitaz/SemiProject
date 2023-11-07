--CREATE USER SEMI5 IDENTIFIED BY SEMI5; 계정생성(관리자계정으로)
--GRANT CONNECT, RESOURCE TO SEMI5; 권한부여
----------삭제-------------
--접속유저의 모든 테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/

--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/

--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--

-------------------------------------테이블--------------------------------------
--멤버테이블
CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(32) UNIQUE,
    MEM_PWD VARCHAR2(32) NOT NULL,
    PHONE VARCHAR2(32) NOT NULL,
    EMAIL VARCHAR2(32) NOT NULL,
    STATUS VARCHAR2(2) DEFAULT 'Y'
);

--뮤직테이블
CREATE TABLE MUSIC(
    MUS_NO NUMBER PRIMARY KEY,
    MUS_NAME VARCHAR2(100) NOT NULL,
    MUS_ART VARCHAR2(50) NOT NULL,
    MUS_GEN VARCHAR2(30),
    MUS_TIME VARCHAR2(10) NOT NULL,
    MUS_MV VARCHAR2(1000),
    STATUS VARCHAR2(2) DEFAULT 'Y',
    COUNT NUMBER DEFAULT 0,
    ALBUM_PATH VARCHAR2(4000),
    ENROLL_DATE DATE DEFAULT SYSDATE
);

--플레이리스트테이블
CREATE TABLE PLAYLIST(
--    PLA_NO NUMBER,
    MUS_NO NUMBER REFERENCES MUSIC(MUS_NO),
    MEM_NO NUMBER REFERENCES MEMBER (MEM_NO),
    STATUS VARCHAR2(3) DEFAULT 'Y'
);
--    PLA_NAME VARCHAR2(100) NOT NULL,
--    PLA_ART VARCHAR2(100) NOT NULL,
--    PLA_GEN VARCHAR2(30),
--    PLA_TIME VARCHAR2(10) NOT NULL,
--    PLA_STATUS VARCHAR2(10) NOT NULL,

--기록테이블
CREATE TABLE RECORD(
    MUS_NO2 NUMBER REFERENCES MUSIC (MUS_NO)
);


-------------------------------------시퀀스--------------------------------------
--멤버테이블의 멤버 번호 시퀀스 (2부터 시작하여 1씩 증가(1은 관리자 넘버)하고 최대99까지)
CREATE SEQUENCE SEQ_MEM_NO
START WITH 2
INCREMENT BY 1
MAXVALUE 99
NOCYCLE
NOCACHE;

--뮤직테이블의 노래번호 시퀀스(100부터시작 1씩증가 999까지)
CREATE SEQUENCE SEQ_MUS_NO
START WITH 100
INCREMENT BY 1
MAXVALUE 999
NOCYCLE
NOCACHE;

----플레이리스트 테이블의 PLA번호 시퀀스(1000부터 1씩증가 1999까지)
--CREATE SEQUENCE SEQ_PLA_NO
--START WITH 1000
--INCREMENT BY 1
--MAXVALUE 1999
--NOCYCLE
--NOCACHE;

------------------------------------더미데이터------------------------------------
--MEMBER데이터
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_PWD, PHONE, EMAIL, STATUS)
VALUES (1, 'admin', '1234', '010-0000-0000', 'admin@kh.com', 'Y');

INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_PWD, PHONE, EMAIL, STATUS)
VALUES (SEQ_MEM_NO.NEXTVAL, 'user01', 'pass01', '010-1111-1111', 'user02@kh.com', 'Y');

INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_PWD, PHONE, EMAIL, STATUS)
VALUES (SEQ_MEM_NO.NEXTVAL, 'user02', 'pass02', '010-2222-2222', 'user02@kh.com', 'Y');
--MUSIC데이터
SET DEFINE OFF
INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Specialz', 'king Gnu', 'JPOP', '03:59', 'https://youtu.be/MIbt_Yn_rdw', 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'KICK BACK', 'Kensi Yonezu', 'JPOP', '03:14', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Lemon', 'Kensi Yonezu', 'JPOP', '04:16', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Inferno', 'Mrs.Green Apple', 'JPOP', '03:33', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Some Like Hot!!', 'SpyAir', 'JPOP', '03:12', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Gurenge', 'Lisa', 'JPOP', '03:58', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Zankyosanka', 'Aimer', 'JPOP', '03:05', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '사랑을 전하고 싶다던가', '아이묭', 'JPOP', '04:31', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Betelgeuse', 'Yuuri', 'JPOP', '03:51', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'CryBaby', 'Official Hige Dandism', 'JPOP', '04:02', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '푸르름이 사는 곳', '키타니 타츠야', 'JPOP', '03:14', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '밤을달리다', 'YOASOBI', 'JPOP', '04:19', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '피날래', 'eill', 'JPOP', '04:01', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '벛꽃만월', 'SpyAir', 'JPOP', '03:33', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'apdo', 'ado', 'JPOP', '03:58', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Night dancer', 'imase', 'JPOP', '03:31', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Kaikai Kitan', 'Eve', 'JPOP', '03:42', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Glorious days', 'Three Lights Down Kings', 'JPOP', '03:59', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Shutter', 'Yuuri', 'JPOP', '04:09', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Sakayme', 'King Gnu', 'JPOP', '05:08', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'merry-go-round', 'Yuuri', 'JPOP', '04:17', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Avid', 'SawanoHiroyuki', 'JPOP', '04:09', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '아무것도 아니야', 'RADWIMPS', 'JPOP', '05:48', NULL, 'Y', 1, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Sparkle', 'RADWIMPS', 'JPOP', '04:38', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Spnning Globe', 'Kensi Yonezu', 'JPOP', '04:30', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Bye bye my blue', '백예린', 'R&B', '03:23', 'https://www.youtube.com/watch?v=WbhK3wMXluE', 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Vancouver', 'BIG Naughty(서동현)', 'R&B', '03:36', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'D', 'DEAN', 'R&B', '03:49', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '비', '폴킴', 'R&B', '03:57', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '잊어버리지마(feat.태연)', 'Crush', 'R&B', '03:39', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '와르르♥', 'Colde(콜드)', 'R&B', '04:32', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'My Everything', '신용재(2F), Paul Blanco', 'R&B', '04:48', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'All I Wanna Do(feat. Hoody, Loco)', '박재범', 'R&B', '03:36', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '벌써 일년', '브라운 아이즈', 'R&B', '03:27', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '떠나', 'THAMA, Jayci yucca(제이씨유카)', 'R&B', '04:07', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Thirsty', 'aespa', 'R&B', '03:13', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Boat', '죠지', 'R&B', '03:12', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '너는 나 나는 너', '지코', 'R&B', '03:33', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Hurt', 'New Jeans', 'R&B', '02:56', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '팔레트(feat. G-DRAGON)', '아이유', 'R&B', '03:37', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '곁에 있어줘(feat. 원슈타인)', 'SOLE(쏠)', 'R&B', '03:11', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '자니(feat.다이나믹듀오)', '프라이머리', 'R&B', '03:54', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '양화대교', 'Zion.T', 'R&B', '03:49', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '비도 오고 그래서(feat. 신용재)', '헤이즈', 'R&B', '03:25', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Trip(feat. Hannah)', '릴러말즈', 'R&B', '03:54', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Summer(feat. 비오)', 'Paul Blanco', 'R&B', '03:19', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Nerdy Love(feat. 백예린)', 'pH-1', 'R&B', '03:16', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '어떻게 지내', '오반', 'R&B', '03:50', NULL, 'Y', 2, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '오늘 취하면(feat. 창모)', '수란', 'R&B', '03:52', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'silly silly Love', '권진아', 'R&B', '03:34', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Alone(feat. 쏠(SOLE), 다운(Dvwn))', 'Cosmic Boy', 'R&B', '03:20', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'To Be With You', 'Mr. Big', 'Rock', '03:30', 'https://youtu.be/L6-uJLteKek?si=Wej490cZTH2q6ZkY', 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Long, Long Way from Home
', 'Foreigner', 'Rock', '02:53', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Too Daze Gone', 'Billy Squier', 'Rock', '04:04', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Wanted Dead Or Alive ', 'Bon Jovi', 'Rock', '05:07', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'We''re an American Band', 'Grand Funk Railroad', 'Rock', '03:27', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Just As Through With You', 'Nine Days', 'Rock', '03:54', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Eye Of The Tiger', 'Survivor', 'Rock', '04:04', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Butterflies and Hurricanes', 'Muse ', 'Rock', '05:02', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Ready Aim Fire', 'Blue Stahli', 'Rock', '03:05', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Starless', 'Crossfade ', 'Rock', '03:55', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'November Rain', 'Guns N'' Roses', 'Rock', '08:56', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Cherry Pie', 'Warrant ', 'Rock', '03:21', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Sgt. Pepper''s Lonely Hearts Club Band', 'The Beatles', 'Rock', '02:02', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Carry On Wayward Son', 'Kansas ', 'Rock', '05:23', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Numb', 'Linkin Park', 'Rock', '03:08', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Smells Like Teen Spirit', 'Nirvana ', 'Rock', '04:39', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Kashmir', 'Led Zeppelin', 'Rock', '08:37', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '(I Can''t Get No) Satisfaction', 'The Rolling Stones', 'Rock', '03:54', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Heat Of The Moment', 'Asia ', 'Rock', '03:08', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'With Or Without You', 'U2', 'Rock', '04:52', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Burn', 'Deep Purple', 'Rock', '06:04', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Somebody To Love', 'Queen ', 'Rock', '05:09', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Highway to Hell', 'AC/DC', 'Rock', '03:28', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'I Don''t Want to Miss a Thing', 'Aerosmith ', 'Rock', '04:52', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Shine ', 'Collective Soul', 'Rock', '04:39', NULL, 'Y', 3, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Take Five
', 'Dave Brubeck', 'Jazz', '05:29', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Out of Time', 'The Weeknd', 'POP', '03:35', 'https://youtu.be/2fDzCWNS3ig?si=Xt_9AyLEpdKM5QNU', 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Steal The Show (From “엘리멘탈”)', 'Lauv', 'POP', '03:37', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'I Don''t Think That I Like Her', 'Charlie Puth', 'POP', '03:09', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Dangerously', 'Charlie Puth', 'POP', '03:20', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'STAY', 'The Kid LAROI, Justin Bieber', 'POP', '02:22', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'That''s Hilarious', 'Charlie Puth', 'POP', '02:25', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Dreamers [Music from the FIFA World Cup Qatar 2022 Official Soundtrack] (Feat. FIFA Sound)', '정국', 'POP', '03:22', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, '2002', 'Anne-Marie', 'POP', '03:07', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'I''m Not The Only One', 'Sam Smith', 'POP', '04:00', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Shape of You', 'Ed Sheeran', 'POP', '03:54', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Blinding Lights', 'The Weeknd', 'POP', '03:22', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Without Me', 'Eminem', 'POP', '04:51', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Another One Bites The Dust', 'Queen', 'POP', '03:35', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Feels(feat. 퍼렐 윌리엄스(Pharrell Williams), Katy Perry(케이티 페리), Big Sean)', 'Calvin Harris', 'POP', '03:44', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Starboy(feat. Daft Punk)', 'The Weeknd', 'POP', '03:51', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Treasure', 'Bruno Mars', 'POP', '02:59', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Leave The Door Open', 'Bruno Mars, Anderson .Paak 및 Silk Sonic', 'POP', '04:03', NULL, 'Y', 4, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Save Your Tears', 'The Weeknd', 'POP', '03:36', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Day 1 ◑', 'HONNE', 'POP', '03:54', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Lost Stars', 'Adam Levine', 'POP', '04:28', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'This Love', 'Maroon 5', 'POP', '03:27', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Young, Wild & Free(feat. Bruno Mars)', 'Wiz Khalifa 및 Snoop Dogg', 'POP', '03:28', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'No One Else Like You', 'Adam Levine', 'POP', '03:29', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Bad guy', 'Billie Eilish', 'POP', '03:15', NULL, 'Y', 0, NULL, SYSDATE);

INSERT INTO MUSIC (MUS_NO, MUS_NAME, MUS_ART, MUS_GEN, MUS_TIME, MUS_MV, STATUS, COUNT, ALBUM_PATH, ENROLL_DATE) 
VALUES (SEQ_MUS_NO.NEXTVAL, 'Snowman', 'Sia', 'POP', '02:46', NULL, 'Y', 0, NULL, SYSDATE);

--플레이리스트 더미데이터
INSERT INTO PLAYLIST (MUS_NO, MEM_NO)
VALUES (100, 2);
commit;