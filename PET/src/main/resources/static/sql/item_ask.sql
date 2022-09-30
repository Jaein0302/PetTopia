drop table ITEM_ASK

create table ITEM_ASK(
	ITEM_ASK_NUM 		number(15) primary key,
	ITEM_ASK_USERNAME 	varchar2(15),
	ITEM_ASK_ITEMID 	number(15) references ITEM(ITEM_ID) on delete cascade,
	ITEM_ASK_SUBJECT 	varchar2(100),
	ITEM_ASK_CONTENT 	varchar2(1000),
	ITEM_ASK_DATE date default sysdate
);


select * from ITEM_ASK

insert into item_ask
