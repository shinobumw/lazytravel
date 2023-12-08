CREATE DATABASE IF NOT EXISTS LazyTravel;
USE LazyTravel;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS ROLES;
DROP TABLE IF EXISTS FUNC;
DROP TABLE IF EXISTS ROLE_FUNC;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS CS_MAIL;
DROP TABLE IF EXISTS CS_MESSAGE;
DROP TABLE IF EXISTS CS_IMG;
DROP TABLE IF EXISTS FOODSCAPE;
DROP TABLE IF EXISTS OPENTIME;
DROP TABLE IF EXISTS FOODSCAPE_IMG;
DROP TABLE IF EXISTS TAG;
DROP TABLE IF EXISTS FOODSCAPE_TAG;
DROP TABLE IF EXISTS JOURNEY;
DROP TABLE IF EXISTS JOURNEY_TIME_FOODSCAPE;
DROP TABLE IF EXISTS TOUR_GROUP;
DROP TABLE IF EXISTS COUPON;
DROP TABLE IF EXISTS CUSTOMER_COUPON;
DROP TABLE IF EXISTS ORDERS; 
DROP TABLE IF EXISTS PASSENGER;
DROP TABLE IF EXISTS BLOG;
DROP TABLE IF EXISTS FOODSCAPE_BLOG;
DROP TABLE IF EXISTS BLOG_MSG;
DROP TABLE IF EXISTS BLOG_IMG;
DROP TABLE IF EXISTS BLOG_LIKE;
DROP TABLE IF EXISTS BLOG_CL;
DROP TABLE IF EXISTS BLOG_TAG;


-- 會員 --
CREATE TABLE CUSTOMER(
	CUSTOMER_ID INT AUTO_INCREMENT,
    CUSTOMER_NAME VARCHAR(20) NOT NULL,
    NICKNAME VARCHAR(30) NOT NULL,
    SEX CHAR(1) NOT NULL,
    PHONE CHAR(10) NOT NULL,
    BIRTH DATE NOT NULL,
    ADDRESS VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(50) NOT NULL,
    CUSTOMER_PASSWD VARCHAR(30) NOT NULL,
    CUSTOMER_STATUS CHAR(1) NOT NULL DEFAULT '1',
	IDNO CHAR(10) NOT NULL,
    AVATAR LONGBLOB,
    CUSTOMER_POINT INT NOT NULL DEFAULT 0,
    CREATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP,
    UPDATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    PRIMARY KEY (CUSTOMER_ID)
) AUTO_INCREMENT=11001;

INSERT INTO CUSTOMER (CUSTOMER_NAME, NICKNAME, SEX, PHONE, BIRTH, ADDRESS, EMAIL, CUSTOMER_PASSWD, IDNO) 
    VALUES ('王小明', '小明', 0, '0913798893', '1990-01-01', '台北市中正區重慶南路一段122號', 'wang19000101@gmail.com', '123456', 'A123456789');
INSERT INTO CUSTOMER (CUSTOMER_NAME, NICKNAME, SEX, PHONE, BIRTH, ADDRESS, EMAIL, CUSTOMER_PASSWD, IDNO) 
    VALUES ('李志豪', '阿豪', 0, '0975886190', '1989-05-11', '台中市梧棲區臺灣大道十段168號', 'haoge9487@gmail.com', '123456', 'K948710591');
INSERT INTO CUSTOMER (CUSTOMER_NAME, NICKNAME, SEX, PHONE, BIRTH, ADDRESS, EMAIL, CUSTOMER_PASSWD, IDNO)
    VALUES ('黃品誼', 'EE', 1, '0971753321', '1996-12-25', '台南市東區大學路1號', 'yeeeeeeee11111@gmail.com', '123456', 'K246456997');
INSERT INTO CUSTOMER (CUSTOMER_NAME, NICKNAME, SEX, PHONE, BIRTH, ADDRESS, EMAIL, CUSTOMER_PASSWD, IDNO)
    VALUES ('李淑芬', '芬姐', 1, '0910096323', '1968-09-03', '桃園市桃園區南平路303號', 'fannylee168@gmail.com', '123456', 'H223066223');
INSERT INTO CUSTOMER (CUSTOMER_NAME, NICKNAME, SEX, PHONE, BIRTH, ADDRESS, EMAIL, CUSTOMER_PASSWD, IDNO)
    VALUES ('白居易', '白白', 0, '0988878987', '1976-02-26', '臺北市中正區中山南路21號', 'whitecat@gmail.com', '123456', 'A123456987');
