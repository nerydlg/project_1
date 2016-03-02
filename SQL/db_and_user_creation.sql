/**********************************
 **		DDL Database Creation	***
 **********************************/ 

CREATE DATABASE IF NOT EXISTS SiteBuilder;

/***********************************
 **		User Creation			****
 ***********************************/

 DROP USER IF EXISTS siteBuilderUsr;

 CREATE USER siteBuilderUsr 
 	IDENTIFIED BY PASSWORD 'P4$$w0rd#1';

/***********************************
 **		Grant User Permissions	 ***
 ***********************************/
GRANT SELECT, UPDATE, INSERT, TRIGGER, EXECUTE ON SiteBuilder.* TO 'siteBuilderUsr'@'localhost'
				IDENTIFIED BY PASSWORD 'P4$$w0rd#1';