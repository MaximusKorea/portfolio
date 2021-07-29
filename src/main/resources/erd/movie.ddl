/**********************************/
/* 테이블 삭제 */
/**********************************/
drop table Movie_Rental;
drop table mv_schedule;
drop table Review;
drop table Point;
drop table Reservation;
drop table ProductOrder;
drop table Product;
drop table Movie;
drop table Member;
drop table Board;





/**********************************/
/* Table Name: 게시판 */
/**********************************/
CREATE TABLE Board(
		board_no                      		NUMBER(10)		 NOT NULL,				/*게시판번호*/
		board_title                   		VARCHAR2(200)		 NULL ,					/*제목*/
		board_writer                  		VARCHAR2(30)		 NULL ,					/*작성자*/
		board_content                 		VARCHAR2(3000)		 NULL ,					/*게시글*/
		board_regDate                 		DATE		 	 NULL ,					/*작성일*/
		board_type                    		VARCHAR2(20)		 NULL ,					/*게시판타입*/
		board_image                   		VARCHAR2(50)		 NULL , 					/*이미지*/
		readCount							NUMBER(10,0)		 NULL ,	/*조회수*/
		board_groupno						NUMBER(10,0)		 NULL ,		/*그룹번호*/
		board_step							NUMBER(10,0)		 NULL ,	/*그룹내의 순서, 부모 게시글에 소속된 게시글의 순서*/
		board_depth							NUMBER(10,0)		 NULL 	/*답글 depth*/
);

CREATE SEQUENCE BOARD_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE Member(
		m_no                          		NUMBER(10)		 NOT NULL,				/*회원번호*/
		m_id                          		VARCHAR2(20)		 NULL ,					/*회원아이디*/
		m_password                    		VARCHAR2(20)		 NULL ,					/*회원비밀번호*/
		m_name                        		VARCHAR2(20)		 NULL ,					/*회원이름*/
		m_birth                       		VARCHAR2(10)		 NULL ,					/*회원생일*/
		m_phone                       		VARCHAR2(20)		 NULL ,					/*회원전화번호*/
		m_zipcode                     		VARCHAR2(10)		 NULL ,					/*우편번호*/
		m_address1                    		VARCHAR2(100)		 NULL ,					/*주소*/
		m_address2                    		VARCHAR2(30)		 NULL ,					/*상세주소*/
		m_email                       		VARCHAR2(20)		 NULL ,					/*이메일*/
		m_point                       		NUMBER(10)		 	 NULL 				/*포인트*/
);

CREATE SEQUENCE Member_m_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


/**********************************/
/* Table Name: 영화 */
/**********************************/
CREATE TABLE Movie(
		mv_no                         		NUMBER(10)		 NOT NULL,				/*영화번호*/
		mv_state                      		VARCHAR2(30)		 NULL ,					/*제작국가*/
		mv_reserveRate                		VARCHAR2(10)		 NULL ,					/*예매비율*/
		mv_name                       		VARCHAR2(100)		 NULL ,					/*영화명*/
		mv_director                   		VARCHAR2(30)		 NULL ,					/*감독*/
		mv_actor                      		VARCHAR2(100)		 NULL ,					/*배우*/
		mv_runTime                    		VARCHAR2(20)		 NULL ,					/*상영시간*/
		mv_info                       		VARCHAR2(1000)		 NULL ,					/*영화정보*/
		mv_date                       		DATE		 	 NULL ,					/*개봉날짜*/
		mv_age                        		VARCHAR2(10)		 NULL ,					/*관람가*/
		mv_image                      		VARCHAR2(100)		 NULL ,					/*영화이미지*/
		mv_trailer                    		VARCHAR2(300)		 NULL ,					/*트레일러*/
		mv_genre                      		VARCHAR2(30)		 NULL 					/*장르*/
);

CREATE SEQUENCE Movie_mv_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