INSERT INTO CUSTOMER (CUSTOMER_NAME, NICKNAME, SEX, PHONE, BIRTH, ADDRESS, EMAIL, CUSTOMER_PASSWD, IDNO)
    VALUES ('柯阿文', '柯P', 0, '0907788191', '2022-11-18', '新竹縣竹北市六家六街1巷3號2樓', 'doctorkowj@gmail.com', '123456', 'Q123456987');

-- 客服訊息 --
CREATE TABLE CS_MAIL (
	MAIL_ID	INT NOT NULL AUTO_INCREMENT,
	CUSTOMER_ID	  INT NOT NULL,
	TITLE		VARCHAR(50),
    CREATE_TIME DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    LAST_MSG_TIME DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CS_MAIL_STATUS CHAR(1) NOT NULL,
   
	PRIMARY KEY (MAIL_ID),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID)
) AUTO_INCREMENT = 51001;

INSERT INTO CS_MAIL (CUSTOMER_ID, TITLE, CS_MAIL_STATUS) VALUES (11001, '想問行程的問題', '0');
INSERT INTO CS_MAIL (CUSTOMER_ID, TITLE, CS_MAIL_STATUS) VALUES (11001, '我想取消訂單', '0');
INSERT INTO CS_MAIL (CUSTOMER_ID, TITLE, CS_MAIL_STATUS) VALUES (11002, '想問優惠券的問題', '0');

-- 客服訊息內文 --
CREATE TABLE CS_MESSAGE (
	MESSAGE_ID	INT NOT NULL AUTO_INCREMENT,
	MAIL_ID	  INT NOT NULL,
	CONTENT		LONGTEXT,
    CREATE_TIME DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    MESSAGE_FROM CHAR(1) NOT NULL,

	PRIMARY KEY (MESSAGE_ID),
	FOREIGN KEY (MAIL_ID) REFERENCES CS_MAIL (MAIL_ID)
) AUTO_INCREMENT = 1;

INSERT INTO CS_MESSAGE (MAIL_ID, CONTENT, MESSAGE_FROM) VALUES (51001, '請問連假有加開行程嗎？', '0');
INSERT INTO CS_MESSAGE (MAIL_ID, CONTENT, MESSAGE_FROM) VALUES (51001, '我想取消這筆訂單，訂單編號是XXX', '0');
INSERT INTO CS_MESSAGE (MAIL_ID, CONTENT, MESSAGE_FROM) VALUES (51002, '優惠券沒有使用成功，訂單編號是XXX', '0');

-- 客服訊息圖片 --
CREATE TABLE CS_IMG(
	IMG_ID   INT AUTO_INCREMENT NOT NULL,
	MESSAGE_ID   INT NOT NULL,
	IMG   LONGBLOB,
	CREATE_TIME DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (IMG_ID),
	FOREIGN KEY (MESSAGE_ID) REFERENCES CS_MESSAGE (MESSAGE_ID)
) AUTO_INCREMENT = 1;

INSERT INTO CS_IMG (MESSAGE_ID) VALUES (1), (1), (2);

-- 後臺角色 --
CREATE TABLE ROLES(
	ROLE_ID INT AUTO_INCREMENT,
    ROLE_NAME VARCHAR(20) NOT NULL UNIQUE,
    ROLE_DESCR VARCHAR(100),
    
    PRIMARY KEY (ROLE_ID)
) AUTO_INCREMENT = 1;

INSERT INTO ROLES (ROLE_NAME, ROLE_DESCR) VALUES ('管理員', 'superuser擁有所有權限');
INSERT INTO ROLES (ROLE_NAME, ROLE_DESCR) VALUES ('客服', '客服可查看訂單、客服系統');

-- 後臺功能 --
CREATE TABLE FUNC(
	FUNC_ID INT AUTO_INCREMENT,
    FUNC_NAME VARCHAR(20) NOT NULL UNIQUE,
    FUNC_DESCR VARCHAR(100),
    
    PRIMARY KEY (FUNC_ID)
) AUTO_INCREMENT = 1;

INSERT INTO FUNC (FUNC_NAME, FUNC_DESCR) VALUES ('後臺首頁', '後臺首頁');
INSERT INTO FUNC (FUNC_NAME, FUNC_DESCR) VALUES ('客服系統', '客服訊息查看與回覆');

