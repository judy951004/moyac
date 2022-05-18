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

create table board_notice (
	boardno    NUMBER  PRIMARY KEY NOT NULL,    
    subject VARCHAR2(100) NOT NULL,
    content    VARCHAR2(4000) NOT NULL,
    reg_date    DATE NOT NULL,
    read_cnt    NUMBER default 0 NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    id    varchar2(100) references member NOT NULL
);

create table board_event (
	boardno    NUMBER  PRIMARY KEY NOT NULL,    
    subject VARCHAR2(100) NOT NULL,
    content    VARCHAR2(4000) NOT NULL,
    reg_date    DATE NOT NULL,
    read_cnt    NUMBER default 0 NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    id    varchar2(100) references member NOT NULL
);

create table reply (
    content    VARCHAR2(4000) NOT NULL,
    reg_date    DATE NOT NULL,
    read_cnt    NUMBER default 0 NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    id    varchar2(100) references member NOT NULL,
    boardno    number references board_event NOT NULL
);

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

CREATE TABLE bookmark
(
    bm_no    NUMBER PRIMARY KEY NOT NULL,
    id    varchar2(20) references member NOT NULL,
    me_no    NUMBER  references medicine NOT NULL
);