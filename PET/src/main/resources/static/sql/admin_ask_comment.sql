drop table Abn cascade constraints purge;
 
 drop table Aac cascade constraints purge;
 CREATE TABLE Aac(
 AAC_NUMBER NUMBER references Aam(AAM_NUMBER) on delete cascade,
 AAC_CONTENT VARCHAR2(4000),
 AAC_DATE DATE
);

          
          
          
   
   