-- 後臺使用者權限 (關係) --
CREATE TABLE ROLE_FUNC(
	ROLE_ID INT,
	FUNC_ID INT,
    CREATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (ROLE_ID, FUNC_ID),
    FOREIGN KEY (ROLE_ID) REFERENCES ROLES(ROLE_ID),
    FOREIGN KEY (FUNC_ID) REFERENCES FUNC(FUNC_ID)
);

INSERT INTO ROLE_FUNC (ROLE_ID, FUNC_ID) VALUES (1, 1);
INSERT INTO ROLE_FUNC (ROLE_ID, FUNC_ID) VALUES (1, 2);
INSERT INTO ROLE_FUNC (ROLE_ID, FUNC_ID) VALUES (2, 2);

-- 後臺使用者 --
CREATE TABLE USERS(
	USER_ID INT AUTO_INCREMENT,
    USERNAME VARCHAR(30) NOT NULL UNIQUE,
    USER_PASSWD VARCHAR(30) NOT NULL,
    ROLE_ID INT,
    USER_STATUS CHAR(1) NOT NULL DEFAULT '1',
    CREATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP,
    UPDATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    PRIMARY KEY (USER_ID),
    FOREIGN KEY (ROLE_ID) REFERENCES roles(ROLE_ID)
) AUTO_INCREMENT = 12001;

INSERT INTO USERS (USERNAME, USER_PASSWD, ROLE_ID) VALUES ('admin', '123456', 1);
INSERT INTO USERS (USERNAME, USER_PASSWD, ROLE_ID) VALUES ('cs123', '123456', 2);

-- 美食景點 --
CREATE TABLE FOODSCAPE (
	FOODSCAPE_ID INT AUTO_INCREMENT NOT NULL,
	FOODSCAPE_NAME VARCHAR(50) NOT NULL UNIQUE,
	PHONE CHAR(10) NOT NULL,
	ADDRESS VARCHAR(50) NOT NULL,
	CITY VARCHAR(6) NOT NULL,
	LNG DOUBLE(11,8) NOT NULL,
	LAT DOUBLE(10,8) NOT NULL,
	INTRO LONGTEXT,
	UPDATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOODSCAPE_STATUS CHAR(1) NOT NULL,
	CATEGORY VARCHAR(4) NOT NULL,
    
    PRIMARY KEY (FOODSCAPE_ID)
) AUTO_INCREMENT = 22001;

 INSERT INTO FOODSCAPE (FOODSCAPE_NAME, PHONE, ADDRESS, CITY, LNG, LAT, INTRO, FOODSCAPE_STATUS, CATEGORY) VALUES 
('一蘭拉麵', 0227583868, '臺北市信義區松仁路97號', '台北市', 121.5657062, 25.036286, '貴而且普普', 1, '美食'),
('台北101', 0281018800, '臺北市信義區市府路45號', '台北市', 121.5615184, 25.0338315, '觀景台可以看整個北市的夜景', 1, '景點'),
('故宮', 0228812021, '臺北市士林區至善路二段221號', '台北市', 121.5615184, 25.0338315, '國立故宮博物院是隸屬於中華民國行政院的中央二級機關', 1, '景點');

-- 營業時間 --
CREATE TABLE OPENTIME (
	OPENTIME_ID INT AUTO_INCREMENT NOT NULL,
	FOODSCAPE_ID INT NOT NULL,
	START_TIME TIME NOT NULL,
	END_TIME   TIME NOT NULL,
	OPENTIME_WEEK CHAR(1) NOT NULL,
    
    PRIMARY KEY (OPENTIME_ID),
	FOREIGN KEY (FOODSCAPE_ID) REFERENCES FOODSCAPE (FOODSCAPE_ID)
) AUTO_INCREMENT = 1;

INSERT INTO OPENTIME(FOODSCAPE_ID, START_TIME, END_TIME, OPENTIME_WEEK) VALUES (22001, '8:00', '11:00', 3), (22001, '15:00', '20:00', 3), (22002, '12:00', '21:00', 4);

-- 美食/景點圖片 (關係) --
CREATE TABLE FOODSCAPE_IMG(
	IMG_ID INT AUTO_INCREMENT NOT NULL,
	FOODSCAPE_ID INT NOT NULL,
	CREATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP,
	BLOG_IMG LONGBLOB,
    
    PRIMARY KEY (IMG_ID),
	FOREIGN KEY (FOODSCAPE_ID) REFERENCES FOODSCAPE (FOODSCAPE_ID)
) AUTO_INCREMENT = 1;

