drop table ITEM_ANSWER

create table ITEM_ANSWER(
	ITEM_ANSWER_NUM number primary key,
	ITEM_ANSWER_USERNAME varchar2(15) references member(MEMBER_ID) on delete cascade,
	ITEM_ANSWER_CONTENT VARCHAR(1000) ,
	ITEM_ANSWER_DATE DATE DEFAULT SYSDATE,
	ITEM_ANSWER_ASK_NUM number(15) references ITEM_ASK(ITEM_ASK_NUM) on delete cascade
);

select * from ITEM_ANSWER