drop table ORDERINFO cascade constraints purge;

create table ORDERINFO(
order_id     	NUMBER(15) PRIMARY KEY,			--주문번호
order_member_id references member(member_id) on delete cascade, --주문아이디
order_item_id   references item(item_id) on delete cascade,	 --상품번호
order_item_sellerName varchar2(50), --판매자의 이름
order_item_name varchar2(50), --상품이름
order_item_price number(10), --상품가격
order_time varchar2(100), --예약 시간
order_location varchar2(100), --장소
order_image      VARCHAR2(100) --썸네일
)

delete ORDERINFO

<<<<<<< HEAD
select * from ORDERINFO
=======
insert into orderInfo values (10000001, 'buyer1', 10001, '해피동물병원', '예방주사',20000,'2022. 10. 05. 10:30','서울 종로구 종로 1 (종로1가)', null);
insert into orderInfo values (10000002, 'buyer1', 10001, '해피동물병원', '예방주사',20000,'2022. 10. 07. 11:08','서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg');
insert into orderInfo values (10000003, 'buyer1', 10001, '해피동물병원', '예방주사',20000,'2022. 10. 08. 14:08','서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg');
insert into orderInfo values (10000004, 'user1', 10001, '해피동물병원', '예방주사4',20000,'2022. 10. 07. 16:08','서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg');
insert into orderInfo values (10000005, 'user1', 10001, '해피동물병원', '예방주사5',20000,'2022. 10. 07. 11:08','서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg');
insert into orderInfo values (10000006, 'user1', 10001, '해피동물병원', '예방주사6',20000,'2022. 10. 07. 12:08','서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg');
insert into orderInfo values (10000007, 'user1', 10001, '해피동물병원', '예방주사6',20000,'2022. 10. 07. 12:08','서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg');


select * from ORDERINFO where to_char(sysdate, 'YYYY. MM. DD. HH:MI') > order_time
select to_char(sysdate, 'YYYY. MM. DD. HH24:MI') from dual

>>>>>>> branch 'main' of https://github.com/ahslxj1993/Pet_Topia.git

