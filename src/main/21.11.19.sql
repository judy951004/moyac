drop table member;
create table member (
    id    VARCHAR2(30) PRIMARY KEY NOT NULL,
    password    VARCHAR2(20) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    nick_name    VARCHAR2(20) NOT NULL,
    phone    VARCHAR2(20) NOT NULL,
    gender    CHAR(2) default 'm' NOT NULL,
    age    NUMBER(3) NOT NULL,
    email VARCHAR2(20) NOT NULL,
    reg_date    DATE NOT NULL,
    del    CHAR(1) default 'n' NOT NULL
);
select * from member where nick_name = '1';
delete from member where id = '1';
update member set del = 'n' where id = 'admin'  


drop table board_QnA;
create table board_QnA (
	boardno    NUMBER  PRIMARY KEY NOT NULL,    
    subject VARCHAR2(100) NOT NULL,
    content    VARCHAR2(4000) NOT NULL,
    reg_date    DATE NOT NULL,
    read_cnt    NUMBER default 0 NOT NULL,
    re_level	number NOT NULL,
    re_step	number NOT NULL,
    ref	number NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    id    varchar2(100) references member NOT NULL
);
select * from board_QnA;
delete from board_QnA where id = '1';
update board_QnA set del = 'n' where id = 'admin'  


drop table medicine;
create table medicine (
    me_no    number PRIMARY KEY NOT NULL,
    me_name    VARCHAR2(20) NOT NULL,
    me_color    VARCHAR2(20) NOT NULL,
    me_shape    VARCHAR2(20) NOT NULL,
    me_formulation    VARCHAR2(20) NOT NULL,
    me_pic    varchar2(200) NOT NULL,
    me_effect    varchar2(300) NOT NULL,
    me_capacity VARCHAR2(200) NOT NULL,
    me_sales    varchar2(20) NOT NULL,
    del    CHAR(1) default 'n' NOT NULL
);
select * from medicine;
delete from medicine where me_no = 1;
update medicine set del = 'n' where me_no = 1


drop table reply_board;
create table reply_board (
	reply_no    NUMBER  PRIMARY KEY NOT NULL,
    content    VARCHAR2(4000) NOT NULL,
    reg_date    DATE NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    id    varchar2(100),
    boardno    number
);
select * from REPLY_board;
insert into reply  values (1,'내용',sysdate,0,'n','admin',64);


CREATE TABLE QnALikes
(
    id    varchar2(20) references member NOT NULL,
    boardno    NUMBER references board_QnA NOT NULL
);
select * from QnALikes;

drop table MedicineBookmark;

CREATE TABLE bookmark
(
    id    varchar2(30) references member NOT NULL,
    me_no    NUMBER  references medicine NOT NULL
);
drop table bookmark;
select * from Bookmark;