/**********************************/
/* Table Name: 상품 */
/**********************************/
CREATE TABLE Product(
		p_no                          		NUMBER(10)		 NOT NULL,				/*상품번호*/
		p_name                        		VARCHAR2(30)		 NULL ,					/*상품명*/
		p_image                       		VARCHAR2(30)		 NULL ,					/*상품이미지*/
		p_price                       		NUMBER(10)		 	 NULL ,				/*상품가격*/
		p_content                     		VARCHAR2(300)		 NULL ,					/*상품설명*/
		p_desc                        		NUMBER(10)			 NULL ,				/*상품재고*/
		p_type                        		NUMBER(10)			 NULL 				/*상품분류*/
);

CREATE SEQUENCE PRODUCT_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;


/**********************************/
/* Table Name: 상품주문 */
/**********************************/
CREATE TABLE ProductOrder (
		po_no								NUMBER(10)		 NOT NULL,	/*상품주문번호*/
		po_count							NUMBER(10)			 NULL ,		/*상품수량*/
		po_date								DATE			 NULL ,		/*상품주문날짜*/
		p_tot								NUMBER(10)			 NULL ,	/*총합계*/
		p_no								NUMBER(10)			 NULL ,	/*상품번호*/
		m_no								NUMBER(10)			 NULL	/*회원번호*/
);

CREATE SEQUENCE PRODUCT_po_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;


/**********************************/
/* Table Name: 예매 */
/**********************************/
CREATE TABLE Reservation(
		r_no                          		NUMBER(10)		 NOT NULL,					/*예매번호*/
		r_theater                     		VARCHAR2(10)		 NULL ,						/*상영관*/
		r_viewDate                    		DATE		 	 NULL ,						/*개봉일*/
		r_time                        		VARCHAR2(20)		 NULL ,						/*시작시간*/
		r_price                       		NUMBER(10)			 NULL ,					/*금액*/
		r_persons                     		NUMBER(10)			 NULL ,					/*관람인원수*/
		r_seat                        		VARCHAR2(100)		 NULL ,						/*좌석번호*/
		r_age                         		VARCHAR2(20)		 NULL ,						/*관람가등급*/
		mv_no                          		NUMBER(10)			 NULL ,					/*영화번호*/
		m_no                          		NUMBER(10)			 NULL 					/*회원번호*/
);

CREATE SEQUENCE RESERVATION_r_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;


/**********************************/
/* Table Name: 포인트 */
/**********************************/
CREATE TABLE Point(
		pt_no								NUMBER(10)		 NOT NULL ,	/*포인트번호*/
		pt_point							NUMBER(10)			 NULL ,		/*잔여포인트*/
		pt_date                       		DATE		 	 NULL ,						/*날짜*/
		pt_usedpoint						NUMBER(10)			 NULL ,		/*사용포인트*/
		pt_type								VARCHAR2(10)		 NULL ,		/*적립분류*/
		pt_str								VARCHAR2(100)		 NULL ,		/*적립내용*/
		m_no                          		NUMBER(10)			 NULL					/*회원번호*/
);

CREATE SEQUENCE POINT_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


/**********************************/
/* Table Name: 리뷰 */
/**********************************/
CREATE TABLE Review(
		rev_no                        		NUMBER(10)		 NOT NULL,					/*리뷰번호*/
		rev_title                     		VARCHAR2(100)		 NULL ,						/*리뷰제목*/
		rev_content                   		VARCHAR2(1000)		 NULL ,						/*리뷰내용*/
		rev_date                      		DATE		 	 NULL ,						/*리뷰날짜*/
		rev_rating							NUMBER(10,0)	 	 NULL,		/*리뷰평점*/
		rev_count							NUMBER(10,0)	 	 NULL,		/*리뷰카운트*/
		m_no                          		NUMBER(10)		 	 NULL ,					/*회원번호*/
		mv_no                         		NUMBER(10)		 	 NULL 					/*영화번호*/
);

CREATE SEQUENCE REVIEW_rev_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;


/**********************************/
/* Table Name: 영화스케쥴 */
/**********************************/
CREATE TABLE mv_schedule(
		mvs_theater                   		VARCHAR2(10)		 NULL ,						/*상영관*/
		mvs_date                      		VARCHAR2(20)		 NULL ,						/*날짜*/
		mvs_time                      		VARCHAR2(20)		 NULL ,						/*시작시간*/
		mv_no                         		NUMBER(10)		 	 NULL 					/*영화번호*/
);


