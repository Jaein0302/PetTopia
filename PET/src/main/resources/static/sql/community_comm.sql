drop table COMMUNITY_COMM cascade constraints purge;
drop sequence comm_seq;

create table COMMUNITY_COMM(
COMMENT_NUM       number       primary key,
COMMENT_NAME      varchar2(30) references member(MEMBER_ID),
COMMENT_CONTENT      varchar2(200),
COMMENT_DATE      date,
COMMENT_COMMU_NUM  references community(COMMU_NUM) on delete cascade
                                 --COMMUNITY_COMM테이블이 참조하는 보드 글 번호
);

--댓글 시퀀스
create sequence comm_seq;