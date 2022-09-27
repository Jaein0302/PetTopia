
drop table ITEM cascade constraints purge;

create table ITEM (
   ITEM_ID         VARCHAR2(15) PRIMARY KEY,
   ITEM_NAME      VARCHAR2(30) NOT NULL,
   ITEM_CATEGORY      VARCHAR2(30) NOT NULL,
   ITEM_PRICE      NUMBER(20) NOT NULL,
   ITEM_CONTENT      VARCHAR2(1000) NOT NULL,
   ITEM_IMAGE      VARCHAR2(100), -- NOT NULL,
   ITEM_REG_DATE     DATE DEFAULT SYSDATE,  --  NOT NULL,
   ITEM_RSV_DATE    DATE DEFAULT SYSDATE,  --  NOT NULL,  -- 예약날짜
   ITEM_SCORE      NUMBER(20),  -- 후기
   ITEM_SEX         VARCHAR2(10), -- 남, 여  
   ITEM_WEIGHT      VARCHAR2(5), -- L, M, S (수정)
   ITEM_SPECIES      VARCHAR2(10) -- dog, cat
   
   --판매자 정보는 어디에 들어가야 할까
);
select * from item;

drop sequence item_seq
create sequence item_seq start with 1 increment by 1;

insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 150000,'슬개골 탈구 수술', '남', 'L', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 50000, '슬개골 탈구 수술', '남', 'S', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 55000, '슬개골 탈구 수술', '여', 'S', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 80000, '슬개골 탈구 수술', '여', 'S', 'cat' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 200000, '슬개골 탈구 수술', '남', 'M', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 100000, '슬개골 탈구 수술', '남', 'M', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '종양수술', 'treat', 250000, '이개혈종 수술', '남', 'L', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '종양수술', 'treat', 150000, '이개혈종 수술', '여', 'L', 'cat' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '종양수술', 'treat', 150000, '이개혈종 수술', '남', 'L', 'cat' );


insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '기초애견훈련', 'education', 50000, '강아지와 함께 살아가기 위한 필수 훈련');
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '올바른 산책방법', 'education', 60000, '산책 시간이 더 안전하고 재밌도록');
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '펫티켓', 'education', 70000, '반려견이 지켜야 할 에티켓');

insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '소형견 미용', 'beauty', 30000, '전문가 선생님의 손길로 예쁘게');
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '중형견 미용', 'beauty', 50000, '섬세한 특수견 미용');
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '반려묘 미용', 'beauty', 50000, '안전한 고양이 마취 미용');


      select *  
      from item
      where ITEM_CATEGORY = 'treat'


