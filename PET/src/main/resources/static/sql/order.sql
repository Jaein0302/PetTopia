drop table ORDERINFO cascade constraints purge;

create table ORDERINFO(
ORDER_ID         NUMBER(15) PRIMARY KEY,
ITEM_ID      number(30) references item(item_id) on delete cascade,
MEBER_ID      varchar2(20) references member(member_id) on delete cascade,
order_amount number(10),
order_price number(10)
)

insert into orderInfo
values (1, 20001, 'buyer1', 1, 1000)

select * from ORDERINFO