# jsp_angelPods

# 생성쿼리
CREATE TABLE category (
	c_num INT,
	name VARCHAR(255),
	idx INT
);

CREATE TABLE category_detail (
	cd_num INT,
	c_num INT,
	name VARCHAR(255),
	need_sn VARCHAR(255),
	idx INT
);

CREATE TABLE device(
	devNum INT,
	userId VARCHAR(255),
	cd_num INT,
	bodySN VARCHAR(255),
	rDate DATE,
	thumbnail VARCHAR(255),
	leftSN VARCHAR(255),
	rightSN VARCHAR(255)
);

CREATE TABLE devimg(
	imageSystemName VARCHAR(255),
	imageName VARCHAR(255),
	dNum INT,
	idx INT
);

CREATE TABLE find_board (
	fb_num INT,
	userId VARCHAR(255),
	c_num INT,
	cd_num INT,
	timestamp timestamp,
	sido VARCHAR(255),
	gue VARCHAR(255),
	dong VARCHAR(255),
	addrDetail VARCHAR(255),
	title VARCHAR(255),
	contents VARCHAR(255),
	sn VARCHAR(255),
	lat VARCHAR(255),
	lng VARCHAR(255),
	chat_hit INT,
	hit INT,
	f_state INT,
	cName VARCHAR(255),
	cdName VARCHAR(255),
	thumbnailImage VARCHAR(255)
);

create table fimages (
	imageSystemName VARCHAR(255),
	imageName VARCHAR(255),
	fb_num INT,
	idx INT
);

CREATE TABLE lost_board (
	lb_num INT,
	userId VARCHAR(255),
	c_num INT,
	cd_num INT,
	date timestamp,
	sido VARCHAR(255),
	gue VARCHAR(255),
	dong VARCHAR(255),
	addrDetail VARCHAR(255),
	title VARCHAR(255),
	contents VARCHAR(255),
	sn VARCHAR(255),
	lat VARCHAR(255),
	lng VARCHAR(255),
	chatHit INT,
	hit INT,
	fState INT,
	cName VARCHAR(255),
	cdName VARCHAR(255),
	thumbnailImage VARCHAR(255)
);

create table limages (
	imageSystemName VARCHAR(255),
	imageName VARCHAR(255),
	lbNum INT,
	idx INT
);

create table member (
	userId VARCHAR(255),
	pw VARCHAR(255),
	name VARCHAR(255),
	eMail VARCHAR(255),
	rDate timestamp,
	addr VARCHAR(255),
	rankId INT,
	lat VARCHAR(255),
	lng VARCHAR(255),
	profilImage VARCHAR(255)
);

create table mimages (
	imageSystemName VARCHAR(255),
	imageName VARCHAR(255),
	userId VARCHAR(255)
);

create table myborad (
	brdName VARCHAR(255),
	cd_num INT,
	title VARCHAR(255),
	rDate VARCHAR(255)
);

create table RankDto (
	rankId INT,
	rank VARCHAR(255)
);

# 초기화 쿼리
INSERT INTO jspangelpods.category (`c_num`, `name`, `idx`) VALUES ('0', '무선이어폰', '0');
INSERT INTO jspangelpods.category (`c_num`, `name`, `idx`) VALUES ('1', '지갑', '1');


INSERT INTO jspangelpods.category_detail (`cd_num`, `c_num`, `name`, `need_sn`, `idx`) VALUES ('0', '0', '에어팟 1,2세대', 'Y', '0');
INSERT INTO jspangelpods.category_detail (`cd_num`, `c_num`, `name`, `need_sn`, `idx`) VALUES ('1', '0', '에어팟 프로', 'Y', '1');
INSERT INTO jspangelpods.category_detail (`cd_num`, `c_num`, `name`, `need_sn`, `idx`) VALUES ('2', '0', '에어팟 버즈', 'Y', '2');