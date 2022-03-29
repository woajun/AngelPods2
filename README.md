# jsp_angelPods

# 생성쿼리
CREATE TABLE `category` (
	`cNum` INT NULL,
	`name` VARCHAR(50) NULL DEFAULT NULL,
	`idx` INT NULL
);

CREATE TABLE 'category_detail` (
	'cdNum' INT NULL,
	'cNum' INT,
	'name' VARCHAR(50),
	'needSN' VARCHAR(50),
	'idx' INT
);

CREATE TABLE 'device'(
	'devNum' INT
	'userId' VARCHAR
	'cdNUM' INT
	'bodySN' VARCHAR
	'rDate' DATE
	'thumbnail'
	'leftSN'
	'rightSN'
);

CREATE TABLE 'devimg'(
	'imageSystemName' VARCHAR,
	'imageName' VARCHAR,
	'dNum' INT,
	'idx' INT
);

CREATE TABLE 'find_borad' (
	'fbNum" INT,
	'userId' VARCHAR,
	'cNum' INT,
	'cdNum' INT,
	'timestampe' date,
	'sido' VARCHAR,
	'gue' VARCHAR,
	'dong' VARCHAR,
	'addrDetail' VARCHAR,
	'title' VARCHAR,
	'contents' VARCHAR,
	'sn' VARCHAR,
	'lat' VARCHAR,
	'lng' VARCHAR,
	'chatHit' INT,
	'hit' INT,
	'fState' INT,
	'cName' VARCHAR,
	'cdName' VARCHAR,
	'thumbnailImage' VARCHAR,