/**********************************/
/* Table Name: 영화대여 */
/**********************************/
CREATE TABLE Movie_Rental(
		mv_rt_no                         	NUMBER(10)		 NOT NULL,				/*영화대여번호*/
		mv_rt_state                      	VARCHAR2(30)		 NULL ,					/*제작국가*/
		mv_rt_reserveRate                	VARCHAR2(10)		 NULL ,					/*예매비율*/
		mv_rt_name                       	VARCHAR2(100)		 NULL ,					/*영화명*/
		mv_rt_director                   	VARCHAR2(30)		 NULL ,					/*감독*/
		mv_rt_actor                      	VARCHAR2(100)		 NULL ,					/*배우*/
		mv_rt_runTime                    	VARCHAR2(20)		 NULL ,					/*상영시간*/
		mv_rt_info                       		VARCHAR2(1000)		 NULL ,					/*영화정보*/
		mv_rt_date                       	DATE		 	 NULL ,					/*개봉날짜*/
		mv_rt_age                        	VARCHAR2(10)		 NULL ,					/*관람가*/
		mv_rt_image                      	VARCHAR2(100)		 NULL ,					/*영화이미지*/
		mv_rt_trailer                    		VARCHAR2(300)		 NULL ,					/*트레일러*/
		mv_rt_genre                      	VARCHAR2(30)		 NULL 					/*장르*/
);

CREATE SEQUENCE Movie_mv_rt_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



/************************************************/
/* PK, Foreign key(다른테이블과 연결) */
/************************************************/
ALTER TABLE Board ADD CONSTRAINT IDX_Board_PK PRIMARY KEY (board_no);

ALTER TABLE Member ADD CONSTRAINT IDX_Member_PK PRIMARY KEY (m_no);

ALTER TABLE Movie ADD CONSTRAINT IDX_Movie_PK PRIMARY KEY (mv_no);

ALTER TABLE Product ADD CONSTRAINT IDX_Product_PK PRIMARY KEY (p_no);

ALTER TABLE ProductOrder ADD CONSTRAINT IDX_ProductOrder_PK PRIMARY KEY (po_no);
ALTER TABLE ProductOrder ADD CONSTRAINT IDX_ProductOrder_FK0 FOREIGN KEY (m_no) REFERENCES Member (m_no);
ALTER TABLE ProductOrder ADD CONSTRAINT IDX_ProductOrder_FK1 FOREIGN KEY (p_no) REFERENCES Product (p_no);

ALTER TABLE Reservation ADD CONSTRAINT IDX_Reservation_PK PRIMARY KEY (r_no);
ALTER TABLE Reservation ADD CONSTRAINT IDX_Reservation_FK0 FOREIGN KEY (m_no) REFERENCES Member (m_no);
ALTER TABLE Reservation ADD CONSTRAINT IDX_Reservation_FK1 FOREIGN KEY (mv_no) REFERENCES Movie (mv_no);

ALTER TABLE Point ADD CONSTRAINT IDX_Point_PK PRIMARY KEY (pt_no);
ALTER TABLE Point ADD CONSTRAINT IDX_Point_FK0 FOREIGN KEY (m_no) REFERENCES Member (m_no);;

ALTER TABLE Review ADD CONSTRAINT IDX_Review_PK PRIMARY KEY (rev_no);
ALTER TABLE Review ADD CONSTRAINT IDX_Review_FK0 FOREIGN KEY (m_no) REFERENCES Member (m_no);
ALTER TABLE Review ADD CONSTRAINT IDX_Review_FK1 FOREIGN KEY (mv_no) REFERENCES Movie (mv_no);

ALTER TABLE Movie_Rental ADD CONSTRAINT IDX_Movie_Rental_PK PRIMARY KEY (mv_rt_no);




/**********************************/
/* 시퀀스 초기화 */
/**********************************/
drop sequence BOARD_no_seq;
drop sequence Member_m_no_seq;
drop sequence Movie_mv_no_seq;
drop sequence PRODUCT_no_seq;
drop sequence PRODUCT_po_no_seq;
drop sequence RESERVATION_r_no_seq;
drop sequence POINT_no_seq;
drop sequence REVIEW_rev_no_seq;
drop sequence Movie_mv_rt_no_seq;