INSERT INTO FOODSCAPE_IMG(FOODSCAPE_ID) VALUES (22001), (22002), (22002);

-- 標籤 --
CREATE TABLE TAG (
	TAG_ID INT AUTO_INCREMENT NOT NULL,
	TAG_NAME VARCHAR(20) NOT NULL,
	UPDATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	PRIMARY KEY (TAG_ID)
) AUTO_INCREMENT = 21001;

INSERT INTO TAG (TAG_NAME) VALUES ('台北'), ('日式');

-- 美食/景點標籤(關係) --
CREATE TABLE FOODSCAPE_TAG(
	TAG_ID INT NOT NULL,
	FOODSCAPE_ID INT NOT NULL,
    
	PRIMARY KEY (TAG_ID, FOODSCAPE_ID),
	FOREIGN KEY (TAG_ID) REFERENCES TAG (TAG_ID),
	FOREIGN KEY (FOODSCAPE_ID) REFERENCES FOODSCAPE (FOODSCAPE_ID)
);

INSERT INTO FOODSCAPE_TAG(TAG_ID, FOODSCAPE_ID) VALUES (21001, 22001), (21001, 22002), (21002, 22001);

-- 行程 --
CREATE TABLE JOURNEY (
	JOURNEY_ID      INT NOT NULL AUTO_INCREMENT,
	JOURNEY_NAME    VARCHAR(50) NOT NULL,
	PRICE           INT NOT NULL,    
	CREATE_TIME     DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONTENT         LONGTEXT,
	AVG_SCORE       DOUBLE(2, 1) NOT NULL DEFAULT 0,
	SCORE_COUNT     INT NOT NULL DEFAULT 0,    
	DAYS            INT NOT NULL,    
	BUY_COUNT       INT NOT NULL DEFAULT 0,    
	JOURNEY_STATUS  CHAR(1) NOT NULL,

	CONSTRAINT JOURNEY_PK PRIMARY KEY (JOURNEY_ID)
) AUTO_INCREMENT = 23001;

INSERT INTO JOURNEY (JOURNEY_NAME, PRICE, CONTENT, AVG_SCORE, SCORE_COUNT, DAYS, BUY_COUNT, JOURNEY_STATUS) VALUES 
('陽明山一日遊', 2000, '走走吃吃', 0, 0, 1, 0, 0),
('台北三天兩夜美食旅', 15000, '爽吃', 4.1, 6, 3, 10, 1);

-- 行程-時間地點 (關係) -- 
CREATE TABLE JOURNEY_TIME_FOODSCAPE (
	JOURNEY_ID      INT NOT NULL,
	FOODSCAPE_ID    INT NOT NULL,
	START_TIME      DATETIME NOT NULL,
	END_TIME        DATETIME NOT NULL,
	NTH_DAY         INT NOT NULL,
	UPDATE_TIME     DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	CONSTRAINT JOURNEY_TIME_FOODSCAPE_PK PRIMARY KEY (JOURNEY_ID, FOODSCAPE_ID),
	CONSTRAINT JOURNEY_TIME_FOODSCAPE_FK1 FOREIGN KEY (JOURNEY_ID) REFERENCES JOURNEY (JOURNEY_ID),
	CONSTRAINT JOURNEY_TIME_FOODSCAPE_FK2 FOREIGN KEY (FOODSCAPE_ID) REFERENCES FOODSCAPE (FOODSCAPE_ID)
);

INSERT INTO JOURNEY_TIME_FOODSCAPE (JOURNEY_ID, FOODSCAPE_ID, START_TIME, END_TIME, NTH_DAY) VALUES 
(23001, 22001, '2023-09-28 10:00:00', '2023-09-29 12:00:00', 1),
(23001, 22002, '2023-09-28 14:00:00', '2023-09-29 17:00:00', 1),
(23002, 22002, '2023-09-29 12:30:00', '2023-09-29 17:30:00', 2);

