drop table community cascade constraints purge;

create table community(
COMMU_NUM NUMBER primary key,   					--글번호
COMMU_NAME VARCHAR2(15) references member(MEMBER_ID),--글쓴이
COMMU_SUBJECT VARCHAR2(300),   						--제목
COMMU_CONTENT VARCHAR2(4000),   					--내용
COMMU_READCOUNT NUMBER,         					--조회수
COMMU_DATE DATE,            						--작성날짜
COMMU_THUMBNAIL VARCHAR2(100),  					--대표 이미지
COMMU_FILE VARCHAR2(100),      						--파일이름
COMMU_ORIGINAL VARCHAR2(100)
);