/**********************************/
/* 시퀀스 생성 */
/**********************************/
CREATE SEQUENCE BOARD_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;
CREATE SEQUENCE Member_m_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;
CREATE SEQUENCE Movie_mv_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;
CREATE SEQUENCE PRODUCT_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;
CREATE SEQUENCE PRODUCT_po_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;
CREATE SEQUENCE RESERVATION_r_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;
CREATE SEQUENCE POINT_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;
CREATE SEQUENCE REVIEW_rev_no_seq NOMAXVALUE NOCACHE NOORDER NOCYCLE;
CREATE SEQUENCE Movie_mv_rt_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

/**********************************/
/* 컬럼 사이즈 변경 */
/**********************************/
ALTER TABLE RESERVATION MODIFY(R_SEAT VARCHAR2(100));



/**********************************/
/* 테스트 데이타 */
/**********************************/
/* BOARD */
Insert into BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_REGDATE,BOARD_TYPE,BOARD_IMAGE,READCOUNT,BOARD_GROUPNO,BOARD_STEP,BOARD_DEPTH) values (2,'3','관리자','이번 이벤트는 언제합니다',to_date('21/04/09','RR/MM/DD'),'Event','images/tick1.png',23,2,1,0);
Insert into BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_REGDATE,BOARD_TYPE,BOARD_IMAGE,READCOUNT,BOARD_GROUPNO,BOARD_STEP,BOARD_DEPTH) values (3,'222','관리자','333',to_date('21/04/14','RR/MM/DD'),'Notice','imageRoot',20,3,1,0);
Insert into BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_REGDATE,BOARD_TYPE,BOARD_IMAGE,READCOUNT,BOARD_GROUPNO,BOARD_STEP,BOARD_DEPTH) values (4,'11','관리자','11',to_date('21/04/14','RR/MM/DD'),'Notice','imageRoot',2,4,1,0);
Insert into BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_REGDATE,BOARD_TYPE,BOARD_IMAGE,READCOUNT,BOARD_GROUPNO,BOARD_STEP,BOARD_DEPTH) values (5,'22','관리자','22',to_date('21/04/14','RR/MM/DD'),'Notice','imageRoot',9,5,1,0);
Insert into BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_REGDATE,BOARD_TYPE,BOARD_IMAGE,READCOUNT,BOARD_GROUPNO,BOARD_STEP,BOARD_DEPTH) values (6,'33','관리자','33',to_date('21/04/14','RR/MM/DD'),'Notice','imageRoot',5,6,1,0);
Insert into BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_REGDATE,BOARD_TYPE,BOARD_IMAGE,READCOUNT,BOARD_GROUPNO,BOARD_STEP,BOARD_DEPTH) values (7,'44','관리자','44',to_date('21/04/14','RR/MM/DD'),'Notice','imageRoot',5,7,1,0);
Insert into BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_REGDATE,BOARD_TYPE,BOARD_IMAGE,READCOUNT,BOARD_GROUPNO,BOARD_STEP,BOARD_DEPTH) values (8,'55','관리자','55',to_date('21/04/14','RR/MM/DD'),'Notice','imageRoot',115,8,1,0);
Insert into BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_REGDATE,BOARD_TYPE,BOARD_IMAGE,READCOUNT,BOARD_GROUPNO,BOARD_STEP,BOARD_DEPTH) values (9,'[답변]55','admin','>>55',to_date('21/04/15','RR/MM/DD'),'Notice','imageRoot',42,8,2,1);
Insert into BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_REGDATE,BOARD_TYPE,BOARD_IMAGE,READCOUNT,BOARD_GROUPNO,BOARD_STEP,BOARD_DEPTH) values (1,'1:1문의드립니다_1','user11','안녕하세요',to_date('21/04/09','RR/MM/DD'),'1:1','imageRoot',45,1,1,0);