-- 旅行團 --
CREATE TABLE TOUR_GROUP (
	GROUP_ID          INT NOT NULL AUTO_INCREMENT,
	JOURNEY_ID        INT NOT NULL,
	START_TIME        DATETIME NOT NULL,
	END_TIME          DATETIME NOT NULL,
	PRICE             INT NOT NULL,
	SIGNUP_NUM        INT NOT NULL,
	MIN_REQUIRED      INT NOT NULL,
	MAX_REQUIRED      INT NOT NULL,
	SIGNUP_DATE       DATETIME NOT NULL,
	DUE_DATE          DATETIME NOT NULL,
	CREATE_TIME       DATETIME DEFAULT CURRENT_TIMESTAMP,
	UPDATE_TIME       DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	CONSTRAINT TOUR_GROUP_PK PRIMARY KEY (GROUP_ID),
	CONSTRAINT TOUR_GROUP_FK FOREIGN KEY (JOURNEY_ID) REFERENCES JOURNEY (JOURNEY_ID)
) AUTO_INCREMENT = 24001;

INSERT INTO TOUR_GROUP (JOURNEY_ID, START_TIME, END_TIME, PRICE, SIGNUP_NUM, MIN_REQUIRED, MAX_REQUIRED, SIGNUP_DATE, DUE_DATE) VALUES 
(23001, '2023-09-28', '2023-09-28', 2000, 20, 15, 30, '2023-09-08 10:00:00', '2023-09-20 20:00:00'),
(23002, '2023-09-30', '2023-10-02', 15000, 30, 20, 100, '2023-09-01 10:00:00', '2023-09-20 23:00:00'),
(23002, '2023-09-29', '2023-10-02', 15000, 35, 25, 150, '2023-09-01 12:00:00', '2023-09-20 22:00:00');

-- 優惠券 --
CREATE TABLE COUPON (
	COUPON_ID INT NOT NULL AUTO_INCREMENT,
    SERIAL_NO VARCHAR(20) NOT NULL,
    COUPON_NAME VARCHAR(20) NOT NULL,
    DISCOUNT INT NOT NULL,
    THRESHOLD INT NOT NULL,
    START_TIME DATETIME NOT NULL,
    END_TIME DATETIME NOT NULL,
    STOCK INT NOT NULL,
    TOTAL INT NOT NULL,
    COUPON_STATUS CHAR NOT NULL DEFAULT '1',
    
    CONSTRAINT COUPON_PRIMARY_KEY PRIMARY KEY (COUPON_ID),
    CONSTRAINT COUPON_UNIQUE_KEY UNIQUE KEY (SERIAL_NO)
) AUTO_INCREMENT = 32001;

INSERT INTO COUPON (SERIAL_NO, COUPON_NAME, DISCOUNT, THRESHOLD, START_TIME, END_TIME, STOCK, TOTAL) VALUES ("54188","父親節優惠" , 888, 2000, "2023-08-01 00:00:00", "2023-08-09 00:00:00", 88888, 88888);
INSERT INTO COUPON (SERIAL_NO, COUPON_NAME, DISCOUNT, THRESHOLD, START_TIME, END_TIME, STOCK, TOTAL) VALUES ("1111","雙十一優惠" , 1111, 2000, "2023-11-01 00:00:00", "2023-11-12 00:00:00", 1111, 1111);

-- 會員_優惠券 --
CREATE TABLE CUSTOMER_COUPON(
	CUSTOMER_ID INT NOT NULL,
    COUPON_ID INT NOT NULL,
    COUPON_STATUS CHAR(1) NOT NULL DEFAULT '0',
    CREATE_TIME DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATE_TIME DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT COSTOMER_COUPON_PRIMARY_KEY PRIMARY KEY (CUSTOMER_ID, COUPON_ID),
	CONSTRAINT COSTOMER_COUPON_FOREIGN_KEY1 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    CONSTRAINT COSTOMER_COUPON_FOREIGN_KEY2 FOREIGN KEY (COUPON_ID) REFERENCES COUPON(COUPON_ID)
);

INSERT INTO CUSTOMER_COUPON (CUSTOMER_ID, COUPON_ID) VALUES (11001, 32001);
INSERT INTO CUSTOMER_COUPON (CUSTOMER_ID, COUPON_ID) VALUES (11002, 32001);
INSERT INTO CUSTOMER_COUPON (CUSTOMER_ID, COUPON_ID) VALUES (11002, 32002);

