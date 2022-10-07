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
)

insert into orderInfo
values (1, 20001, 'buyer1', 1, 1000)

select * from ORDERINFO