/* MEMBER */
Insert into MEMBER (M_NO,M_ID,M_PASSWORD,M_NAME,M_BIRTH,M_PHONE,M_ZIPCODE,M_ADDRESS1,M_ADDRESS2,M_EMAIL,M_POINT) values (1,'admin','111111','관리자','2000-01-01','01033334444','06214','서울 강남구 언주로 408','11','youiwill1@gmail.com',1000);
Insert into MEMBER (M_NO,M_ID,M_PASSWORD,M_NAME,M_BIRTH,M_PHONE,M_ZIPCODE,M_ADDRESS1,M_ADDRESS2,M_EMAIL,M_POINT) values (2,'user11','111111','사용자','1990/01/01','01011112222','06801','서울 서초구 능안말길 1-4','33','youiwill1@gmail.com',1000);
Insert into MEMBER (M_NO,M_ID,M_PASSWORD,M_NAME,M_BIRTH,M_PHONE,M_ZIPCODE,M_ADDRESS1,M_ADDRESS2,M_EMAIL,M_POINT) values (22,'1745400635',null,'한세일',null,null,null,null,null,'youiwill1@gmail.com',1000);

/* MOVIE */
Insert into MOVIE (MV_NO,MV_STATE,MV_RESERVERATE,MV_NAME,MV_DIRECTOR,MV_ACTOR,MV_RUNTIME,MV_INFO,MV_DATE,MV_AGE,MV_IMAGE,MV_TRAILER,MV_GENRE) values (8,'미국','50','매트릭스4','라나 워쇼스키','키아누 리브스','120','2003년 매트릭스 3편 개봉 이후 무려 18년 만에 돌아오는 매트릭스 시리즈의 네 번째 작품',to_date('21/12/16','RR/MM/DD'),'15세','images/matrix4.jpg','https://www.youtube.com/embed/MldbRLuzGnI','SF');
Insert into MOVIE (MV_NO,MV_STATE,MV_RESERVERATE,MV_NAME,MV_DIRECTOR,MV_ACTOR,MV_RUNTIME,MV_INFO,MV_DATE,MV_AGE,MV_IMAGE,MV_TRAILER,MV_GENRE) values (10,'미국','00','샹치와 텐 링즈의 전설','데스틴 대니얼 크레턴','시무 리우','120','마블 시네마틱 유니버스 페이즈 4의 2번째 영화이며 샹치의 첫 실사 영화이다.',to_date('21/09/03','RR/MM/DD'),'12세','images/shangchi.jpg','https://www.youtube.com/embed/giWIr7U1deA','액션');
Insert into MOVIE (MV_NO,MV_STATE,MV_RESERVERATE,MV_NAME,MV_DIRECTOR,MV_ACTOR,MV_RUNTIME,MV_INFO,MV_DATE,MV_AGE,MV_IMAGE,MV_TRAILER,MV_GENRE) values (6,'미국','50','블랙 위도우','케이트 쇼트랜드','스칼렛 요한슨','133','어벤져스 블랙 위도우',to_date('21/07/09','RR/MM/DD'),'19세','images/blackwidow.jpg','https://www.youtube.com/embed/11nQ2Z8LyII','액션');
Insert into MOVIE (MV_NO,MV_STATE,MV_RESERVERATE,MV_NAME,MV_DIRECTOR,MV_ACTOR,MV_RUNTIME,MV_INFO,MV_DATE,MV_AGE,MV_IMAGE,MV_TRAILER,MV_GENRE) values (9,'미국','00','007 노 타임 투 다이','캐리 후쿠나가','대니얼 크레이그','163','현역을 떠난 본드는 자메이카에서 평온한 삶을 즐기고 있다. 하지만 그의 옛 동료 펠릭스 라이터가 도움을 요청하기 위해 본드를 찾아오면서 그의 평온했던 삶은 깨져버린다. 납치된 과학자를 구조하기 위한 미션이 예상과 다르게 진행되면서 본드는 위험한 신기술로 무장한 악당과 맞닥뜨리게 된다',to_date('21/09/30','RR/MM/DD'),'19세','images/no time to die.jpg','https://www.youtube.com/embed/PSpgQfVbMXA','느와르');
Insert into MOVIE (MV_NO,MV_STATE,MV_RESERVERATE,MV_NAME,MV_DIRECTOR,MV_ACTOR,MV_RUNTIME,MV_INFO,MV_DATE,MV_AGE,MV_IMAGE,MV_TRAILER,MV_GENRE) values (11,'미국','00','탑건 매버릭','조셉 코신스키','톰 크루즈','135','인공지능 무인기와 인간이 조종하는 최신예 전투기의 대결',to_date('21/11/19','RR/MM/DD'),'19세','images/topgun2.jpg','https://www.youtube.com/embed/gNtJ4HdMavo','전쟁');