-- 訂單 --
CREATE TABLE ORDERS(
	ORDER_ID INT AUTO_INCREMENT NOT NULL,
    CUSTOMER_ID INT NOT NULL,
    GROUP_ID INT NOT NULL,
    CREATE_TIME DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PAID_TIME DATETIME,
    TOTAL_AMT INT NOT NULL,
    ORDER_STATUS  CHAR(1) NOT NULL,
    CUSTOMER_POINT INT NOT NULL,
    COUPON_ID INT,
    TOURIST INT,
    CONTENT LONGTEXT,
    CONTENT_TIME DATETIME,
    SCORE DOUBLE,
    ORDER_NO varchar(30),

    CONSTRAINT ORDERS_PRIMARY_KEY PRIMARY KEY (ORDER_ID),
	CONSTRAINT ORDERS_FOREIGN_KEY1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
	CONSTRAINT ORDERS_FOREIGN_KEY2 FOREIGN KEY(GROUP_ID) REFERENCES TOUR_GROUP(GROUP_ID),
	CONSTRAINT ORDERS_FOREIGN_KEY3 FOREIGN KEY(COUPON_ID) REFERENCES COUPON(COUPON_ID) 
) AUTO_INCREMENT = 31001;

INSERT INTO ORDERS (CUSTOMER_ID, GROUP_ID, TOTAL_AMT, ORDER_STATUS, CUSTOMER_POINT, COUPON_ID, TOURIST, ORDER_NO) VALUES (11001, 24001, 3000, 0, 0, 32001, 1, 2024110801);
INSERT INTO ORDERS (CUSTOMER_ID, GROUP_ID, TOTAL_AMT, ORDER_STATUS, CUSTOMER_POINT, COUPON_ID, TOURIST, ORDER_NO) VALUES (11002, 24002, 6000, 1, 50, 32002, 4, 2024110802);


-- 旅客明細 --
CREATE TABLE PASSENGER(
	PASSENGER_ID INT NOT NULL AUTO_INCREMENT,
    ORDER_ID INT NOT NULL,
    IDNO CHAR(10) NOT NULL,
    PASSENGER_NAME VARCHAR(20) NOT NULL,
    PHONE CHAR(10) NOT NULL,
    BIRTH DATE NOT NULL,
    
    CONSTRAINT PASSENGER_PRIMARY_KEY PRIMARY KEY (PASSENGER_ID),
    CONSTRAINT PASSENGER_FOREIGN_KEY FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
) AUTO_INCREMENT = 1;

INSERT INTO PASSENGER (ORDER_ID, IDNO, PASSENGER_NAME, PHONE, BIRTH) VALUES (31001, "A123456789","王小民", "0912345678", "1911-01-01");
INSERT INTO PASSENGER (ORDER_ID, IDNO, PASSENGER_NAME, PHONE, BIRTH) VALUES (31001, "A334433356","王二民", "0933542448", "1911-02-02");
INSERT INTO PASSENGER (ORDER_ID, IDNO, PASSENGER_NAME, PHONE, BIRTH) VALUES (31002, "A334433356","王二民", "0933542448", "1911-02-02");

-- 部落格文章 --
CREATE TABLE BLOG (
	BLOG_ID	INT AUTO_INCREMENT NOT NULL,
	TITLE VARCHAR(50) NOT NULL,
	CUSTOMER_ID INT NOT NULL,
    BLOG_DATE DATETIME NOT NULL,
    CONTENT LONGTEXT,
    UPDATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CREATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP,
    LIKE_SUM INT,
    VIEW_SUM INT,
    CL_SUM INT,
    IMG LONGBLOB,
    BLOG_STATUS CHAR NOT NULL DEFAULT '1',
    
    PRIMARY KEY (BLOG_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID)
) AUTO_INCREMENT = 41001;

INSERT INTO BLOG (TITLE, CUSTOMER_ID, BLOG_DATE, CONTENT) VALUES ('中山區拉麵推薦', 11001, '2023-10-09', 'abc');
INSERT INTO BLOG (TITLE, CUSTOMER_ID, BLOG_DATE, CONTENT) VALUES ('台南必吃牛肉湯', 11002, '2023-08-12', 'xxx');

-- 美食/景點 對 部落格文章 (關係) --
CREATE TABLE FOODSCAPE_BLOG(
	FOODSCAPE_ID INT NOT NULL,
	BLOG_ID INT NOT NULL,
    
	PRIMARY KEY (FOODSCAPE_ID, BLOG_ID),
	FOREIGN KEY (FOODSCAPE_ID) REFERENCES FOODSCAPE (FOODSCAPE_ID),
	FOREIGN KEY (BLOG_ID) REFERENCES BLOG (BLOG_ID)
);

