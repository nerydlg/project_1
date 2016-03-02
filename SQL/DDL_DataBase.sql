/************************************
 **		Start with table creation ***
 ************************************/

USE SiteBuilder;

/************************************
 ** Delete all tables if exists   ***
 ************************************/
 DROP TABLE IF EXISTS permission_match;
 DROP TABLE IF EXISTS user_permision;
 DROP TABLE IF EXISTS user_grp;
 DROP TABLE IF EXISTS user;

/************************************
 ** Users and Permissions 		  ***
 ************************************/ 
CREATE TABLE user_permision(
	permission_id	INTEGER	UNSIGNED	NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	permission 		VARCHAR(8)			NOT NULL, 	-- PERMISSION IN FORMAT '#######'
	permission_desc	VARCHAR(20)			NOT NULL 	-- DESCRIPTINO OF DE PERMISSION 	
);

CREATE TABLE user_grp(
	grp_id			INTEGER UNSIGNED 	NOT NULL	AUTO_INCREMENT	PRIMARY	KEY,
	grp_name		VARCHAR(15)			NOT NULL,
	start_date		TIMESTAMP			NOT NULL,
	end_date		TIMESTAMP			NULL
);

CREATE TABLE permission_match(
	pm_id 			INTEGER UNSIGNED	NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	grp_id			INTEGER	UNSIGNED	NOT NULL,
	permission_id	INTEGER	UNSIGNED	NOT NULL,
	CONSTRAINT	FOREIGN KEY	(grp_id)		REFERENCES	user_grp(grp_id),
	CONSTRAINT	FOREIGN KEY	(permission_id)	REFERENCES	user_permision(permission_id)	
);

CREATE TABLE users(
	user_id			INTEGER	UNSIGNED	NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	username		VARCHAR(20)			NOT NULL,
	password 		VARCHAR(80)			NOT NULL, 	-- ENCRYPT PASSWORD	
	user_mail		VARCHAR(80)			NOT NULL,
	real_name		VARCHAR(80)			NULL	,
	user_grp		INTEGER	UNSIGNED	NOT NULL,
	start_date		TIMESTAMP			NOT NULL,
	end_date		TIMESTAMP			NULL, 
	CONSTRAINT FOREIGN KEY	(user_grp)		REFERENCES	user_grp(grp_id)
);


/*************************************
 ** 