/* MOVIE_RENTAL */
Insert into MOVIE_RENTAL (MV_RT_NO,MV_RT_STATE,MV_RT_RESERVERATE,MV_RT_NAME,MV_RT_DIRECTOR,MV_RT_ACTOR,MV_RT_RUNTIME,MV_RT_INFO,MV_RT_DATE,MV_RT_AGE,MV_RT_IMAGE,MV_RT_TRAILER,MV_RT_GENRE) values (1,'미국','0','존윅3','채드 스타헬스키','키아누 리브스','131','평화를 원한다면 전쟁을 준비하라! 현상금 1,400만 달러!, 전 세계 킬러들이 노리는 단 하나의 타깃 업계 레전드 킬러 ‘존 윅’은 국제암살자연합을 통해 파문조치를 당한 후 그에게 따라 붙은 역대 최고의 현상금 1,400만 불로 인해전 세계의 가장 위협적인 킬러들이 그와의 전쟁을 선포한다.',to_date('19/05/09','RR/MM/DD'),'19세','images/JohnWick3.jpg','https://www.youtube.com/embed/FMxbzIThWNA','액션');
Insert into MOVIE_RENTAL (MV_RT_NO,MV_RT_STATE,MV_RT_RESERVERATE,MV_RT_NAME,MV_RT_DIRECTOR,MV_RT_ACTOR,MV_RT_RUNTIME,MV_RT_INFO,MV_RT_DATE,MV_RT_AGE,MV_RT_IMAGE,MV_RT_TRAILER,MV_RT_GENRE) values (2,'미국','0','해리포터와 마법사의 돌','크리스 콜럼버스','다니엘 래드클리프, 엠마 왓슨','152','해리 포터와 마법사의 돌은 2001년 J. K. 롤링의 동명 소설을 원작으로 하여 만든, 영국과 미국 합작, 판타지 영화이다. 8부작 중 첫 번째에 해당하는 작품이다. 크리스 콜럼버스가 감독을 맡았다. 역대 영화 흥행 순위 중 8위에 들어가는 작품이다.',to_date('01/12/14','RR/MM/DD'),'12세','images/PotterandthePhilosophersStone.jpg','https://www.youtube.com/embed/524LTjLx9x0','판타지');
Insert into MOVIE_RENTAL (MV_RT_NO,MV_RT_STATE,MV_RT_RESERVERATE,MV_RT_NAME,MV_RT_DIRECTOR,MV_RT_ACTOR,MV_RT_RUNTIME,MV_RT_INFO,MV_RT_DATE,MV_RT_AGE,MV_RT_IMAGE,MV_RT_TRAILER,MV_RT_GENRE) values (4,'미국','0','본아이덴티티','더그 라이먼','맷 데이먼','119','그는 자신이 어떠한 사람 이었는지 자신의 과거를 찾아 가면 찾아 갈수록 수수께끼 같은 미궁 속으로 빠져드는 음모와 가공할 위협이 그를 기다리고 있는 것을 알게 되는데…',to_date('02/10/18','RR/MM/DD'),'12세','images/TheBourneIdentity.jpg','https://www.youtube.com/embed/XFK8TlhKFhY','액션');

/* MV_SCHEDULE */
Insert into MV_SCHEDULE (MVS_THEATER,MVS_DATE,MVS_TIME,MV_NO) values ('1관','2021-06-11','18:00',6);
Insert into MV_SCHEDULE (MVS_THEATER,MVS_DATE,MVS_TIME,MV_NO) values ('2관','2021-06-11','12:00',8);
Insert into MV_SCHEDULE (MVS_THEATER,MVS_DATE,MVS_TIME,MV_NO) values ('1관','2021-07-01','12:00',8);