INSERT INTO FOODSCAPE_BLOG(FOODSCAPE_ID, BLOG_ID) VALUES (22001, 41001), (22002, 41001), (22002, 41002);

-- 文章留言 --
CREATE TABLE BLOG_MSG(
	BLOG_MSG_ID   INT AUTO_INCREMENT NOT NULL,
	CONTENT   LONGTEXT,
	BLOG_ID   INT NOT NULL,
	CUSTOMER_ID  INT NOT NULL,
	CREATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (BLOG_MSG_ID),
    FOREIGN KEY (BLOG_ID) REFERENCES BLOG (BLOG_ID),
 	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID)
) AUTO_INCREMENT = 1;

INSERT INTO BLOG_MSG (CONTENT, BLOG_ID, CUSTOMER_ID) VALUES ('hi', 41001, 11002);
INSERT INTO BLOG_MSG (CONTENT, BLOG_ID, CUSTOMER_ID) VALUES ('hello', 41001, 11002);

-- 內文圖片 --
CREATE TABLE BLOG_IMG(
	BLOG_IMG_ID   INT AUTO_INCREMENT NOT NULL,
	BLOG_ID   INT NOT NULL,
	CREATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP,
	IMG  LONGBLOB,
    
    PRIMARY KEY (BLOG_IMG_ID),
	FOREIGN KEY (BLOG_ID) REFERENCES BLOG (BLOG_ID)
) AUTO_INCREMENT = 1;

INSERT INTO BLOG_IMG (BLOG_ID) VALUES (41001);
INSERT INTO BLOG_IMG (BLOG_ID) VALUES (41002);
INSERT INTO BLOG_IMG (BLOG_ID) VALUES (41002);

-- 文章按讚 --
CREATE TABLE BLOG_LIKE(
	BLOG_LIKE_ID  INT AUTO_INCREMENT NOT NULL,
	CUSTOMER_ID   INT NOT NULL,
	CREATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	BLOG_ID  INT NOT NULL,
    BLOG_LIKE_STATUS CHAR(1) NOT NULL DEFAULT '1',
    
    PRIMARY KEY (BLOG_LIKE_ID),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID),
	FOREIGN KEY (BLOG_ID) REFERENCES BLOG (BLOG_ID)
) AUTO_INCREMENT = 1;

INSERT INTO BLOG_LIKE (CUSTOMER_ID, BLOG_ID) VALUES (11001, 41001);
INSERT INTO BLOG_LIKE (CUSTOMER_ID, BLOG_ID) VALUES (11002, 41001);
INSERT INTO BLOG_LIKE (CUSTOMER_ID, BLOG_ID) VALUES (11002, 41002);

-- 文章收藏 --
CREATE TABLE BLOG_CL(
	BLOG_CL_ID INT AUTO_INCREMENT NOT NULL,
	CUSTOMER_ID INT NOT NULL,
	LIKE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	BLOG_ID INT NOT NULL,
    BLOG_CL_STATUS CHAR(1) NOT NULL DEFAULT '1',
    
    PRIMARY KEY (BLOG_CL_ID),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
	FOREIGN KEY (BLOG_ID) REFERENCES BLOG (BLOG_ID)
) AUTO_INCREMENT = 42001;

INSERT INTO BLOG_CL(CUSTOMER_ID, BLOG_ID) VALUES (11001, 41001);
INSERT INTO BLOG_CL(CUSTOMER_ID, BLOG_ID) VALUES (11002, 41001);
INSERT INTO BLOG_CL(CUSTOMER_ID, BLOG_ID) VALUES (11002, 41002);

-- 文章對標籤 --
CREATE TABLE BLOG_TAG(
	BLOG_ID  INT NOT NULL,
	TAG_ID   INT NOT NULL,
    
    PRIMARY KEY (BLOG_ID, TAG_ID),
	FOREIGN KEY (BLOG_ID) REFERENCES BLOG (BLOG_ID),
	FOREIGN KEY (TAG_ID) REFERENCES TAG (TAG_ID)
);

INSERT INTO BLOG_TAG VALUES (1, 1);
INSERT INTO BLOG_TAG VALUES (2, 1);
INSERT INTO BLOG_TAG VALUES (2, 2);