/* POINT */
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (1,1000,to_date('21/04/08','RR/MM/DD'),1000,'0','회원가입',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (3,1000,to_date('21/04/09','RR/MM/DD'),1000,'0','회원가입',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (27,3600,to_date('21/05/31','RR/MM/DD'),900,'1','영화예매',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (4,1900,to_date('21/04/09','RR/MM/DD'),900,'1','영화예매',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (28,4400,to_date('21/05/31','RR/MM/DD'),800,'1','영화예매',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (6,1000,to_date('21/04/10','RR/MM/DD'),900,'2','예매취소',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (38,1000,to_date('21/05/31','RR/MM/DD'),1000,'0','회원가입',22);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (26,2700,to_date('21/05/31','RR/MM/DD'),1700,'1','영화예매',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (40,6600,to_date('21/06/07','RR/MM/DD'),2700,'1','영화예매',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (31,12900,to_date('21/05/31','RR/MM/DD'),8500,'1','영화예매',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (39,1900,to_date('21/06/07','RR/MM/DD'),900,'1','영화예매',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (32,3900,to_date('21/05/31','RR/MM/DD'),9000,'2','영화예매',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (41,2800,to_date('21/06/08','RR/MM/DD'),900,'1','영화예매',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (42,1900,to_date('21/06/08','RR/MM/DD'),900,'2','예매취소',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (43,1000,to_date('21/06/08','RR/MM/DD'),900,'2','예매취소',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (44,3900,to_date('21/06/08','RR/MM/DD'),2700,'2','예매취소',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (45,4800,to_date('21/06/08','RR/MM/DD'),900,'1','영화예매',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (46,5700,to_date('21/06/08','RR/MM/DD'),900,'1','영화예매',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (47,4800,to_date('21/06/08','RR/MM/DD'),900,'2','예매취소',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (48,3900,to_date('21/06/08','RR/MM/DD'),900,'2','예매취소',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (49,4800,to_date('21/06/08','RR/MM/DD'),900,'1','영화예매',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (50,6500,to_date('21/06/08','RR/MM/DD'),1700,'1','영화예매',1);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (51,1900,to_date('21/06/23','RR/MM/DD'),900,'1','영화예매',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (52,1000,to_date('21/06/23','RR/MM/DD'),900,'2','예매취소',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (53,1900,to_date('21/06/23','RR/MM/DD'),900,'1','영화예매',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (54,1000,to_date('21/06/23','RR/MM/DD'),900,'2','예매취소',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (55,1900,to_date('21/06/23','RR/MM/DD'),900,'1','영화예매',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (56,1000,to_date('21/06/23','RR/MM/DD'),900,'2','예매취소',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (57,1900,to_date('21/06/23','RR/MM/DD'),900,'1','영화예매',2);
Insert into POINT (PT_NO,PT_POINT,PT_DATE,PT_USEDPOINT,PT_TYPE,PT_STR,M_NO) values (58,1000,to_date('21/06/23','RR/MM/DD'),900,'2','예매취소',2);

/* PRODUCT */
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (2,'더블치즈팝콘(L)','images/ScheezpopL.png',6000,'더블치즈팝콘(L)',100,2);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (1,'CGV콤보','images/Scombo1.png',8000,'CGV콤보(8500->8000)',100,1);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (3,'코카콜라(L)','images/ScokeL.png',2500,'코카콜라(L)',100,3);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (4,'코카콜라(M)','images/ScokeM.png',2000,'코카콜라(M)',100,3);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (5,'달콤팝콘(L)','images/SdalcompopL.png',5500,'달콤팝콘(L)',100,2);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (6,'달콤팝콘(M)','images/SdolcompopM.png',5000,'달콤팝콘(M)',100,2);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (7,'크리미갈릭핫도그','images/Shot.png',4500,'크리미갈릭핫도그',100,4);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (8,'핫도그콤보','images/Shotcombo.png',10500,'핫도그콤보',100,1);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (9,'칠리치즈나쵸','images/Snacho.PNG',4500,'칠리치즈나쵸',100,4);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (10,'칠리치즈나쵸콤보','images/Snachocombo.png',11000,'칠리치즈나쵸콤보',100,1);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (11,'즉석구이오징어(몸통)','images/Sozing.png',4500,'즉석구이오징어(몸통)',100,4);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (12,'즉석구이콤보','images/Sozingcombo.png',11000,'즉석구이콤보',100,1);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (13,'오렌지환타(L)','images/SorangeL.png',2500,'오렌지환타(L)',100,3);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (14,'오렌지환타(M)','images/SorangeM.png',2000,'오렌지환타(M)',100,3);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (15,'스프라이트(L)','images/spL.png',2500,'스프라이트(L)',100,3);
Insert into PRODUCT (P_NO,P_NAME,P_IMAGE,P_PRICE,P_CONTENT,P_DESC,P_TYPE) values (16,'스프라이트(M)','images/spM.png',2000,'스프라이트(M)',100,3);

/* PRODUCTORDER */
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (33,5,to_date('21/04/15','RR/MM/DD'),40000,1,1);
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (32,4,to_date('21/04/15','RR/MM/DD'),32000,1,1);
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (38,1,to_date('21/06/03','RR/MM/DD'),8000,1,1);
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (35,7,to_date('21/04/15','RR/MM/DD'),56000,1,1);
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (36,8,to_date('21/04/15','RR/MM/DD'),64000,1,1);
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (37,1,to_date('21/05/21','RR/MM/DD'),8000,1,1);
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (39,1,to_date('21/06/08','RR/MM/DD'),8000,1,1);
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (40,1,to_date('21/06/19','RR/MM/DD'),8000,1,1);
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (41,1,to_date('21/06/19','RR/MM/DD'),8000,1,1);
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (42,1,to_date('21/06/19','RR/MM/DD'),10500,8,1);
Insert into PRODUCTORDER (PO_NO,PO_COUNT,PO_DATE,P_TOT,P_NO,M_NO) values (43,2,to_date('21/06/19','RR/MM/DD'),21000,8,1);

/* RESERVATION */
Insert into RESERVATION (R_NO,R_THEATER,R_VIEWDATE,R_TIME,R_PRICE,R_PERSONS,R_SEAT,R_AGE,M_NO,MV_NO) values (19,'2관',to_date('21/06/11','RR/MM/DD'),'12:00',17000,2,'D4,D6','청소년',1,8);
Insert into RESERVATION (R_NO,R_THEATER,R_VIEWDATE,R_TIME,R_PRICE,R_PERSONS,R_SEAT,R_AGE,M_NO,MV_NO) values (18,'1관',to_date('21/06/11','RR/MM/DD'),'18:00',9000,1,'G4','일반',1,6);

/* REVIEW */
Insert into REVIEW (REV_NO,REV_TITLE,REV_CONTENT,REV_DATE,M_NO,MV_NO,REV_RATING,REV_COUNT) values (5,'t_3','t_3',to_date('21/06/03','RR/MM/DD'),1,8,1,0);
Insert into REVIEW (REV_NO,REV_TITLE,REV_CONTENT,REV_DATE,M_NO,MV_NO,REV_RATING,REV_COUNT) values (3,'t_1','t_1',to_date('21/06/03','RR/MM/DD'),1,8,3,0);
Insert into REVIEW (REV_NO,REV_TITLE,REV_CONTENT,REV_DATE,M_NO,MV_NO,REV_RATING,REV_COUNT) values (4,'t_2','t_2',to_date('21/06/03','RR/MM/DD'),1,8,5,0);
Insert into REVIEW (REV_NO,REV_TITLE,REV_CONTENT,REV_DATE,M_NO,MV_NO,REV_RATING,REV_COUNT) values (6,'t_4','t_4',to_date('21/06/03','RR/MM/DD'),1,8,2,0);
Insert into REVIEW (REV_NO,REV_TITLE,REV_CONTENT,REV_DATE,M_NO,MV_NO,REV_RATING,REV_COUNT) values (7,'t_5','t_5',to_date('21/06/03','RR/MM/DD'),1,8,4,0);